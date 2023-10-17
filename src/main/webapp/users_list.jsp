<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList, com.BookStore.Enums.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Users List</title>
        <link rel="stylesheet"
            href="/demo/assets?type=css&name=bootstrap5.3.min.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
    </head>
<% 
    User nuser = (User) request.getAttribute("user");
    ArrayList<User> users = (ArrayList<User>) request.getAttribute("all_users");
%>
    <body>
        <jsp:include page="header.jsp" />
        <div
            class="bg-light d-flex justify-content-between mb-4 ps-4 pe-4 pt-2 pb-2 border-bottom">
            <h5 class="card-title">Users List</h5>
            <div class="button-group">
                <a href="/demo/user/profile?id=-1" class="btn btn-sm btn-outline-primary">Create User</a>
                <button class="btn btn-sm btn-outline-danger">Delete</button>
            </div>
        </div>

        <c:choose>
            <c:when test="${success_alert != null}">
                <div class="alert alert-success mb-3">${success_alert}</div>
            </c:when>
            <c:when test="${error_alert != null}">
                <div class="alert alert-danger mb-3">${error_alert}</div>
            </c:when>
        </c:choose>

        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Role</th>
                </tr>
            </thead>
            <tbody>
                <% for(User user : users) { %>
                <tr>
                    <th scope="row"><%= user.Id %></th>
                    <td><%= user.Name %></td>
                    <td><%= user.Email %></td>
                    <td><%= user.Mobile %></td>
                    <!-- <td><%-- Roles.getRole(user.Role) --%></td> -->
                    <td><%= user.Role %></td>
                    <td>
                        <a href="/demo/user/profile?id=<%= user.Id %>" class="btn btn-sm btn-link">Detail</a>
                    </td>
                </tr>
                <% } %>
            </tbody>

        </table>

    </body>
</html>