<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 29.10.2023
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Books list</title>
    <style>
        body {
            background-color: #E6E6E6;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            background-color: #F2F2F2;
            border-collapse: collapse;
            border: 1px solid #ccc;
            width: 80%;
            margin: 0 auto;
        }

        table td, th {
            border: 1px solid #ccc;
            padding: 5px;
            text-align: center;
        }

        .action-buttons {
            text-align: center;
        }

        .action-buttons a {
            background-color: #007BFF;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            text-decoration: none;
            margin: 2px;
            display: inline-block;
        }

        .action-buttons a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Books list</h1>
<table>
    <thead>
    <tr>
        <th>Isbn</th>
        <th>Title</th>
        <th>Author</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="b">
        <tr>
            <td>${b.isbn}</td>
            <td>${b.title}</td>
            <td>${b.author}</td>
            <td class="action-buttons">
                <a href="/admin/books">Add</a>
                <a href="/admin/books/edit/${b.id}">Edit</a>
                <a href="/admin/books/confirm/${b.id}">Delete</a>
                <a href="/admin/books/show/${b.id}">Show</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
