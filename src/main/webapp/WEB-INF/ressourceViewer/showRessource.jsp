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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        <%@include file="/WEB-INF/css/style.css"%>

    </style>
    <title>Ressources</title>
</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>Med<span>Ex</span></h2>
    </div>

</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="#" id="active--link">
                    <span class="icon icon-1"><i class="ri-layout-grid-line"></i></span>
                    <span class="sidebar--item">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-5"><i class="ri-line-chart-line"></i></span>
                    <span class="sidebar--item">Activity</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-6"><i class="ri-customer-service-line"></i></span>
                    <span class="sidebar--item">Support</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-7"><i class="ri-settings-3-line"></i></span>
                    <span class="sidebar--item">Settings</span>
                </a>
            </li>
            <li>
                <a href="logout">
                    <span class="icon icon-8"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">Logout</span>
                </a>
            </li>
        </ul>



    </div>
    <div class="main--content">
        <div class="recent--patients" style="display: flex; flex-direction: column;  justify-content: center;height: 100%;">
            <div class="title">
                <h2 class="section--title">Ressource Page</h2>
                <button class="add">
                    <a href="addres" style="color: #fff">
                        <i class="ri-add-line"></i>
                        Add Ressource
                    </a>
                </button>
                <a href="PDFServlet" class="btn btn-primary">Export to PDF</a>
            </div>
            <div class="table">
                <table>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Quantity</th>
                        <th>Supplier Name</th>

                        <th>Settings</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="Ressource" items="${resList}">
                        <tr>
                            <td>${Ressource.ressourceName}</td>
                            <td>${Ressource.type}</td>
                            <td>${Ressource.quantity}</td>
                            <td>${Ressource.supplierInfo}</td>
                            <td>
                                <span>
                                    <a href="editR?idRes=${Ressource.ressourceId}"><i class="ri-edit-line edit"></i></a>
                                    <a href="delR?idRes=${Ressource.ressourceId}&idT=${Ressource.tacheId}" onclick="confirmDeletion(event, '${Ressource.ressourceId}', 'Ressource',${Ressource.tacheId})"><i class="ri-delete-bin-line delete"></i></a>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
    let menu = document.querySelector('.menu')
    let sidebar = document.querySelector('.sidebar')
    let mainContent = document.querySelector('.main--content')
    menu.onclick = function() {
        sidebar.classList.toggle('active')
        mainContent.classList.toggle('active')
    }


    function confirmDeletion(event, id, type ,id2) {
        event.preventDefault();
        if (confirm('Are you sure you want to delete this ' + type + '?')) {
            window.location.href = 'delR?idRes=' + id+'&idT='+id2;
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>