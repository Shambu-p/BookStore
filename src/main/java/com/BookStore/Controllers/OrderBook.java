package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BookNotAvailable;
import com.BookStore.Exceptions.BookNotFoundException;
import com.BookStore.Models.Book;
import com.BookStore.Models.Order;
import com.BookStore.Models.User;
import com.BookStore.Repository.BookRepo;
import com.BookStore.Repository.OrderRepo;
import com.BookStore.Repository.UserRepo;

@WebServlet("/books/order")
public class OrderBook extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User authUser = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

        if(authUser == null){
            return;
        }

        if(request.getParameter("id") == null) {
            request.setAttribute("message", "book id were not set");
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        
        try {
            
            int book_id = Integer.parseInt(request.getParameter("id"));
            BookRepo repo = new BookRepo();
            Book bk = repo.getBook(book_id);

            request.setAttribute("user", authUser);
            request.setAttribute("book", bk);
            request.getServletContext().getRequestDispatcher("/order_form.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (BookNotFoundException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        ArrayList<String> roles = new ArrayList<String>();
        roles.add("user");
        User authUser = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, roles);
        
        Order order = new Order();
        try {

           
            BookRepo book_repo = new BookRepo();
            OrderRepo order_repo = new OrderRepo();
    
            order.BookId = Integer.parseInt(request.getParameter("book_id"));
            order.Quantity = Integer.parseInt(request.getParameter("quantity"));
            order.Book = book_repo.getBook(order.BookId);
            order.TotalPrice = order.Quantity * order.Book.Price;
            order.UserId = authUser.Id;
            order.User = authUser;
    
            order_repo.newOrder(order);

            order.Book.Quantity -= order.Quantity;
            
            request.setAttribute("success_alert", "Book has been ordered Successfully!");
            request.setAttribute("book", order.Book);
            request.setAttribute("user", authUser);
            request.getServletContext().getRequestDispatcher("/order_form.jsp").forward(request, response);

        } catch (BookNotAvailable | BookNotFoundException ex) {
            request.setAttribute("book", order.Book);
            request.setAttribute("user", authUser);
            request.setAttribute("error_alert", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/order_form.jsp").forward(request, response);
            
        } catch (ClassNotFoundException | SQLException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

}
