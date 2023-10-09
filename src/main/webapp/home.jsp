<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book-Store-Home</title>
        <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
    </head>
    <% 
        User nuser = (User) request.getAttribute("user");
        ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
    %>

    <body>
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
                    <a href="/demo/home" class="sy-btn btn btn-sm btn-dark ms-2">Home</a>
                    <a href="/demo/books" class="sy-btn btn btn-sm btn-dark">Books</a>
                    <a href="/demo/my_books" class="sy-btn btn btn-sm btn-dark">Bought Books</a>
                </div>
                <% } %>

            </div>
        </div>
        <div class="hero-section w-100">
            <img src="/demo/image_assets?type=png&name=mountain.png" alt="image">
            <div class="h-100 w-100 pt-4 pb-2">
                <div class="w-100" style="position: relative;">
                    <div class="container d-flex justify-content-between">
                        <span class="hero-brand">BOOKS</span>
                        <div class="search-container d-flex">
                            <div class="search-input-container d-flex">
                                <i class="fa fa-magnifying-glass" style="font-size: 15px;"></i>
                                <input type="text" class="search-input" placeholder="Search" />
                                <select name="Categories" id="book_search_category">
                                    <option value="">All Category</option>
                                    <option value="fiction">Fiction</option>
                                    <option value="biography">Biography</option>
                                </select>
                            </div>
                            <button class="btn-search btn btn-sm btn-dark ps-3 pe-3">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex">
            <div class="col"></div>
            <div class="col-md-12 col-lg-8 d-flex pt-3 pb-3">
                <c:choose>
                    <c:when test="${books.size() > 0}">
                        <% for(Book book : books) { %>
                                
                            <div class="book_container col-sm-12 col-md-4 col-lg-3 p-2">
                                <div class="book_image_container mb-3">
                                    <% if(book.Cover == null || book.Cover.isEmpty()) { %>
                                        <img src="/demo/image_assets?type=png&name=book_placeholder.png" alt="image" />
                                    <% } else { %>
                                        <img src="<% out.println("/demo/image_assets?type=cover&name=" + book.Cover); %>" alt="image" />
                                    <% } %>
                                </div>
                                <h5 class="card-title"><%= book.Name %></h5>
                                <span class="card-subtitle"><%= book.Author %></span>
                                <div class="d-flex mb-3">
                                    <div class="w-50">
                                        <span><%= book.Quantity %> Copies</span>
                                    </div>
                                    <div class="w-50">
                                        <span><%= book.Price %>ETB</span>
                                    </div>
                                </div>
                                <% if(nuser.isNormalUser()) { %>
                                    <a href="/demo/books/order?id=<%= book.Id %>" class="btn btn-sm btn-dark w-100">Order Now</a>
                                <% } %>
                                <!-- <button class="btn btn-sm btn-dark w-100">Order Now</button> -->
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