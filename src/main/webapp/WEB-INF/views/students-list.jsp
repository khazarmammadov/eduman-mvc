<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Students List</title>
    <style>

        h2 {
            text-align: center;
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

    </style>
</head>
<body>
<div class="container">

    <h2>Student List</h2>

    <div class="add-button-container">
        <a href="${pageContext.request.contextPath}/api/add-new" class="add-button">Add New Student</a>
    </div>

    <label for="selectBox">button</label>
    <select id="selectBox">
        <option value="option1">All</option>
        <option value="option2">Student</option>

    </select>


<div class="grid-container">

    <div class="grid-column">
        <div class="grid-item">ID</div>
    </div>
    <div class="grid-column">
        <div class="grid-item">Name</div>
    </div>
    <div class="grid-column">
        <div class="grid-item">Surname</div>
    </div>
    <div class="grid-column">
        <div class="grid-item">MiddleName</div>
    </div>
    <div class="grid-column">
        <div class="grid-item">Edit</div>
    </div>

    <c:forEach var="student" items="${studentsList}">
        <div class="grid-column">
            <div class="grid-item">${student.id}</div>
        </div>
        <div class="grid-column">
            <div class="grid-item">${student.name}</div>
        </div>
        <div class="grid-column">
            <div class="grid-item">${student.surname}</div>
        </div>
        <div class="grid-column">
            <div class="grid-item">${student.middleName}</div>
        </div>
        <div class="grid-column">
            <div class="grid-item">
                <a href="${pageContext.request.contextPath}/api/edit/${student.id}">Edit</a>
            </div>
        </div>

    </c:forEach>
</div>
    </div>
</body>
</html>
