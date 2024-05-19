<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 19/05/2024
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>

<h2>HTML Table</h2>

<table>
    <tr>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
        <th>Projet Id</th>

    </tr>
    <c:forEach var="task" items="${listoftask}">
        <tr>
            <td>${task.getTacheDescription()}</td>
            <td>${task.getStartDate()}</td>
            <td>${task.getEndDate()}</td>
            <td>${task.getStatus()}</td>
            <td>${task.getProjectId()}</td>
        </tr>
    </c:forEach>


</table>

</body>
</html>


