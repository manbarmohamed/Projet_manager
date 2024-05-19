<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 19/05/2024
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Add Projet</h2>
<form action="add" method="post">
    Projet Name: <input type="text" name="pName"><br>
    Description: <input type="text" name="pDesc"><br>
    Start Date: <input type="date" name="sDate"><br>
    End Date: <input type="date" name="eDate"><br>
    Budget: <input type="number" name="budget"><br>
    <input type="submit" value="Add Projet">
</form>
</body>
</html>
