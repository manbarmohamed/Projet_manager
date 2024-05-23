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
                <img src="https://i.ibb.co/g33gWW3/28.jpg" alt="">
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
        <div class="overview">
            <div class="title">
                <h2 class="section--title">Overview</h2>
                <select name="date" id="date" class="dropdown">
                    <option value="today">Today</option>
                    <option value="lastweek">Last Week</option>
                    <option value="lastmonth">Last Month</option>
                    <option value="lastyear">Last Year</option>
                    <option value="alltime">All Time</option>
                </select>
            </div>
            <div class="cards">
                <div class="card card-1">
                    <div class="card--data">
                        <div class="card--content">
                            <h5 class="card--title">Total Projects</h5>
                            <h1>${totalProjet}</h1>
                        </div>
                        <i class="ri-user-2-line card--icon--lg"></i>
                    </div>
                    <div class="card--stats">
                        <span><i class="ri-bar-chart-fill card--icon stat--icon"></i>65%</span>
                        <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i>10</span>
                        <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i>2</span>
                    </div>
                </div>
                <div class="card card-2">
                    <div class="card--data">
                        <div class="card--content">
                            <h5 class="card--title">Total Tasks</h5>
                            <h1>${totalTache}</h1>
                        </div>
                        <i class="ri-user-line card--icon--lg"></i>
                    </div>
                    <div class="card--stats">
                        <span><i class="ri-bar-chart-fill card--icon stat--icon"></i>82%</span>
                        <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i>230</span>
                        <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i>45</span>
                    </div>
                </div>
                <div class="card card-3">
                    <div class="card--data">
                        <div class="card--content">
                            <h5 class="card--title">Total Ressources</h5>
                            <h1>${totalRessource}</h1>
                        </div>
                        <i class="ri-calendar-2-line card--icon--lg"></i>
                    </div>
                    <div class="card--stats">
                        <span><i class="ri-bar-chart-fill card--icon stat--icon"></i>27%</span>
                        <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i>31</span>
                        <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i>23</span>
                    </div>
                </div>
                <div class="card card-4">
                    <div class="card--data">
                        <div class="card--content">
                            <h5 class="card--title">Tasks Done</h5>
                            <h1>${totalDone}/${totalTache}</h1>
                        </div>
                        <i class="ri-hotel-bed-line card--icon--lg"></i>
                    </div>
                    <div class="card--stats">
                        <span><i class="ri-bar-chart-fill card--icon stat--icon"></i>8%</span>
                        <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i>11</span>
                        <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i>2</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="doctors">
            <div class="title">
                <h2 class="section--title">Projects</h2>
                <div class="doctors--right--btns">
                    <select name="date" id="date" class="dropdown doctor--filter">
                        <option >Filter</option>
                        <option value="free">Free</option>
                        <option value="scheduled">Scheduled</option>
                    </select>
                    <button type="button" class="btn btn-primary add" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap"><i class="ri-add-line"></i>Add Projet</button>

                </div>
            </div>
            <div class="doctors--cards">
                <c:forEach items="${listOfProjet}" var="proj">
                    <div class="doctor--card">
                        <div class="img--box--cover">
                            <div class="img--box">
                                <img src="https://i.ibb.co/WKndNpf/doctor.png" alt="">
                            </div>

                        </div>
                        <a href="showT?idpT=${proj.getProjetId()}"><p class="free">${proj.getProjetName()}</p></a>
                        <div class="active-links">
                            <a href="edit?idP=${proj.getProjetId()}"><i class="ri-edit-line edit"></i></a>
                            <a href="del?idP=${proj.getProjetId()}"><i class="ri-delete-bin-line delete"></i></a>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="recent--patients">
            <div class="title">
                <h2 class="section--title">Recent Tasks</h2>
                <button class="add"><i class="ri-add-line"></i>Add Task</button>
            </div>
            <div class="table">
                <table>
                    <thead>
                    <tr>
                        <th>Description</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Settings</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="task" items="${recentTaches}">
                        <tr>
                            <td>${task.getTacheDescription()}</td>
                            <td>${task.getStartDate()}</td>
                            <td>${task.getEndDate()}</td>
                            <td>${task.getStatus()}</td>
                            <td><span>
                                <a href="#"><i class="ri-edit-line edit"></i></a>
                                <a href="#"><i class="ri-delete-bin-line delete"></i></a>
                            </span></td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add New Project</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formbold-main-wrapper">
                        <!-- Author: FormBold Team -->
                        <!-- Learn More: https://formbold.com -->
                        <div class="formbold-form-wrapper">
                            <form action="add" method="POST">
                                <div class="flex flex-wrap formbold--mx-3">
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5">
                                            <label for="fName" class="formbold-form-label"> Projet Name: </label>
                                            <input
                                                    type="text"
                                                    name="pName"
                                                    id="fName"
                                                    placeholder="Project Name"
                                                    class="formbold-form-input"
                                            />
                                        </div>
                                    </div>
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5">
                                            <label for="lName" class="formbold-form-label"> Description: </label>
                                            <input
                                                    type="text"
                                                    name="pDesc"
                                                    id="lName"
                                                    placeholder="Project Description"
                                                    class="formbold-form-input"
                                            />
                                        </div>
                                    </div>
                                </div>

                                <div class="formbold-mb-5">
                                    <label for="guest" class="formbold-form-label">
                                        Budget:
                                    </label>
                                    <input
                                            type="number"
                                            name="budget"
                                            id="guest"
                                            placeholder="Project Budget"
                                            class="formbold-form-input"
                                    />
                                </div>

                                <div class="flex flex-wrap formbold--mx-3">
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5 w-full">
                                            <label for="date" class="formbold-form-label"> Start Date </label>
                                            <input
                                                    type="date"
                                                    name="sDate"
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
                                                    name="eDate"
                                                    id="time"
                                                    class="formbold-form-input"
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button class="formbold-btn">Add Project</button>
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
    window.onload = function() {
        var completedCount = ${totalDone};
        var totalCount = ${totalTache};
        var percentage = (totalCount > 0) ? (completedCount / totalCount) * 100 : 0;
        var progressBar = document.getElementById('progress-bar');
        var progressText = document.getElementById('progress-text');

        progressBar.style.width = percentage + '%';
        progressBar.setAttribute('aria-valuenow', percentage);
        progressText.textContent = Math.round(percentage) + '% Done';
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>