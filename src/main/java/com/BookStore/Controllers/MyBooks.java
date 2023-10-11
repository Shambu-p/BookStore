package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Models.Order;
import com.BookStore.Models.User;
import com.BookStore.Repository.OrderRepo;

@WebServlet("/books/my_books")
public class MyBooks extends HttpServlet {
    
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);
		if (user == null) {
			return;
		}

		try {

            OrderRepo repo  = new OrderRepo();
			ArrayList<Order> orders = repo.orders(null, user.Id);
			
			request.setAttribute("orders", orders);
			request.setAttribute("user", user);
			request.getServletContext().getRequestDispatcher("/bought_list.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("message", e.getMessage());
			request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
