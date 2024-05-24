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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <a href="index.html" >
                    <span class="icon icon-1"><i class="ri-layout-grid-line"></i></span>
                    <span class="sidebar--item">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#" id="active--link">
                    <span class="icon icon-2"><i class="ri-calendar-2-line"></i></span>
                    <span class="sidebar--item">Projects</span>
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
        <div class='app'>
            <main class='project'>
                <div class='project-info'>
                    <h1>Task Page</h1>
                    <div class='project-participants'>
                        <button type="button" class="add" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap"><i class="ri-add-line"></i>Add Task</button>
                    </div>
                </div>
                <div class='project-tasks'>
                    <div class='project-column'>
                        <div class='project-column-heading'>
                            <h2 class='project-column-heading__title'>TODO</h2><button class='project-column-heading__options'></button>
                        </div>
                        <c:forEach var="taskD" items="${tasktodo}">
                            <div class='task' draggable='true'>
                                <div class='task__tags'><a href="showR?idT=${taskD.getTacheId()}"><span class='task__tag task__tag--copyright'>${taskD.getStatus()}</span></a></div>
                                <p>${taskD.getTacheDescription()}</p>
                                <div class='task__stats'>
                                    <span><time datetime="2021-11-24T20:00:00">${taskD.getStartDate()}</time></span>
                                    <span><time datetime="2021-11-24T20:00:00">${taskD.getEndDate()}</time></span>

                                    <span>
                                        <a href="editT?idT=${taskD.getTacheId()}"><i class="ri-edit-line edit"></i></a>
                                    </span>
                                    <span>
                                        <a href="delT?idT=${taskD.getTacheId()}&idpT=${taskD.projectId}"><i class="ri-delete-bin-line delete"></i></a>
                                    </span>

                                </div>
                            </div>
                        </c:forEach>





                    </div>
                    <div class='project-column'><div class='project-column-heading'>
                        <h2 class='project-column-heading__title'>In Progress</h2><button class='project-column-heading__options'></button>
                    </div>
<c:forEach var="taskIn" items="${taskinpro}">
                        <div class='task' draggable='true'>
                            <div class='task__tags'><a href="showR?idT=${taskIn.getTacheId()}"><span class='task__tag task__tag--design'>${taskIn.getStatus()}</span></a></div>
                            <p>${taskIn.getTacheDescription()}</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00">${taskIn.getStartDate()}</time></span>
                                <span><time datetime="2021-11-24T20:00:00">${taskIn.getEndDate()}</time></span>

                                <span>
                                        <a href="editT?idT=${taskIn.getTacheId()}"><i class="ri-edit-line edit"></i></a>
                                    </span>
                                <span>
                                        <a href="delT?idT=${taskIn.getTacheId()}"><i class="ri-delete-bin-line delete"></i></a>
                                    </span>

                            </div>
                        </div>
</c:forEach>



                    </div>

                    <div class='project-column'><div class='project-column-heading'>
                        <h2 class='project-column-heading__title'>Done</h2><button class='project-column-heading__options'></button>
                    </div>
<c:forEach var="taskdn" items="${taskdone}">

    <div class='task' draggable='true'>

            <div class='task__tags'><a href="showR?idT=${taskdn.getTacheId()}"><span class='task__tag task__tag--illustration'>${taskdn.getStatus()}</span></a></div>



        <p>${taskdn.getTacheDescription()}</p>
        <div class='task__stats'>
            <span><time datetime="2021-11-24T20:00:00">${taskdn.getStartDate()}</time></span>
            <span><time datetime="2021-11-24T20:00:00">${taskdn.getEndDate()}</time></span>

            <span>
                                        <a href="editT?idT=${taskdn.getTacheId()}"><i class="ri-edit-line edit"></i></a>
                                    </span>
            <span>
                                        <a href="delT?idT=${taskdn.getTacheId()}"><i class="ri-delete-bin-line delete"></i></a>
                                    </span>

        </div>
    </div>
</c:forEach>

                    </div>

                </div>
            </main>
            <aside class='task-details'>
                <div class='tag-progress'>
                    <h2>Task Progress</h2>
                    <div class='tag-progress'>
                        <p>Task Done</p>
                        <div class="progress progress--copyright">
                            <div id="progress-bar" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p id="progress-text">0% Done</p>
                    </div>

                    <div class='tag-progress'>
                        <p>Task Todo </p>
                        <div class="progress progress--copyright">
                            <div id="progress-bar-todo" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p id="progress-text-todo">0% ToDo</p>
                    </div>
                    <div class='tag-progress'>
                        <p>UI Design <span>2/7</span></p>
                        <progress class="progress progress--design" max="7" value="2"> 2 </progress>
                    </div>
                </div>
                <div class='task-activity'>
                    <h2>Recent Activity</h2>
                    <div class="container mt-5">
                        <h1>Tâches par Statut</h1>
                        <canvas id="tacheStatutChart"></canvas>
                    </div>


                </div>

            </aside>

        </div>

    </div>


    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add New Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formbold-main-wrapper">
                        <!-- Author: FormBold Team -->
                        <!-- Learn More: https://formbold.com -->
                        <div class="formbold-form-wrapper">
                            <form action="addT" method="POST">
                                <div class="flex flex-wrap formbold--mx-3">
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5">
                                            <label for="fName" class="formbold-form-label"> Task Description: </label>
                                            <input
                                                    type="text"
                                                    name="description"
                                                    id="fName"
                                                    placeholder="Project Name"
                                                    class="formbold-form-input"
                                            />
                                        </div>
                                    </div>
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5">
                                            <label for="statut" class="formbold-form-label">Statut</label>
                                            <select class="form-control formbold-form-input" id="statut" name="status" required>
                                                <option value="TODO">TODO</option>
                                                <option value="INPROGRESS">INPROGRESS</option>
                                                <option value="DONE">DONE</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="formbold-mb-5">
                                    <label for="projetId" class="formbold-form-label">Projet ID</label>
                                    <select class="form-control formbold-form-input" id="projetId" name="projetId" required>
                                        <c:forEach var="projet" items="${projets}">
                                            <option value="${projet.getProjetId()}">${projet.getProjetName()} (ID: ${projet.getProjetId()})</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="flex flex-wrap formbold--mx-3">
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5 w-full">
                                            <label for="date" class="formbold-form-label"> Start Date </label>
                                            <input
                                                    type="date"
                                                    name="startDate"
                                                    id="date"
                                                    class="formbold-form-input"
                                            />
                                        </div>
                                    </div>
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5">
                                            <label for="time" class="formbold-form-label"> End Date </label>
                                            <input
                                                    type="date"
                                                    name="endDate"
                                                    id="time"
                                                    class="formbold-form-input"
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button class="formbold-btn">Add Task</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</section>






<script>

        document.addEventListener('DOMContentLoaded', function () {
        const ctx = document.getElementById('tacheStatutChart').getContext('2d');
        const tacheStatutChart = new Chart(ctx, {
        type: 'bar',
        data: {
        labels: ['ToDo', 'InProgress', 'Done'],
        datasets: [{
        label: 'Nombre de Tâches',
        data: [<%= request.getAttribute("todo") %>, <%= request.getAttribute("inProgress") %>, <%= request.getAttribute("done") %>],
        backgroundColor: ['#ff6384', '#36a2eb', '#cc65fe'],
    }]
    },
        options: {
        responsive: true,
        scales: {
        y: {
        beginAtZero: true,
        title: {
        display: true,
        text: 'Nombre de Tâches'
    }
    }
    },
        plugins: {
        legend: {
        display: false
    },
        tooltip: {
        callbacks: {
        label: function (tooltipItem) {
        return tooltipItem.raw;
    }
    }
    }
    }
    }
    });
    });

        window.onload = function () {
            var completedCount = ${totalDone};
            var totalCount = ${totalTache};
            var percentage = (totalCount > 0) ? (completedCount / totalCount) * 100 : 0;
            var progressBar = document.getElementById('progress-bar');
            var progressText = document.getElementById('progress-text');

            progressBar.style.width = percentage + '%';
            progressBar.setAttribute('aria-valuenow', percentage);
            progressText.textContent = Math.round(percentage) + '% Done';
        }
        window.onload = function () {
            var completedCount = ${totalDone};
            var totalCount = ${totalTache};
            var percentage = (totalCount > 0) ? (completedCount / totalCount) * 100 : 0;
            var progressBar = document.getElementById('progress-bar');
            var progressText = document.getElementById('progress-text');

            progressBar.style.width = percentage + '%';
            progressBar.setAttribute('aria-valuenow', percentage);
            progressText.textContent = Math.round(percentage) + '% Done';
        }
        window.onload = function () {
            var completedCount = ${totalTodo};
            var totalCount = ${totalTache};
            var percentage = (totalCount > 0) ? (completedCount / totalCount) * 100 : 0;
            var progressBar = document.getElementById('progress-bar-todo');
            var progressText = document.getElementById('progress-text-todo');

            progressBar.style.width = percentage + '%';
            progressBar.setAttribute('aria-valuenow', percentage);
            progressText.textContent = Math.round(percentage) + '% Done';
        }

</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>


