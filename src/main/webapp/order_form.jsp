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
        <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
    </head>
    <%
    User nuser = (User) request.getAttribute("user");
    Book book = (Book) request.getAttribute("book");
    %>
    <body>
        <div class="w-100 border-bottom">
            <div class="container d-flex p-1 justify-content-between">
                <div
                    class="navbar_left w-50 d-flex justify-content-start">
                    <a href="/demo/user/profile" class="logged_in_user pe-2 boarder-right">
                        <% out.println(nuser.Name); %>
                    </a>
                    <a href="/demo/auth/logout" class="logout_action pe-2">Logout</a>
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
                <div class="navbar_right w-50 d-flex justify-content-end">
                    <a href="/demo/home" class="sy-btn btn btn-sm btn-dark">Home</a>
                    <a href="/demo/books/publish" class="sy-btn btn btn-sm btn-dark ms-2">Publish Book</a>
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
        <div class="d-flex">
            <div class="col"></div>
            <div class="col-md-12 col-lg-8 pt-3 pb-3">
                <h4 class="display-4 mb-4">Order a Book </h4>
                <div class="card mb-3">
                    <div class="card-header">
                        <%= book.BookType %>
                    </div>
                    <div class="card-body">

                        <div class="d-flex">
                            <% if(book.Cover == null || book.Cover.isEmpty()) { %>
                            <img class="card_cover" src="/demo/image_assets?type=png&name=book_placeholder.png" alt="image" />
                            <% } else { %>
                            <img class="card_cover" src="<% out.println("/demo/image_assets?type=cover&name=" + book.Cover); %>" alt="image" />
                            <% } %>

                            <div class="w-100 ps-3">
                                <h5 class="card-title"><%= book.Name %></h5>
                                <span class="card-subtitle"><%= book.Author %></span>
                                <div class="d-flex justify-content-between">
                                    <span><%= book.Quantity %> Copies Are Available</span>
                                    <span><strong>Price <%= book.Price %>ETB</strong></span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <form class="w-100" action="/demo/books/order" method="post">

                    <c:choose>
                        <c:when test="${success_alert != null}">
                            <div class="alert alert-success mb-3">${success_alert}</div>
                        </c:when>
                        <c:when test="${error_alert != null}">
                            <div class="alert alert-danger mb-3">${error_alert}</div>
                        </c:when>
                    </c:choose>

                    <p class="mt-4 mb-3">
                        <strong>Order Information</strong> <br>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                    </p>

                    <!-- hidden inputs -->
                    <input name="book_id" value="<%= book.Id %>" type="hidden" />
                    
                    <label for="book_quantity" class="mb-1">How many copies do you want?</label>
                    <div class="input-group mb-3">
                        <% if(book.Quantity == 0) { %>
                        <input id="book_quantity" name="quantity" type="number" min="0" placeholder="No copies are available" class="form-control" disabled />
                        <% } else { %>
                        <input id="book_quantity" name="quantity" type="number" min="0" placeholder="Number of book copie" class="form-control" />
                        <% } %>
                    </div>

                    <button class="btn btn-dark" type="submit">Order Now</button>

                </form>
            </div>
            <div class="col"></div>
        </div>
    </body>
</html>