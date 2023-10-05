package com.BookStore.Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	
	public static Connection connection = null;
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		
		if(Database.connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Database.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store","root" ,"");
		}
		
		return connection;
		
	}
	
}








































































































