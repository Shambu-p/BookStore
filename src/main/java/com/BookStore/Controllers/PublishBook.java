package com.BookStore.Controllers;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.BookStore.Models.Book;
import com.BookStore.Models.User;
import com.BookStore.Repository.BookRepo;

@WebServlet("/books/publish")
@MultipartConfig
public class PublishBook extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

        if (user == null) {
            return;
        }

        request.setAttribute("user", user);
        request.getServletContext().getRequestDispatcher("/create_book.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

        if (user == null) {
            return;
        }
 
        try {

            Book new_book = new Book();
            BookRepo repo = new BookRepo();
            Part filePart = request.getPart("cover");

            new_book.Name = request.getParameter("title");
            new_book.Description = request.getParameter("description");
            new_book.BookType = request.getParameter("type");
            new_book.Quantity = Integer.parseInt(request.getParameter("quantity"));
            new_book.Price = Double.parseDouble(request.getParameter("price"));
            new_book.Author = request.getParameter("author_name");
            new_book.UserId = Integer.parseInt(request.getParameter("user_id"));

            // Get the file name.
            // String fileName = filePart.getSubmittedFileName();
            // String[] name_splite = filePart.getSubmittedFileName().split(".");
            new_book.Cover = "bk_" + new_book.Name.trim();
            // Create a path to the save location.
            String home_address = "D:\\book_store\\BookStore\\";
            // String home_address = "/home/abnet/Documents/Projects/BookStore/demo/";
            // Path savePath = Paths.get(home_address + "/src/main/resources/book_covers", new_book.Cover);
            Path savePath = Paths.get(home_address + "\\src\\main\\resources\\book_covers", new_book.Cover);

            // Save the file.
            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, savePath);

            // save the book detail to the database
            repo.addBook(new_book);

            request.setAttribute("success_alert", "Book Created Successfully!");
            request.setAttribute("user", user);
            request.getServletContext().getRequestDispatcher("/create_book.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }
        

    }
}
