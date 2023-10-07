package com.BookStore.Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BSNotAuthenticated;
import com.BookStore.Models.User;
import com.BookStore.Repository.UserRepo;

@WebServlet("/auth/logout")
public class SignOutController extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
			UserRepo repo = new UserRepo();
			User user = repo.authenticatedUser(request.getCookies());
			request.setAttribute("user", user);
            // response.sendRedirect("/");
			request.getRequestDispatcher(request.getLocalName() + "/demo").forward(request, response);
		} catch (BSNotAuthenticated ex) {
			request.setAttribute("error_alert", ex.getMessage());
			request.getRequestDispatcher(request.getLocalName() + "/demo/login_form.jsp").forward(request, response);
		} catch (Exception ex) {
			request.setAttribute("message", ex.getMessage());
			request.getRequestDispatcher(request.getLocalName() + "/demo/error.jsp").forward(request, response);
		}

    }

}
