package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BookNotFoundException;
import com.BookStore.Models.Book;
import com.BookStore.Models.User;
import com.BookStore.Repository.BookRepo;

@WebServlet("/books/detail")
public class BookDetail extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {

            User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

            if (user == null) {
                return;
            }
            
            BookRepo repo = new BookRepo();
            String id = request.getParameter("id");

            if(id == null) {
                request.setAttribute("message", "book id not found!");
                request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            Book book = repo.getBook(Integer.parseInt(id));

            request.setAttribute("user", user);
            request.setAttribute("book", book);
            request.getServletContext().getRequestDispatcher("/book_detail.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException | BookNotFoundException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

}
