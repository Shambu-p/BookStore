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
    <jsp:include page="b_list.jsp" />
</body>

</html>