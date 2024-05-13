<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"], .delete-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover, .delete-btn:hover {
            background-color: #45a049;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Student Information</h2>
    <form action="${pageContext.request.contextPath}/api/update" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="hidden" id="id" name="id" value="${studentById.id}">
            <input type="text" id="name" name="name" value="${studentById.name}">
        </div>
        <div class="form-group">
            <label for="surname">Surname:</label>
            <input type="text" id="surname" name="surname" value="${studentById.surname}">
        </div>
        <div class="form-group">
            <label for="middleName">Middle Name:</label>
            <input type="text" id="middleName" name="middleName" value="${studentById.middleName}">
        </div>
        <input type="submit" value="Update">
    </form>
    <form action="${pageContext.request.contextPath}/api/delete" method="post">
        <input type="hidden" id="id" name="id" value="${studentById.id}">
        <input type="submit" value="Delete" class="delete-btn">
    </form>
</div>
</body>
</html>
