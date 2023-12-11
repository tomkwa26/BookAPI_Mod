<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 29.10.2023
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add book</title>
  <style>
    .error {
      color: crimson;
      font-weight: normal;
    }
    body {
      background-color: #E6E6E6;
      font-family: Arial, sans-serif;
    }

    h1 {
      text-align: center;
      color: #333;
    }

    form {
      background-color: #F2F2F2;
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin: 0 auto;
      width: 80%;
    }

    label {
      display: block;
      margin-top: 10px;
    }

    input[type="text"],
    select,
    textarea {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
      background-color: #D9D9D9;
    }

    button {
      background-color: #007BFF;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<h1>Add book</h1>
<form:form method="post" modelAttribute="book" action="/admin/books">
  <form:hidden path="id" />
  <form:label path="isbn">ISBN</form:label>
  <form:input path="isbn" />
  <form:errors path="isbn" cssClass="error" />
  <hr/>
  <form:label path="title">Title</form:label>
  <form:input path="title" />
  <form:errors path="title" cssClass="error" />
  <hr/>
  <form:label path="author">Author</form:label>
  <form:input path="author" />
  <form:errors path="author" cssClass="error" />
  <hr/>
  <form:label path="publisher">Publisher</form:label>
  <form:input path="publisher" />
  <form:errors path="publisher" cssClass="error" />
  <hr/>
  <form:label path="type">Type</form:label>
  <form:input path="type" />
  <form:errors path="type" cssClass="error" />
  <hr/>
  <form:button>Save</form:button>
</form:form>
</body>
</html>
