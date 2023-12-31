<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList, com.BookStore.Enums.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Title</title>
    <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
</head>
<%
    User nuser = (User) request.getAttribute("user");
    User user = (User) request.getAttribute("found_user");
    Boolean readonly = !nuser.isAdminUser();
%>
<body>
    <jsp:include page="header.jsp" />
    <form action="/demo/user/profile" method="post" class="w-100">

        <div class="bg-light d-flex justify-content-between mb-4 ps-4 pe-4 pt-2 pb-2 border-bottom">
            <h5 class="card-title">User Form</h5>
            <div class="button-group">
                <% if(user != null) { %>
                    <button class="btn btn-sm btn-outline-primary" type="submit">Update</button>
                    <a href="/demo/user/profile?delete=<%= user.Id %>" class="btn btn-sm btn-outline-danger" type="button">Delete</a>
                    <a href="/demo/user/profile?duplicate=<%= user.Id %>" class="btn btn-sm btn-outline-success" type="button">Duplicate</a>
                <% } else if(user == null) { %>
                    <button class="btn btn-sm btn-outline-primary" type="submit">Create</button>
                <% } %>
            </div>
        </div>

        <div class="container">

            <c:choose>
                <c:when test="${success_alert != null}">
                    <div class="alert alert-success mb-3">${success_alert}</div>
                </c:when>
                <c:when test="${error_alert != null}">
                    <div class="alert alert-danger mb-3">${error_alert}</div>
                </c:when>
            </c:choose>

            <% if(user != null) { %>
            <input type="hidden" name="_method" value="put" />
            <% } %>

            <div class="row mb-3">

                <div class="col pe-3">
                    <label for="user_id" class="mb-1">User Id</label>
                    <div class="input-group mb-3">
                        <input id="user_id" value="<% out.println(user != null ? user.Id + "" : ""); %>" name="id" type="text" placeholder="User Id Number" class="form-control" readonly />
                    </div>
    
                    <label for="user_name" class="mb-1">User Full Name</label>
                    <div class="input-group mb-3">
                        <input id="user_name" value="<% out.println(user != null ? user.Name : ""); %>" name="name" type="text" placeholder="User Full Name" class="form-control" <% if(readonly) { out.println("readonly"); } %>  />
                    </div>
    
                    <label for="user_email" class="mb-1">User Email Address</label>
                    <div class="input-group mb-3">
                        <input id="user_email" value="<% out.println(user != null ? user.Email : ""); %>" name="email" type="email" placeholder="User Email Address" class="form-control" <% if(readonly) { out.println("readonly"); } %>  />
                    </div>
                </div>
                <div class="col ps-3">
                    <label for="user_phone" class="mb-1">Mobile Phone Number</label>
                    <div class="input-group mb-3">
                        <input id="user_phone" value="<% out.println(user != null ? user.Mobile : ""); %>" name="phone" type="text" placeholder="User Email Address" class="form-control" <% if(readonly) { out.println("readonly"); } %>  />
                    </div>
                    <label for="user_role" class="mb-1">Access Role</label>
                    <div class="input-group mb-3">
                        <select name="role" id="user_role" value="<% out.println(user != null ? user.Role : ""); %>" class="form-control">
                            <option value="user" <% out.println((user != null && user.Role.equals("user")) ? "selected" : ""); %> > Customer </option>
                            <option value="author" <% out.println((user != null && user.Role.equals("author")) ? "selected" : ""); %>> Authors </option>
                            <option value="admin" <% out.println((user != null && user.Role.equals("admin")) ? "selected" : ""); %> > Administrator </option>
                        </select>
                    </div>
                </div>

                <% if(user == null) { %>
                <div class="col-12">

                    <label for="signup_password" class="mb-1">Create Password</label>
                    <div class="input-group mb-3">
                        <input id="signup_password" type="password" name="n_password" placeholder="Enter Password" class="form-control">
                    </div>

                    <label for="signup_cpassword" class="mb-1">Confirm Password</label>
                    <div class="input-group mb-3">
                        <input id="signup_cpassword" type="password" name="c_password" placeholder="Enter Password" class="form-control">
                    </div>

                </div>
                <% } %>

            </div>

            <div class="w-100 mb-3">
                <div class="button-group">
                    <% if(user != null) { %>
                        <button class="btn btn-sm btn-outline-primary" type="submit">Update</button>
                        <a href="/demo/user/profile?delete=<%= user.Id %>" class="btn btn-sm btn-outline-danger" type="button">Delete</a>
                        <a href="/demo/user/profile?duplicate=<%= user.Id %>" class="btn btn-sm btn-outline-success" type="button">Duplicate</a>
                    <% } else if(user == null) { %>
                        <button class="btn btn-sm btn-outline-primary" type="submit">Create</button>
                    <% } %>
                </div>
            </div>

            <% if(user != null) { %>
                <div class="w-100 mb-3">
                    <h5 class="mb-3 card-title">Orders By This User</h5>
                    <jsp:include page="orders_list.jsp" />
                </div>
            <% } %>

        </div>
    </form>

</body>
</html>