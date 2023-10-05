package com.BookStore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Servlet extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        // throw new Exception("not implemented yet!");
    }
}
