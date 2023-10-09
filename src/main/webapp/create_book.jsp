<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book-Store-Home</title>
        <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
        <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
    </head>

    <% User nuser = (User) request.getAttribute("user"); %>

    <body>
        <div class="w-100 border-bottom">
            <div class="container d-flex p-1 justify-content-between">
                <div class="navbar_left w-50 d-flex justify-content-start">
                    <a href="/demo/user/profile" class="logged_in_user pe-2 boarder-right">
                        <% out.println(nuser.Name); %>
                    </a>
                    <a href="/demo/auth/logout" class="logout_action pe-2">Logout</a>
                </div>
                <% if(nuser.isAdminUser()) { %>
                    <div class="navbar_right w-50 d-flex justify-content-end">
                        <a href="/demo/home" class="sy-btn btn btn-sm btn-dark">Home</a>
                        <a href="/demo/authors" class="sy-btn btn btn-sm btn-dark ms-2">Authors</a>
                        <a href="/demo/books" class="sy-btn btn btn-sm btn-dark ms-2">Books</a>
                        <a href="/demo/users" class="sy-btn btn btn-sm btn-dark ms-2">Users</a>
                    </div>
                <% } else if(nuser.Role.equals("author")) { %>
                    <div class="navbar_right w-50 d-flex justify-content-end">
                        <a href="/demo/home" class="sy-btn btn btn-sm btn-dark">Home</a>
                        <a href="/demo/books/publish" class="sy-btn btn btn-sm btn-dark ms-2">Publish Book</a>
                        <a href="/demo/my_books" class="sy-btn btn btn-sm btn-dark ms-2">My Books</a>
                    </div>
                <% } else if(nuser.Role.equals("user")) { %>
                    <div class="navbar_right w-50 d-flex justify-content-end">
                        <a href="/demo/home" class="sy-btn btn btn-sm btn-dark">Home</a>
                        <a href="/demo/books" class="sy-btn btn btn-sm btn-dark ms-2">Books</a>
                    </div>
                <% } %>
                
            </div>
        </div>
        <div class="d-flex pt-4 pb-4">
            <div class="col"></div>
            <div class="col-sm-12 col-md-8 col-lg-6">
                <form action="/demo/books/publish" method="post" enctype="multipart/form-data">

                    <h5 class="display-4 mb-3">Book Publishing</h5>

                    <c:choose>
                        <c:when test="${success_alert != null}">
                            <div class="alert alert-success mb-3">${success_alert}</div>
                        </c:when>
                        <c:when test="${error_alert != null}">
                            <div class="alert alert-danger mb-3">${error_alert}</div>
                        </c:when>
                    </c:choose>

                    <p class="mt-4 mb-3">
                        <strong>About The Book</strong> <br>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                    </p>

                    <!-- hidden inputs -->
                    <input name="author_name" type="hidden" value="<%= nuser.Name %>" />
                    <input name="user_id" value="<%= nuser.Id %>" type="hidden" />
                    
                    <label for="book_title" class="mb-1">Title</label>
                    <div class="input-group mb-3">
                        <input id="book_title" name="title" type="text" placeholder="Title of the book" class="form-control">
                    </div>

                    <label for="book_description" class="mb-1">Description</label>
                    <div class="input-group mb-3">
                        <textarea id="book_description" name="description" placeholder="Description of the book" class="form-control" ></textarea>
                    </div>
                    
                    <label for="book_type" class="mb-1">Book Type</label>
                    <div class="input-group mb-3">
                        <select id="book_type" name="type" title="Gener of the book" class="form-control">
                            <option value="fiction">Fiction</option>
                            <option value="biography">Biography</option>
                            <option value="children">Cildren's Book</option>
                            <option value="educational">Educational</option>
                        </select>
                    </div>

                    <label for="book_cover" class="mb-1">Book Cover</label>
                    <div class="input-group mb-3">
                        <input required id="book_cover" name="cover" type="file" placeholder="Book Cover Image" class="form-control" />
                    </div>

                    <p class="mt-4 mb-3">
                        <strong>Sells Information</strong> <br>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                    </p>

                    <label for="available_quantity" class="mb-1">Copies</label>
                    <div class="input-group mb-3">
                        <input id="available_quantity" name="quantity" type="number" placeholder="Number of Books Copy available" class="form-control">
                    </div>


                    <label for="book_price" class="mb-1">Book Price (Price/Book)</label>
                    <div class="input-group mb-3">
                        <input id="book_price" name="price" type="number" placeholder="Title of the book" class="form-control">
                    </div>

                    <p class="mt-4 mb-3">
                        <strong>Terms and Agreements</strong> <br>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis similique temporibus fugiat velit necessitatibus tempore maxime earum ex omnis sed ipsam, dolore est inventore beatae enim alias quo veritatis labore!
                    </p>

                    <button type="submit" class="btn btn-primary btn-outlined">Publish</button>

                </form>
            </div>
            <div class="col"></div>
        </div>
    </body>

</html>