<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Tâche</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Ajouter une Tâche</h1>
    <form action="addT" method="post">
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" required></textarea>
        </div>
        <div class="form-group">
            <label for="dateDebut">Date de Début</label>
            <input type="date" class="form-control" id="dateDebut" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="dateFin">Date de Fin</label>
            <input type="date" class="form-control" id="dateFin" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="statut">Statut</label>
            <select class="form-control" id="statut" name="status" required>
                <option value="TODO">TODO</option>
                <option value="INPROGRESS">INPROGRESS</option>
                <option value="DONE">DONE</option>
            </select>
        </div>

        <div class="form-group">
            <label for="projetId">Projet ID</label>
            <select class="form-control" id="projetId" name="projetId" required>
                <c:forEach var="projet" items="${projets}">
                    <option value="${projet.getProjetId()}">${projet.getProjetName()} (ID: ${projet.getProjetId()})</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Ajouter</button>
    </form>
</div>

</body>
</html>
