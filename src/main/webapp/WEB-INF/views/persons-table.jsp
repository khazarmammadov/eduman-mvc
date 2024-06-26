<%--
  Created by IntelliJ IDEA.
  User: m.khazar
  Date: 16.05.2024
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Table Example</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<%--    <style>--%>
<%--        /* The Modal (background) */--%>
<%--        .modal {--%>
<%--            display: none;--%>
<%--            position: fixed;--%>
<%--            z-index: 1;--%>
<%--            left: 0;--%>
<%--            top: 0;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            overflow: auto;--%>
<%--            background-color: rgb(0,0,0);--%>
<%--            background-color: rgba(0,0,0,0.4);--%>
<%--            padding-top: 60px;--%>
<%--        }--%>

<%--        /* Modal Content */--%>
<%--        .modal-content {--%>
<%--            background-color: #fefefe;--%>
<%--            margin: 5% auto;--%>
<%--            padding: 20px;--%>
<%--            border: 1px solid #888;--%>
<%--            width: 80%;--%>
<%--            max-width: 500px;--%>
<%--        }--%>

<%--        /* The Close Button */--%>
<%--        .close {--%>
<%--            color: #aaa;--%>
<%--            float: right;--%>
<%--            font-size: 28px;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .close:hover,--%>
<%--        .close:focus {--%>
<%--            color: black;--%>
<%--            text-decoration: none;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        form label {--%>
<%--            display: block;--%>
<%--            margin-top: 10px;--%>
<%--        }--%>

<%--        form input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            margin-top: 5px;--%>
<%--        }--%>

<%--        form button {--%>
<%--            margin-top: 20px;--%>
<%--            padding: 10px 20px;--%>
<%--            font-size: 16px;--%>
<%--        }--%>
<%--    </style>--%>
    <style>
    /* The Modal (background) */
    .modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
    }

    /* Modal Content */
    .modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 30px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px;
    }

    /* The Close Button */
    .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    }

    .close:hover,
    .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
    }

    form label {
    display: block;
    margin-top: 10px;
    }

    form input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    }

    form button {
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    }
</style>
</head>
<body>

<table id="example" class="display" style="width:100%">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>MiddleName</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<!-- The Modal -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Edit Student</h2>
        <form id="editForm">
            <label for="studentId">Student ID:</label>
            <input type="text" id="studentId" name="studentId" required readonly><br><br>
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required><br><br>
            <label for="middleName">Middle Name:</label>
            <input type="text" id="middleName" name="middleName"><br><br>
            <label for="surname">Surname:</label>
            <input type="text" id="surname" name="surname" required><br><br>
            <button type="submit">Save</button>
        </form>
    </div>
</div>

<!-- The Add Modal -->
<div id="myAddModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Edit Student</h2>
        <form id="addForm">
            <label for="studentId">Student ID:</label>
            <input type="text" id="addStudentId" name="studentId" required><br><br>
            <label for="firstName">First Name:</label>
            <input type="text" id="addFirstName" name="firstName" required><br><br>
            <label for="middleName">Middle Name:</label>
            <input type="text" id="addMiddleName" name="middleName" required><br><br>
            <label for="surname">Surname:</label>
            <input type="text" id="addSurname" name="surname" required><br><br>
            <button type="submit">Save</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="/person_grid.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<%--<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>--%>
<%--<script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>--%>
<%--<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>--%>
<%--<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>--%>


<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

<link href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css">
<link href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.dataTables.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.dataTables.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<%--    <script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.js"></script>--%>
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>
</body>
</html>

