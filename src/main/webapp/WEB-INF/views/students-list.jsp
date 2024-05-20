<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Students List</title>
    <style>

        h2 {
            text-align: center;
        }

        .select-box {
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            text-align: right;
        }


        .container {
            max-width: 850px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .add-button-container {
            margin-bottom: 20px;
        }

        .add-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        .add-button:hover {
            background-color: #0056b3;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
        }

        .grid-item {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .search-container {

            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Student List</h2>

    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Search for students..." onclick=""/>
    </div>


    <div class="add-button-container">
        <a href="${pageContext.request.contextPath}/api/add-new" class="add-button">Add New Student</a>
    </div>

    <div class="select-box">
        <select id="selectBox">
            <option value="option1">All</option>
            <option value="option2">Student</option>

        </select></div>


    <div id="usersList" class="grid-container">
    </div>

</div>

<script src = '/users.js'></script>
</body>
</html>
