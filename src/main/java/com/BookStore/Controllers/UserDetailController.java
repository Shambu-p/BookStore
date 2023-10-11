package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BSNotFound;
import com.BookStore.Models.User;
import com.BookStore.Repository.OrderRepo;
import com.BookStore.Repository.UserRepo;

@WebServlet("/user/profile")
public class UserDetailController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {

            User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

            if (user == null) {
                return;
            }

            String id = request.getParameter("id");
            OrderRepo o_repo = new OrderRepo();

            if(id == null) {
                request.setAttribute("user", user);
                request.setAttribute("found_user", user);
                request.setAttribute("orders", o_repo.orders(null, user.Id));
                request.getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
                return;
            }

            if(!user.isAdminUser()) {
                request.setAttribute("error_alert", "Unauthorized Access!");
                request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            UserRepo repo = new UserRepo();
            User found_user = repo.getUser(Integer.parseInt(id));
            request.setAttribute("user", user);
            request.setAttribute("found_user", found_user);
            request.setAttribute("orders", o_repo.orders(null, found_user.Id));
            request.getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException | BSNotFound ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }
}
