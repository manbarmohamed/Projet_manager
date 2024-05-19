<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edite une Tâche</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Edite une Tâche</h1>
<c:forEach var="task" items="${listoftask}">
    <form action="editT" method="post">
        <div class="form-group">
            <label for="tacheid">Tache Id</label>
            <input type="text" class="form-control" id="tacheid" name="tacheId" value="${task.getTacheId()}" readonly>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" value="${task.getTacheDescription()}" required></textarea>
        </div>
        <div class="form-group">
            <label for="dateDebut">Date de Début</label>
            <input type="date" class="form-control" id="dateDebut" name="startDate" value="${task.getStartDate()}" required>
        </div>
        <div class="form-group">
            <label for="dateFin">Date de Fin</label>
            <input type="date" class="form-control" id="dateFin" name="endDate" value="${task.getEndDate()}" required>
        </div>
        <div class="form-group">
            <label for="statut">Statut</label>
            <select class="form-control" id="statut" name="status" value="${task.getStatus()}"  required>
                <option value="TODO">TODO</option>
                <option value="INPROGRESS">INPROGRESS</option>
                <option value="DONE">DONE</option>
            </select>
        </div>
        <div class="form-group">
            <label for="projetId">Projet ID</label>
            <input type="number" class="form-control" id="projetId" name="projetId" value="${task.getProjectId()}" readonly required>
        </div>
        <button type="submit" class="btn btn-primary">Edite</button>
    </form>

</c:forEach>
</div>

</body>
</html>
