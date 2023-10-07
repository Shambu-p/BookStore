<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Here</title>
    <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
</head>

<body class="d-flex" style="width: 100vw; height: 100vh; psotion: relative;">
    <div class="d-flex w-100 pt-5 pb-3" style="margin: auto 0; position: relative;">
        <div class="col"></div>
        <div class="col-sm-12 col-md-8 col-lg-6">
            <form action="/demo/user/register" method="post" class="w-100">
                <h4 class="display-4 mb-4 text-center">Book Store Sign Up</h4>

                <c:choose>
                    <c:when test="${success_alert != null}">
                        <div class="alert alert-success mb-3">${success_alert}</div>
                    </c:when>
                    <c:when test="${error_alert != null}">
                        <div class="alert alert-danger mb-3">${error_alert}</div>
                    </c:when>
                </c:choose>

                <p class="mt-4 mb-3">
                    <strong>Introduction</strong> <br>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                </p>

                <label for="signup_email" class="mb-1">Email Address</label>
                <div class="input-group mb-3">
                    <input id="signup_email" name="email" type="text" placeholder="Email Address" class="form-control">
                </div>

                <p class="mt-4 mb-3">
                    <strong>User Information</strong><br>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                </p>

                <label for="signup_name" class="mb-1">Full Name</label>
                <div class="input-group mb-3">
                    <input id="signup_name" name="name" type="text" placeholder="Full Name" class="form-control">
                </div>

                <label for="signup_mobile" class="mb-1">Mobile Phone Number</label>
                <div class="input-group mb-3">
                    <input id="signup_mobile" type="text" name="phone" placeholder="Mobile Phone Number" class="form-control">
                </div>

                <p class="mt-4 mb-3">
                    <strong>Password Section</strong><br>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                </p>

                <label for="signup_password" class="mb-1">Password</label>
                <div class="input-group mb-3">
                    <input id="signup_password" type="password" name="n_password" placeholder="Enter Password" class="form-control">
                </div>

                <label for="signup_cpassword" class="mb-1">Confirm Password</label>
                <div class="input-group mb-3">
                    <input id="signup_cpassword" type="password" name="c_password" placeholder="Enter Password" class="form-control">
                </div>

                <p>
                    Already Signed up go to 
                    <a href="/demo/auth/login" class="btn btn-lg btn-link mb-3">Login page!</a>
                </p>

                <p class="mt-4 mb-3 text-right">
                    <strong>Sign up agreement</strong> <br>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                </p>

                <button class="btn btn-primary btn-lg" style="right: 0;" type="submit">Sign Up</button>
            </form>
        </div>
        <div class="col"></div>
    </div>
</body>

</html>