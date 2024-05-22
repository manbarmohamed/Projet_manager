<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.models.Tache" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.interfaces.TacheDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Tâches</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h1>Liste des Tâches</h1>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Statut</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="task" items="${listoftask}">
            <tr>
                <td>${task.getTacheDescription()}</td>
                <td>${task.getStartDate()}</td>
                <td>${task.getEndDate()}</td>
                <td>${task.getStatus()}</td>
                <td>
                <td>
                    <select class="form-control" onchange="updateTacheStatut(${task.getTacheId()}, this.value)">
                        <option value="TODO" ${task.getStatus() == 'TODO' ? 'selected' : ''}>TODO</option>
                        <option value="INPROGRESS" ${task.getStatus() == 'INPROGRESS' ? 'selected' : ''}>INPROGRESS</option>
                        <option value="DONE" ${task.getStatus() == 'DONE' ? 'selected' : ''}>DONE</option>
                    </select>
                </td>
                <td>${task.getProjectId()}</td>
                <td>
                    <ul class="action-list">
                        <li><a href="editT?idT=${task.getTacheId()}" class="btn btn-primary"><i class="fa fa-pencil"></i></a></li>
                        <li><a href="delT?idT=${task.getTacheId()}" class="btn btn-danger"><i class="fa fa-trash"></i></a></li>
                    </ul>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>

    function updateTacheStatut(tacheId, statut) {
        $.ajax({
            type: 'POST',
            url: 'UpdateTacheStatutServlet',
            data: { tacheId: tacheId, statut: statut },
            success: function(response) {
                if (!response.success) {
                    alert("Erreur lors de la mise à jour du statut de la tâche.");
                }
            },
            error: function() {
                alert("Erreur lors de la requête AJAX.");
            }
        });
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
