package com.BookStore.Repository;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.Cookie;

import com.BookStore.Exceptions.BSNotAuthenticated;
import com.BookStore.Exceptions.BSNotFound;
import com.BookStore.Models.User;

public class UserRepo {
	
	Connection Database;
	
	public UserRepo() throws ClassNotFoundException, SQLException {
		Database = new Database().getConnection();
	}
	
	public User login(String email, String password) throws SQLException, BSNotFound {

		String query = "select * from signup where uemail = ?";
		User found_user = new User();
		
		PreparedStatement pst = this.Database.prepareStatement(query);
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			if(password.equals(rs.getString("upwd"))) {
				
				found_user.Id = rs.getInt("id");
				found_user.Name = rs.getString("uname");
				found_user.Email = rs.getString("uemail");
				found_user.Password = rs.getString("upwd");
				found_user.Mobile = rs.getString("umobile");
				return found_user;
				
			}
		}
		
		throw new BSNotFound();
		
	}
	
	public boolean addUser(User temp_user) throws SQLException {
		
		PreparedStatement pst = this.Database.prepareStatement("insert into signup(uname, upwd, uemail, umobile) values(?,?,?,?)");
		pst.setString(1, temp_user.Name);
		pst.setString(2, temp_user.Password);
		pst.setString(3, temp_user.Email);
		pst.setString(4, temp_user.Mobile);
		
		return pst.executeUpdate() > 0;
		
	}
	
	public boolean updateUser(User user) throws SQLException {
		
		PreparedStatement pst = this.Database.prepareStatement("update signup "
				+ "set uname = ?, uemail = ?, umobile = ?"
				+ "where id = ?");
		pst.setString(1, user.Name);
		pst.setString(3, user.Email);
		pst.setString(4, user.Mobile);
		pst.setInt(5, user.Id);
		
		return pst.executeUpdate() > 0;
		
	}
	
	public ArrayList<User> getUsers(String name, String email, String mobile) throws SQLException {
		
		String query = "select * from signup ";
		ArrayList<User> users = new ArrayList<User>();
		
		if(!name.equals("")) {
			query += "where uname = '" + name +"'";
		}
		
		if(!email.equals("")) {
			query += ((name.equals("") ? "where " : " or ") + "uemail = '" + email +"'");
		}
		
		if(!mobile.equals("")) {
			query += (((name.equals("") && email.equals("")) ? "where " : ", ") + "umobile = '" + mobile +"'");
		}
		
		PreparedStatement pst = this.Database.prepareStatement(query);
		
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			
			User found_user = new User();			
			found_user.Name = rs.getString("uname");
			found_user.Email = rs.getString("email");
			found_user.Password = rs.getString("upwd");
			found_user.Mobile= rs.getString("umobile");
			users.add(found_user);
			
		}
		
		return users;
		
	}
	
	public User getUser(int id) throws SQLException, BSNotFound {
		
		String query = "select * from signup where id = ?";
		PreparedStatement pst = this.Database.prepareStatement(query);
		pst.setInt(1, id);
		
		ResultSet rs = pst.executeQuery();

		if(!rs.next()) {
			throw new BSNotFound();
		}
		
		User found_user = new User();
		found_user.Id = rs.getInt("id");
		found_user.Name = rs.getString("uname");
		found_user.Email = rs.getString("uemail");
		found_user.Password = rs.getString("upwd");
		found_user.Mobile= rs.getString("umobile");

		return found_user;
		
	}
	
	public User authenticatedUser(Cookie[] cookies) throws Exception {
		
		for(Cookie cookie : cookies) {
			if("user".equals(cookie.getName())) {
				return this.getUser(Integer.parseInt(cookie.getValue()));
			}
		}
		
		throw new BSNotAuthenticated();
		
	}
}