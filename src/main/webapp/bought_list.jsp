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
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
    %>
    <body>
        <jsp:include page="header.jsp" />
        <div class="d-flex">
            <div class="col"></div>
            <div class="col-md-12 col-lg-8 pt-3 pb-3">
                <jsp:include page="orders_list.jsp" />
            </div>
            <div class="col"></div>
        </div>
    </body>
</html>