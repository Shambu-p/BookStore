<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
User nuser = (User) request.getAttribute("user");
ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
%>

<div class="d-flex">
    <div class="col"></div>
    <div class="col-md-12 col-lg-8 d-flex pt-3 pb-3">
        <c:choose>
            <c:when test="${books.size() > 0}">
                <% for(Book book : books) { %>

                <div
                    class="book_container col-sm-12 col-md-4 col-lg-3 p-2">
                    <div class="book_image_container mb-3">
                        <% if(book.Cover == null ||
                        book.Cover.isEmpty()) { %>
                        <img
                            src="/demo/image_assets?type=png&name=book_placeholder.png"
                            alt="image" />
                        <% } else { %>
                        <img src="<% out.println("/demo/image_assets?type=cover&name="
                            + book.Cover); %>" alt="image" />
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
                    <div class="w-100 d-flex justify-content-between">
                        <a href="/demo/books/detail?id=<%= book.Id %>" class="btn btn-sm btn-primary w-100">Detail</a>
                        <% if(nuser.isNormalUser()) { %>
                        <a href="/demo/books/order?id=<%= book.Id %>" class="btn btn-sm btn-dark w-100 ms-3">Order Now</a>
                        <% } %>
                    </div>
                    <!-- <button class="btn btn-sm btn-dark w-100">Order Now</button> -->
                </div>

                <% } %>
            </c:when>
            <c:otherwise>
                <p>You have not published any book yet!</p>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="col"></div>
</div>