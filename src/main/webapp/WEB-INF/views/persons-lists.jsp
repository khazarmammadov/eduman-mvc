<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Data</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

<form action="${pageContext.request.contextPath}/api/persons" method="get">
    <label for="option">Combo:</label>
    <select name="option" id="option" onchange="window.location.href=this.value">
        <option <c:if test="${param.type==0}">selected</c:if> value="${pageContext.request.contextPath}/api/persons?type=0">All</option>
        <option <c:if test="${param.type==1}">selected</c:if> value="${pageContext.request.contextPath}/api/persons?type=1">Student</option>
    </select>

</form>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Middle Name</th>
        <th>Sex</th>
        <th>Unique ID</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="listP" items="${listP}">
        <tr>
            <td>${listP.id}</td>
            <td>${listP.name}</td>
            <td>${listP.surname}</td>
            <td>${listP.middleName}</td>
            <td>${listP.sex}</td>
            <td>${listP.uniqueId}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>

