package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Models.Book;
import com.BookStore.Models.User;
import com.BookStore.Repository.BookRepo;

@WebServlet("/books")
public class BookList extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);
		if (user == null) {
			return;
		}

		try {

            BookRepo repo  = new BookRepo();
			ArrayList<Book> books = repo.getBooks("", "", "");

			request.setAttribute("books", books);
			request.setAttribute("user", user);
			request.getServletContext().getRequestDispatcher("/list.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("message", e.getMessage());
			request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
