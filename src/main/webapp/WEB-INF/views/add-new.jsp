<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add New Student</title>
    <style>

        h2 {
            text-align: center;
        }


        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="date"], input[type = "number"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div>
<h2>Add New Student</h2>

<form action="${pageContext.request.contextPath}/api/save" method="post">
    <label for="id">ID:</label>
    <input type="number" id="id" name="id" required><br>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="surname">Surname:</label>
    <input type="text" id="surname" name="surname" required><br>

    <label for="middleName">Middle Name:</label>
    <input type="text" id="middleName" name="middleName"><br>

    <label for="sex">Sex:</label>
    <select id="sex" name="sex" required>
        <option value="20000015">Male</option>
        <option value="20000016">Female</option>
    </select><br>

<%--    <label for="birthdate">Birthdate:</label>--%>
<%--    <input type="datetime-local" id="birthdate" name="birthdate" required><br>--%>

    <label for="com_person_uniq_id">Com Person Uniq Id:</label>
    <input type="number" id="com_person_uniq_id" name="com_person_uniq_id" required><br>

    <input type="submit" value="Add Student">
</form>
</div>
</body>
</html>
