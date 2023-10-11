<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
    <jsp:include page="header.jsp" />
    <div class="w-100 bg-light border-bottom">
        <div class="container pt-3 pb-3 d-flext justify-content-center">
            <div class="search-container d-flex" style="margin: 0 auto;">
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