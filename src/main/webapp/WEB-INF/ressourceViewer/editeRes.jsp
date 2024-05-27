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
        <h2>Construction<span>Xpert</span></h2>
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

            <div class="formbold-main-wrapper">
                <!-- Author: FormBold Team -->
                <!-- Learn More: https://formbold.com -->
                <div class="formbold-form-wrapper">
                    <c:forEach var="res" items="${resList}">
                        <form action="editR" method="post">
                            <div class="flex flex-wrap formbold--mx-3">
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label for="fName" class="formbold-form-label"> Ressource Id </label>
                                        <input
                                                type="text"
                                                name="idres"
                                                id="fName"
                                                value="${res.ressourceId}"
                                                class="formbold-form-input"
                                                readonly
                                        />
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label for="lName" class="formbold-form-label"> Name </label>
                                        <input
                                                type="text"
                                                name="nameR"
                                                id="lName"
                                                value="${res.ressourceName}"
                                                class="formbold-form-input"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="formbold-mb-5">
                                <label for="guest" class="formbold-form-label">Tache Id</label>
                                <input
                                        type="text"
                                        name="tacheId"
                                        id="guest"
                                        value="${res.tacheId}" readonly
                                        class="formbold-form-input"
                                />
                            </div>
                            <div class="flex flex-wrap formbold--mx-3">
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5 w-full">
                                        <label for="date" class="formbold-form-label">Supplier Name </label>
                                        <input
                                                type="text"
                                                name="supName"
                                                value="${res.supplierInfo}"
                                                id="date"
                                                class="formbold-form-input"
                                        />

                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label for="time" class="formbold-form-label"> End Date </label>
                                        <input
                                                type="number"
                                                name="quantity"
                                                value="${res.quantity}"
                                                id="time"
                                                class="formbold-form-input"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="formbold-mb-5">
                                <label for="statut" class="formbold-radio-label"> Type </label>
                                <select class="form-control formbold-form-input" id="statut" name="type" value="${res.type}" required>
                                    <option value="MATERIAL">MATERIAL</option>
                                    <option value="EQUIPMENT">EQUIPMENT</option>
                                    <option value="LABOR">LABOR</option>
                                </select>
                            </div>
                            <div>
                                <button class="formbold-btn">Edit</button>
                            </div>
                        </form>
                    </c:forEach>
                </div>
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
</script>
</body>
</html>