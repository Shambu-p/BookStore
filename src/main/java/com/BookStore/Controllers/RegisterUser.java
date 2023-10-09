package com.BookStore.Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Models.User;
import com.BookStore.Repository.UserRepo;

@WebServlet("/user/register")
public class RegisterUser extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // request.getRequestDispatcher("signup_form.jsp").forward(request, response);
        // User authUser = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);
        request.getServletContext().getRequestDispatcher("/signup_form.jsp").forward(request, response);
        
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        // User authUser = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);
        
        String ps1 = request.getParameter("n_password");
        String ps2 = request.getParameter("c_password");

        if(!ps1.equals(ps2)) {
            request.setAttribute("error_alert", "password does not match!");
            request.getServletContext().getRequestDispatcher("/signup_form.jsp").forward(request, response);
            return;
        }

        User user = new User();
        
        user.Email = request.getParameter("email");
        user.Name = request.getParameter("name");
        user.Mobile = request.getParameter("phone");
        user.Password = request.getParameter("n_password");
        user.Role = "user";

        try {
            UserRepo repo = new UserRepo();
            repo.addUser(user);
            request.setAttribute("success_alert", "User Created Successfully!");
            request.getServletContext().getRequestDispatcher("/signup_form.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }


    }

}
