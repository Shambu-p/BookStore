<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bought List</title>
        <link rel="stylesheet"
            href="/demo/assets?type=css&name=bootstrap5.3.min.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
    </head>
    <%
    User nuser = (User) request.getAttribute("user");
    ArrayList<Order> books = (ArrayList<Order>) request.getAttribute("orders");
    %>
    <body>
        <div class="w-100 border-bottom">
            <div class="container d-flex p-1 justify-content-between">
                <div
                    class="navbar_left w-50 d-flex justify-content-start">
                    <a href="/demo/user/profile"
                        class="logged_in_user pe-2 boarder-right">
                        <% out.println(nuser.Name); %>
                    </a>
                    <a href="/demo/auth/logout"
                        class="logout_action pe-2">Logout</a>
                </div>
                <% if(nuser.isAdminUser()) { %>
                <div
                    class="navbar_right w-50 d-flex justify-content-end">
                    <a href="/demo/home"
                        class="sy-btn btn btn-sm btn-dark">Home</a>
                    <a href="/demo/authors"
                        class="sy-btn btn btn-sm btn-dark ms-2">Authors</a>
                    <a href="/demo/books"
                        class="sy-btn btn btn-sm btn-dark ms-2">Books</a>
                    <a href="/demo/users"
                        class="sy-btn btn btn-sm btn-dark ms-2">Users</a>
                </div>
                <% } else if(nuser.Role.equals("author")) { %>
                <div
                    class="navbar_right w-50 d-flex justify-content-end">
                    <a href="/demo/home"
                        class="sy-btn btn btn-sm btn-dark">Home</a>
                    <a href="/demo/books/publish"
                        class="sy-btn btn btn-sm btn-dark ms-2">Publish
                        Book</a>
                    <a href="/demo/books/published_books"
                        class="sy-btn btn btn-sm btn-dark ms-2">My Books</a>
                </div>
                <% } else if(nuser.Role.equals("user")) { %>
                <div
                    class="navbar_right w-50 d-flex justify-content-end">
                    <a href="/demo/home"
                        class="sy-btn btn btn-sm btn-dark ms-2">Home</a>
                    <a href="/demo/books"
                        class="sy-btn btn btn-sm btn-dark">Books</a>
                    <a href="/demo/my_books"
                        class="sy-btn btn btn-sm btn-dark">Bought Books</a>
                </div>
                <% } %>

            </div>
        </div>
        <div class="d-flex">
            <div class="col"></div>
            <div class="col-md-12 col-lg-8 pt-3 pb-3">
                <c:choose>
                    <c:when test="${orders.size() > 0}">
                        <% for(Order order : orders) { %>

                        <div class="card mb-3">
                            <div class="card-header">
                                <%= order.Book.BookType %>
                            </div>
                            <div class="card-body">

                                <div class="d-flex">
                                    <% if(order.Book.Cover == null || order.Book.Cover.isEmpty()) { %>
                                    <img src="/demo/image_assets?type=png&name=book_placeholder.png" alt="image" />
                                    <% } else { %>
                                    <img src="<% out.println("/demo/image_assets?type=cover&name=" + order.Book.Cover); %>" alt="image" />
                                    <% } %>
    
                                    <div class="w-100 ps-3">
                                        <h5 class="card-title"><%= order.Book.Name %></h5>
                                        <span class="card-subtitle"><%= order.Book.Author %></span>
                                        <div class="d-flex justify-content-between">
                                            <span><%= order.Quantity %> Copies</span>
                                            <span><strong>Price <%= order.TotalPrice %>ETB</strong></span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-header">
                                <a href="#" class="btn btn-link btn-sm">See Details</a>
                            </div>
                        </div>

                        <% } %>
                    </c:when>
                    <c:otherwise>
                        <p>no Book published yet</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col"></div>
        </div>
    </body>
</html>