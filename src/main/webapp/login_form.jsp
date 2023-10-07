<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login-BookStore</title>
    <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
</head>
<body class="d-flex" style="width: 100vw; height: 100vh; psotion: relative;">
    <div class="d-flex w-100" style="margin: auto 0; position: relative;">
        <div class="col"></div>
        <div class="col-sm-12 col-md-6 col-lg-4">
            <form action="/demo/auth/login" method="post" class="w-100">
                <h4 class="display-4 mb-4 text-center">Book Store Login</h4>

                <c:choose>
                    <c:when test="${success_alert != null}">
                        <div class="alert alert-success mb-3">${success_alert}</div>
                    </c:when>
                    <c:when test="${error_alert != null}">
                        <div class="alert alert-danger mb-3">${error_alert}</div>
                    </c:when>
                </c:choose>
                
                <label for="login_email" class="mb-1">Email Address</label>
                <div class="input-group mb-3">
                    <input id="login_email" type="text" placeholder="Email Address" name="email" class="form-control">
                </div>

                <label for="login_password" class="mb-1">Password</label>
                <div class="input-group mb-3">
                    <input id="login_password" type="password" placeholder="Enter Password" name="password" class="form-control">
                </div>

                <!-- <a href="/demo/auth/register" class="btn btn-lg btn-link mb-3">sign up here!</a> -->

                <div class="d-flex justify-content-between w-100">
                    <button class="btn btn-primary w-100 me-3" type="submit">Sign In</button>
                    <a href="/demo/user/register" class="btn btn-dark w-100">Sign Up</a>
                </div>
            </form>
        </div>
        <div class="col"></div>
    </div>
</body>
</html>