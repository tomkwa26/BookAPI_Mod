<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 29.10.2023
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete book</title>
    <style>
        body {
            background-color: #E6E6E6;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        p {
            text-align: center;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        a {
            background-color: #007BFF;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            text-decoration: none;
            margin: 2px;
            display: inline-block;
        }

        a.delete-button {
            background-color: #FF0000;
        }

        a.back-to-list {
            background-color: #007BFF;
        }
    </style>
</head>
<body>
<h1>Delete confirmation</h1>
<p>Are you sure you want to delete article with id <b>${book.id}</b>, title <b>${book.title}</b> and author <b>${book.author}</b>?</p>
<div class="button-container">
    <a href="/admin/books/list" class="back-to-list">Back to list</a><br>
    <a href="/admin/books/delete/${book.id}" class="delete-button">Delete</a>
</div>
</body>
</html>
