<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 19/05/2024
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Edit Projet</h2>
<c:forEach var="prj" items="${projets}">
    <form action="edit" method="post">
        Projet Id: <input type="text" name="idP" value="${prj.getProjetId()}" readonly><br>
        Projet Name: <input type="text" name="Name" value="${prj.getProjetName()}"><br>
        Description: <input type="text" name="Desc" value="${prj.getProjetDescription()}"><br>
        Start Date: <input type="date" name="Date" value="${prj.getStartDate()}"><br>
        End Date: <input type="date" name="DateE" value="${prj.getEndDate()}"><br>
        Budget: <input type="number" name="budget" value="${prj.getBudget()}"><br>
        <input type="submit" value="Edit Projet">
    </form>
</c:forEach>

</body>
</html>
