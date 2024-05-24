<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        <%@include file="/WEB-INF/css/style.css"%>
    </style>
</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>Med<span>Ex</span></h2>
    </div>
    <div class="search--notification--profile">
        <div class="search">
            <input type="text" placeholder="Search Scdule..">
            <button><i class="ri-search-2-line"></i></button>
        </div>
        <div class="notification--profile">
            <div class="picon lock">
                <i class="ri-lock-line"></i>
            </div>
            <div class="picon bell">
                <i class="ri-notification-2-line"></i>
            </div>
            <div class="picon chat">
                <i class="ri-wechat-2-line"></i>
            </div>
            <div class="picon profile">
                <img src="admin.png" alt="">
            </div>
        </div>
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
                    <span class="icon icon-2"><i class="ri-calendar-2-line"></i></span>
                    <span class="sidebar--item">Schedule</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-3"><i class="ri-user-2-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">Reliable Doctor</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-4"><i class="ri-user-line"></i></span>
                    <span class="sidebar--item">Patients</span>
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
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="#">
                    <span class="icon icon-7"><i class="ri-settings-3-line"></i></span>
                    <span class="sidebar--item">Settings</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-8"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">Logout</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="main--content">

        <div class="recent--patients" style="display: flex; flex-direction: column;  justify-content: center;height: 100%;">

            <div class="formbold-main-wrapper">
                <!-- Author: FormBold Team -->
                <!-- Learn More: https://formbold.com -->
                <div class="formbold-form-wrapper">

                        <form action="addres" method="post">
                            <div class="flex flex-wrap formbold--mx-3">
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label for="lName" class="formbold-form-label"> Name </label>
                                        <input
                                                type="text"
                                                name="nameR"
                                                id="lName"

                                                class="formbold-form-input"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="formbold-mb-5">
                                <label for="tacheid" class="formbold-form-label">Tache Id</label>
                                <select class="form-control formbold-form-input" id="tacheid" name="tacheId" required>
                        <c:forEach var="tache" items="${tache}">
                            <option value="${tache.tacheId}">${tache.tacheDescription} (ID: ${tache.tacheId})</option>
                        </c:forEach>
                        </select>
                            </div>
                            <div class="flex flex-wrap formbold--mx-3">
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5 w-full">
                                        <label for="date" class="formbold-form-label">Supplier Name </label>
                                        <input
                                                type="text"
                                                name="supName"

                                                id="date"
                                                class="formbold-form-input"
                                        />

                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label for="time" class="formbold-form-label"> Quantity </label>
                                        <input
                                                type="number"
                                                name="quantity"

                                                id="time"
                                                class="formbold-form-input"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="flex formbold-mb-5">
                                <div class="flex">
                                    <label for="statut" class="formbold-radio-label"> Type </label>
                                    <select class="form-control formbold-form-input" id="statut" name="type" required>
                                        <option value="MATERIAL">MATERIAL</option>
                                        <option value="EQUIPMENT">EQUIPMENT</option>
                                        <option value="LABOR">LABOR</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <button class="formbold-btn">Add Ressource</button>
                            </div>
                        </form>

                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>














<form action="addres" method="post">
    <div class="form-group">
        <label for="description">Name</label>
        <input type="text" class="form-control" id="description" name="nameR" required>
    </div>
    <div class="form-group">
        <label for="dateDebut">Supplier Name</label>
        <input type="text" class="form-control" id="dateDebut" name="supName" required>
    </div>
    <div class="form-group">
        <label for="dateFin">Quantity</label>
        <input type="number" class="form-control" id="dateFin" name="quantity" required>
    </div>
    <div class="form-group">
        <label for="statut">type</label>
        <select class="form-control" id="statut" name="type" required>
            <option value="MATERIAL">MATERIAL</option>
            <option value="EQUIPMENT">EQUIPMENT</option>
            <option value="LABOR">LABOR</option>
        </select>
    </div>

    <div class="form-group">
        <label for="projetId">Tache ID</label>
        <select class="form-control" id="projetId" name="tacheId" required>
            <c:forEach var="tache" items="${tache}">
                <option value="${tache.tacheId}">${tache.tacheDescription} (ID: ${tache.tacheId})</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Ajouter</button>