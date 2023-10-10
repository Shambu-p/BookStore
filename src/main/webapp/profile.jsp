<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Users List</title>
        <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
    </head>
    <% 
        User nuser = (User) request.getAttribute("user");
        User found_user = (User) request.getAttribute("found_user");
    %>
    <body>

        <jsp:include page="header.jsp" />
        <div class="w-100" style="height: 300px;">
            <img src="/demo/image_assets?type=png&name=mountain.png" alt="image" style="height: 100%; width: 100%;" />
        </div>

        <div class="w-100">
            <div class="container d-flex">
                <div style="width: 200px; position: relative;">
                    <img 
                        src="/demo/image_assets?type=jpg&name=placeholder.jpg" alt="image" 
                        style="width: 200px; height: 200px; position: absolute; transform: translateY(-50%);" class="rounded-circle">
                </div>
                <div class="col p-3" style="position: relative;">
                    <h5 class="card-title" style="font-size: 30px; font-weight: bold;">Kevin Smith</h5>
                    <h6 class="card-subtitle mb-3" style="font-size: 20px;">role</h6>
                    <span>Facebook</span>
                    <span>Instagram</span>
                    <span>Whatsapp</span>
                </div>
            </div>
        </div>

        <div class="w-100 bg-light">
            <div class="container d-flex">
                <div style="width: 200px; position: relative;" class="text-center p-1 pt-4">
                    
                    <h5 class="card-title mb-3 mt-4">Phone</h5>
                    <span class="card-sutitle mb-1">09876345</span>
                    <span class="card-sutitle mb-1">09876345</span>
                    <h5 class="card-title mb-3 mt-4">Email</h5>
                    <span class="card-sutitle mb-1">abnet@absoft.net</span>

                    <button class="btn btn-lg btn-primary mt-5 w-100">Chat</button>
                </div>
                <div class="col p-3">
                    
                </div>
            </div>
        </div>

    </body>
</html>