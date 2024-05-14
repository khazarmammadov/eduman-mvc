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
    <script>
        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires="+d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for(var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function handleOptionChange(value) {
            setCookie("option", value, 365);
            window.location.href = value;
        }

        window.onload = function() {
            var selectedOption = getCookie("option");
            if (selectedOption !== "") {
                document.getElementById("option").value = selectedOption;
            }
        };
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/api/persons" method="get">
    <label for="option">Combo:</label>
    <select name="option" id="option" onchange="handleOptionChange(this.value)">
<%--        <option <c:if test="${param.type==0}">selected</c:if> value="${pageContext.request.contextPath}/api/persons?type=0">All</option>--%>
<%--        <option <c:if test="${param.type==1}">selected</c:if> value="${pageContext.request.contextPath}/api/persons?type=1">Student</option>--%>

        <option value=""></option>
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
