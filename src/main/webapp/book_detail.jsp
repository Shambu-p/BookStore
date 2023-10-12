<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="com.BookStore.Models.*, java.util.ArrayList" %>
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
    Book book = (Book) request.getAttribute("book");
    Boolean is_author = nuser.Id == book.UserId;
%>
<body>
    <jsp:include page="header.jsp" />
    <form action="/demo/books/update" method="post" class="w-100">

        <div class="bg-light d-flex justify-content-between mb-4 ps-4 pe-4 pt-2 pb-2 border-bottom">
            <h5 class="card-title">Form Title</h5>
            <div class="button-group">
                <button class="btn btn-sm btn-outline-primary">Update</button>
                <button class="btn btn-sm btn-outline-danger">Delete</button>
                <button class="btn btn-sm btn-outline-success">Save</button>
            </div>
        </div>
        <div class="d-flex w-100 justify-content-center mb-5">
            <img src="<% out.println("/demo/image_assets?type=cover&name=" + book.Cover); %>" alt="image" class="card_cover" style="margin: 0 auto;" />
        </div>
    
        <div class="container pb-4">
            <div class="d-flex">
                <div class="col p-3">
                    <label for="book_id" class="mb-1">Book Id Number</label>
                    <div class="input-group mb-3">
                        <input id="book_id" value="<%= book.Id %>" name="id" type="text" placeholder="Book Id" class="form-control" disabled readonly />
                    </div>

                    <label for="book_title" class="mb-1">Book Title</label>
                    <div class="input-group mb-3">
                        <input id="book_title" value="<%= book.Name %>" name="title" type="text" placeholder="Title of the book" class="form-control" <% if(!is_author) { out.println("readonly"); } %>  />
                    </div>

                    <label for="book_author" class="mb-1">Book Author Name</label>
                    <div class="input-group mb-3">
                        <input id="book_author" value="<%= book.Author %>" name="author" type="text" placeholder="Book Author Name" class="form-control" disabled readonly />
                    </div>

                    <label for="book_price" class="mb-1">Price</label>
                    <div class="input-group mb-3">
                        <input id="book_price" value="<%= book.Price %>" name="price" type="number" placeholder="Price of the book" class="form-control" <% if(!is_author) { out.println("readonly"); } %>  />
                    </div>

                </div>
                <div class="col p-3">

                    <label for="book_type" class="mb-1">Gener</label>
                    <div class="input-group mb-3">
                        <input id="book_type" value="<%= book.BookType %>" name="type" type="text" placeholder="Type of the book" class="form-control" <% if(!is_author) { out.println("readonly"); } %>  />
                    </div>

                    <label for="book_quantity" class="mb-1">Available Copies</label>
                    <div class="input-group mb-3">
                        <input id="book_quantity" value="<%= book.Quantity %>" name="quantity" type="number" placeholder="Available copies of the book" class="form-control" <% if(!is_author) { out.println("readonly"); } %> />
                    </div>

                    <label for="book_user_id" class="mb-1">Author Id Number</label>
                    <div class="input-group mb-3">
                        <input id="book_user_id" value="<%= book.UserId %>" name="user_id" type="number" placeholder="Book Author User Id" class="form-control" disabled readonly />
                    </div>

                    <label for="book_description" class="mb-1">Book Description</label>
                    <div class="input-group mb-3">
                        <textarea id="book_description" name="description" placeholder="Book Content Description" class="form-control" <% if(!is_author) { out.println("readonly"); } %> ><% out.println(book.Description); %></textarea>
                    </div>

                </div>
            </div>

            <div class="button-group">
                <button class="btn btn-sm btn-outline-primary">Update</button>
                <button class="btn btn-sm btn-outline-danger">Delete</button>
                <button class="btn btn-sm btn-outline-success">Save</button>
            </div>
        </div>
    </form>

</body>
</html>