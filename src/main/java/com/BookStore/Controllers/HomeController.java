package com.BookStore.Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BookStore.Exceptions.BSNotAuthenticated;
import com.BookStore.Models.User;
import com.BookStore.Repository.UserRepo;

@WebServlet("/home")
public class HomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// try {
		// 	UserRepo repo = new UserRepo();
		// 	User user = repo.authenticatedUser(request.getCookies());
		// 	request.setAttribute("user", user);
		// } catch (BSNotAuthenticated ex) {
		// 	// request.setAttribute("error_alert", "<div class='alert alert-danger'> " + ex.getMessage() + " </div>");
		// 	request.setAttribute("error_alert", ex.getMessage());
		// 	request.getRequestDispatcher("login_form.jsp").forward(request, response);
		// } catch (Exception ex) {
		// 	request.setAttribute("message", ex.getMessage());
		// 	request.getRequestDispatcher("error.jsp").forward(request, response);
		// }
		
		// Database db = new Database();
		
		// try {
		// 	ArrayList<String> temp = new ArrayList<String>();
		// 	temp.add("connected");
		// 	temp.add("not connected");
		// 	request.setAttribute("isthere_alert", temp);
		// 	request.setAttribute("alerts", temp);
		// 	request.getRequestDispatcher("list.jsp").forward(request, response);
		// } catch (Exception ex) {
		// 	ex.printStackTrace();
		// 	// request.setAttribute("message", ex.getMessage());
		// }

		request.setAttribute("test", request.getServletPath());
		request.getRequestDispatcher("home.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

/*
 * 
 * <servlet-mapping>
 * <servlet-name>HomeController</servlet-name>
 * <url-pattern>/home</url-pattern>
 * </servlet-mapping>
 * <servlet-mapping>
 * <servlet-name>AuthController</servlet-name>
 * <url-pattern>/auth</url-pattern>
 * </servlet-mapping>
 * 
 */