<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
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

        <body>
            ${alerts.size()}
            <c:choose>
                <c:when test="${alerts.size() > 0}">
                    <c:forEach items="${alerts}" var="alert">
                        ${alert}<br />
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>no alerts</p>
                </c:otherwise>
            </c:choose>
        </body>

        </html>