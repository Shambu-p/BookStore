package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Models.User;
import com.BookStore.Repository.UserRepo;

@WebServlet("/users")
public class UserController extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {

            ArrayList<String> roles = new ArrayList<String>();
            roles.add("admin");
            User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, roles);

            if (user == null) {
                return;
            }

            UserRepo repo = new UserRepo();
            ArrayList<User> users = repo.getUsers("", "", "");

            request.setAttribute("user", user);
            request.setAttribute("all_users", users);
            request.getServletContext().getRequestDispatcher("/users_list.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

}
