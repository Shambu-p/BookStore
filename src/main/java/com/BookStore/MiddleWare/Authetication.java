package com.BookStore.MiddleWare;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BSNotAuthenticated;
import com.BookStore.Models.User;
import com.BookStore.Repository.UserRepo;

public class Authetication {

    public static User isAuthenticated(HttpServletRequest request, HttpServletResponse response, List<String> roles) throws ServletException, IOException {

        try {

            UserRepo repo = new UserRepo();
			User user = repo.authenticatedUser(request.getCookies());

            if(roles != null && !roles.contains(user.Role)) {
                request.setAttribute("message", "User is not authorized for this operation!");
                request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
                // request.getRequestDispatcher("http://localhost:8080/demo/error.jsp").forward(request, response);
                return null;
            }

            return user;
            // request.setAttribute("user", user);
            // request.getRequestDispatcher(path).forward(request, response);
            // response.sendRedirect("/");
		} catch (BSNotAuthenticated ex) {
            request.setAttribute("error_alert", ex.getMessage());
			request.getServletContext().getRequestDispatcher("/login_form.jsp").forward(request, response);
			// request.getRequestDispatcher("http://localhost:8080/demo/login_form.jsp").forward(request, response);
		} catch (Exception ex) {
            request.setAttribute("message", ex.getMessage());
			request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

        return null;

    }

}
