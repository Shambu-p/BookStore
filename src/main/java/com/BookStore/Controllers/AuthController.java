package com.BookStore.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BSNotAuthenticated;
import com.BookStore.Exceptions.BSNotFound;
import com.BookStore.Models.User;
import com.BookStore.Repository.UserRepo;

@WebServlet("/auth/login")
public class AuthController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
            UserRepo repo = new UserRepo();
            User user = repo.authenticatedUser(request.getCookies());
            request.setAttribute("user", user);
            request.getServletContext().getRequestDispatcher("/home").forward(request, response);
        } catch (ClassNotFoundException | NumberFormatException | SQLException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (BSNotAuthenticated | BSNotFound e) {
            request.getServletContext().getRequestDispatcher("/login_form.jsp").forward(request, response);
        }

        // User authUser =
        // com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response,
        // null);
        // if (authUser != null) {
        // request.setAttribute("user", authUser);
        // request.getServletContext().getRequestDispatcher("/").forward(request,
        // response);
        // //
        // request.getRequestDispatcher("http://localhost:8080/demo").forward(request,
        // // response);
        // }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // request.setAttribute("message", "working");
        // request.getServletContext().getRequestDispatcher("/error.jsp").forward(request,
        // response);

        // User user = repo.authenticatedUser(request.getCookies());

        // if (user != null) {
        // request.setAttribute("user", user);
        // request.getServletContext().getRequestDispatcher("/").forward(request,
        // response);
        // return;
        // }

        try {

            UserRepo repo = new UserRepo();

            User user = repo.login(request.getParameter("email"), request.getParameter("password"));
            response.addCookie(new Cookie("user", String.valueOf(user.Id)));

            request.setAttribute("user", user);
            request.getServletContext().getRequestDispatcher("/home").forward(request, response);

        } catch (BSNotFound ex) {
            request.setAttribute("error_alert", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/login_form.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

}
