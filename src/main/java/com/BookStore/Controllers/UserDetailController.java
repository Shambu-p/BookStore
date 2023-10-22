package com.BookStore.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Utils;
import com.BookStore.Exceptions.BSNotFound;
import com.BookStore.Models.User;
import com.BookStore.Repository.OrderRepo;
import com.BookStore.Repository.UserRepo;

@WebServlet("/user/profile")
public class UserDetailController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String id = request.getParameter("id");
        String delete = request.getParameter("delete");
        String duplicate = request.getParameter("duplicate");

        if(id == null && delete != null && duplicate == null) {
            deleteUser(request, response);
        }else if(id == null && delete == null && duplicate != null) {
            duplicateUser(request, response);
        } else {
            getDetail(request, response);
        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String method = request.getParameter("_method");

        if(method == null) {
            createUser(request, response);
        } else {
            updateUser(request, response);
        }
    }

    public void getDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

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

            if(Integer.parseInt(id) == -1) {
                request.setAttribute("user", user);
                request.getServletContext().getRequestDispatcher("/user_detail.jsp").forward(request, response);
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
            request.getServletContext().getRequestDispatcher("/user_detail.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException | BSNotFound ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("message", "User deletion has not been implemented yet");
        request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);

    }

    public void duplicateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("message", "User duplication has not been implemented yet");
        request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);

    }

    public void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {

            User user = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

            if (user == null) {
                return;
            }

            if(!user.isAdminUser()) {
                request.setAttribute("error_alert", "Unauthorized Access! only admins can access this!");
                request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            String ps1 = request.getParameter("n_password");
            String ps2 = request.getParameter("c_password");

            if(!ps1.equals(ps2)) {
                request.setAttribute("error_alert", "password does not match!");
                request.setAttribute("user", user);
                request.getServletContext().getRequestDispatcher("/user_detail.jsp").forward(request, response);
                return;
            }

            User new_user = new User();

            new_user.Email = request.getParameter("email");
            new_user.Name = request.getParameter("name");
            new_user.Mobile = request.getParameter("phone");
            new_user.Password = request.getParameter("n_password");
            new_user.Role = request.getParameter("role");

            UserRepo repo = new UserRepo();
            repo.addUser(new_user);
            request.setAttribute("success_alert", "User Created Successfully!");
            response.sendRedirect(Utils.getAddress(request, "/users"));
            // request.getServletContext().getRequestDispatcher("/users").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            request.setAttribute("message", ex.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

    public void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User authUser = com.BookStore.MiddleWare.Authetication.isAuthenticated(request, response, null);

        try {

            if(authUser == null) {
                return;
            }

            if(!authUser.isAdminUser()) {
                request.setAttribute("error_alert", "Unauthorized Access! only admins can access this!");
                request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(request.getParameter("id"));
            UserRepo repo = new UserRepo();
            User user = repo.getUser(id);
            OrderRepo o_repo = new OrderRepo();

            // user.Id = Integer.parseInt(request.getParameter("id"));
            user.Email = request.getParameter("email");
            user.Name = request.getParameter("name");
            user.Mobile = request.getParameter("phone");
            user.Role = request.getParameter("role");

            repo.updateUser(user);
            request.setAttribute("success_alert", "User Updated Successfully!");
            request.setAttribute("user", authUser);
            request.setAttribute("found_user", user);
            request.setAttribute("orders", o_repo.orders(null, id));
            request.getServletContext().getRequestDispatcher("/user_detail.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException | BSNotFound e) {
            request.setAttribute("message", e.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }
}
