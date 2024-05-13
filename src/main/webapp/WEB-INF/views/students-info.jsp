<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Students Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>Full Name</th>
        <th>Person Id</th>
        <th>Student Id</th>
        <th>Org Id</th>
        <th>Average</th>
    </tr>
    <c:forEach var="student" items="${studentsInfo}">
        <tr>
            <td>${student.fullName}</td>
            <td>${student.personId}</td>
            <td>${student.studentId}</td>
            <td>${student.orgId}</td>
            <td>${student.average}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
