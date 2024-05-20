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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>

        .progress-bar {
            transition: width 1s ease-in-out;
        }

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
<div class="container mt-5">
    <h1>Nombre de Tâches Terminées</h1>
    <div class="progress">
        <div id="progress-bar" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <p id="progress-text">0% terminé</p>
</div>

<table>
    <tr>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
        <th>Projet Id</th>
        <th>Action</th>

    </tr>
    <c:forEach var="task" items="${listoftask}">
        <tr>
            <td>${task.getTacheDescription()}</td>
            <td>${task.getStartDate()}</td>
            <td>${task.getEndDate()}</td>
            <td>${task.getStatus()}</td>
            <td>${task.getProjectId()}</td>
            <td>
                <ul class="action-list">
                    <li><a href="editT?idT=${task.getTacheId()}" class="btn btn-primary"><i class="fa fa-pencil"></i></a></li>
                    <li><a href="delT?idT=${task.getTacheId()}" class="btn btn-danger"><i class="fa fa-trash"></i></a></li>
                </ul>
            </td>
        </tr>
    </c:forEach>


</table>
<script>
    window.onload = function() {
        var completedCount = ${completedCount};
        var totalCount = ${totalCount};
        var percentage = (totalCount > 0) ? (completedCount / totalCount) * 100 : 0;
        var progressBar = document.getElementById('progress-bar');
        var progressText = document.getElementById('progress-text');

        progressBar.style.width = percentage + '%';
        progressBar.setAttribute('aria-valuenow', percentage);
        progressText.textContent = Math.round(percentage) + '% terminé';
    }
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>


