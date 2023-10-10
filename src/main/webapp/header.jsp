<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
    User nuser = (User) request.getAttribute("user");
    User found_user = (User) request.getAttribute("found_user");
%>

<div class="w-100 border-bottom">
    <div class="container d-flex p-1 justify-content-between">
        <div class="navbar_left w-50 d-flex justify-content-start">
            <a href="/demo/user/profile"
                class="logged_in_user pe-2 boarder-right">
                <% out.println(nuser.Name); %>
            </a>
            <a href="/demo/auth/logout" class="logout_action pe-2">Logout</a>
        </div>
        <% if(nuser.isAdminUser()) { %>
        <div class="navbar_right w-50 d-flex justify-content-end">
            <a href="/demo/home" class="sy-btn btn btn-sm btn-dark">Home</a>
            <a href="/demo/authors"
                class="sy-btn btn btn-sm btn-dark ms-2">Authors</a>
            <a href="/demo/books"
                class="sy-btn btn btn-sm btn-dark ms-2">Books</a>
            <a href="/demo/users"
                class="sy-btn btn btn-sm btn-dark ms-2">Users</a>
        </div>
        <% } else if(nuser.Role.equals("author")) { %>
        <div class="navbar_right w-50 d-flex justify-content-end">
            <a href="/demo/home" class="sy-btn btn btn-sm btn-dark">Home</a>
            <a href="/demo/books/publish"
                class="sy-btn btn btn-sm btn-dark ms-2">Publish Book</a>
            <a href="/demo/books/published_books" class="sy-btn btn btn-sm btn-dark ms-2">My Books</a>
        </div>
        <% } else if(nuser.Role.equals("user")) { %>
        <div class="navbar_right w-50 d-flex justify-content-end">
            <a href="/demo/home" class="sy-btn btn btn-sm btn-dark me-2">Home</a>
            <a href="/demo/books" class="sy-btn btn btn-sm btn-dark me-2">Books</a>
            <a href="/demo/books/my_books" class="sy-btn btn btn-sm btn-dark">Bought Books</a>
        </div>
        <% } %>

    </div>
</div>