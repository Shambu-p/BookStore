package com.BookStore.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.BookStore.Models.Book;
import com.BookStore.Models.Order;

public class OrderRepo {
    
    private Connection Database;
	
	public OrderRepo() throws ClassNotFoundException, SQLException {
		this.Database = new Database().getConnection();
	}

    public Boolean newOrder(Order new_order) throws SQLException {
		
		String query = "insert into orders (book_id, total_price, quantity, user_id) values (?,?,?,?)";
		PreparedStatement pst = this.Database.prepareStatement(query);
		pst.setInt(1, new_order.BookId);
		pst.setDouble(2, new_order.TotalPrice);
		pst.setInt(3, new_order.Quantity);
		pst.setInt(4, new_order.UserId);

		return pst.executeUpdate() > 0;

	}

    public ArrayList<Order> orders(Integer book_id, Integer user_id) throws SQLException {

        String query = "select * from orders ";
		ArrayList<Order> orders = new ArrayList<Order>();
		
		if(book_id != null) {
			query += "where book_id = " + book_id;
		}

		if(user_id != null) {
			query += ((book_id.equals(null) ? "where " : " or ") + "user_id = " + user_id );
		}

		PreparedStatement pst = this.Database.prepareStatement(query);
		ResultSet rs = pst.executeQuery();

		while(rs.next()) {

			Order found_order = new Order();
			found_order.Id = rs.getInt("id");
			found_order.BookId = rs.getInt("book_id");
			found_order.UserId = rs.getInt("user_id");
			found_order.TotalPrice = rs.getDouble("total_price");
			found_order.Quantity = rs.getInt("quantity");

            orders.add(found_order);

		}

		return orders;

	}

}
