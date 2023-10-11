<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
%>
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
                <a href="#" class="btn btn-link btn-sm">See Book Details</a>
            </div>
        </div>

        <% } %>
    </c:when>
    <c:otherwise>
        <p>no Book published yet</p>
    </c:otherwise>
</c:choose>