package com.BookStore.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.BookStore.Exceptions.BookNotAvailable;
import com.BookStore.Models.Book;
import com.BookStore.Models.Order;

public class OrderRepo {

	private Connection Database;

	public OrderRepo() throws ClassNotFoundException, SQLException {
		this.Database = new Database().getConnection();
	}

	public Boolean newOrder(Order new_order) throws SQLException, BookNotAvailable, ClassNotFoundException {

		if (new_order.Book.Quantity < new_order.Quantity) {
			throw new BookNotAvailable();
		}

		String query = "insert into orders (book_id, total_price, quantity, user_id) values (?,?,?,?)";
		PreparedStatement pst = this.Database.prepareStatement(query);
		pst.setInt(1, new_order.BookId);
		pst.setDouble(2, new_order.TotalPrice);
		pst.setInt(3, new_order.Quantity);
		pst.setInt(4, new_order.UserId);

		if (pst.executeUpdate() > 0) {
			BookRepo bk = new BookRepo();
			new_order.Book.Quantity -= new_order.Quantity;
			return bk.updateBook(new_order.Book);
		}

		return false;

	}

	public ArrayList<Order> orders(Integer book_id, Integer user_id) throws SQLException {

		String query = "select " +
				"O.id as o_id, O.quantity as o_quantity, O.total_price as o_total_price, O.user_id as o_user_id, O.book_id as o_book_id, B.id as b_id, B.Bname as b_Bname, B.Btype as b_Btype, B.Bprice as b_Bprice, B.Author as b_Author, B.a_quantity as b_a_quantity, B.description as b_description, B.cover as b_cover, B.user_id as b_user_id"
				+ " from orders O join booklist B on O.book_id = B.id ";
		ArrayList<Order> orders = new ArrayList<Order>();

		if (book_id != null) {
			query += "where O.book_id = " + book_id;
		}

		if (user_id != null) {
			query += ((book_id == null ? "where " : " or ") + "O.user_id = " + user_id);
		}

		PreparedStatement pst = this.Database.prepareStatement(query);
		ResultSet rs = pst.executeQuery();

		// throw new SQLException(query, query, 0, null);
		while (rs.next()) {

			Order found_order = new Order();
			found_order.Id = rs.getInt("o_id");
			found_order.BookId = rs.getInt("o_book_id");
			found_order.UserId = rs.getInt("o_user_id");
			found_order.TotalPrice = rs.getDouble("o_total_price");
			found_order.Quantity = rs.getInt("o_quantity");

			found_order.Book = new Book();
			found_order.Book.Id = rs.getInt("b_id");
			found_order.Book.Name = rs.getString("b_Bname");
			found_order.Book.Author = rs.getString("b_Author");
			found_order.Book.Price = rs.getDouble("b_Bprice");
			found_order.Book.BookType = rs.getString("b_Btype");
			found_order.Book.Quantity = rs.getInt("b_a_quantity");
			found_order.Book.UserId = rs.getInt("b_user_id");
			found_order.Book.Description = rs.getString("b_description");
			found_order.Book.Cover = rs.getString("b_cover");

			found_order.User = null;

			orders.add(found_order);

		}

		return orders;

	}

}
