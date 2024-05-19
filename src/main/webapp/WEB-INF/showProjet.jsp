<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .panel{
            font-family: 'Raleway', sans-serif;
            padding: 0;
            border: none;
        }
        .panel .panel-heading{
            background: #662da3;
            padding: 15px;
            margin: 0 0 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        .panel .panel-heading .title{
            color: #fff;
            font-size: 24px;
            font-weight: 600;
            line-height: 35px;
            text-transform: capitalize;
            margin: 0 10px 0 0;
        }
        .panel .panel-heading .btn{
            color: #662da3;
            background-color: #fff;
            font-size: 14px;
            font-weight: 600;
            padding: 7px 15px;
            border: none;
            border-radius: 5px;
            transition: all 0.3s ease 0s;
        }
        .panel .panel-heading .btn:hover{ box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); }
        .panel .panel-body{
            padding: 0 0;
            margin: 0 0 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .panel .panel-body .table thead tr th{
            color: #333;
            background: linear-gradient(transparent, #f6f6f6);
            font-size: 17px;
            font-weight: 700;
            padding: 12px;
            border-bottom: none;
        }
        .panel .panel-body .table thead tr th:nth-of-type(2){ width: 50%; }
        .panel .panel-body .table tbody tr td{
            color: #555;
            background: linear-gradient(transparent,#f6f6f6);
            font-size: 15px;
            padding: 10px;
            vertical-align: middle;
            border-color: #ddd;
        }
        .panel .panel-body .table tbody .form-control:focus{
            border-color: #662da3;
            box-shadow: 0 0 4px #662da3;
        }

        .panel .panel-body .table tbody .user_icon img{
            width: 100%;
            height: auto;
        }
        .panel .panel-body .table tbody .action-list{
            padding: 0;
            margin: 0;
            list-style: none;
            display: flex;
        }
        .panel .panel-body .table tbody .action-list li{ display: inline-block; }
        .panel .panel-body .table tbody .action-list li a{
            color: #fff;
            font-size: 13px;
            line-height: 28px;
            height: 28px;
            width: 28px;
            padding: 0;
            border-radius: 5px;
            transition: all 0.3s ease 0s;
        }
        .panel .panel-body .table tbody .action-list li a:hover{ box-shadow: 0 0 5px #ddd; }
        .panel .panel-footer{
            color: #fff;
            background: #662da3;
            font-size: 16px;
            line-height: 33px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .pagination{ margin: 0; }
        .pagination li a{
            color: #fff;
            background-color: rgba(255,255,255,0.3);
            font-size: 15px;
            font-weight: 700;
            margin: 0 2px;
            border: none;
            border-radius: 3px;
            transition: all 0.3s ease 0s;
        }
        .pagination li a:hover,
        .pagination li a:focus,
        .pagination li.active a{
            color: #662da3;
            background-color: #fff;
        }
        @media only screen and (max-width:479px){
            .panel .panel-heading{ text-align: center; }
            .panel .panel-heading .title{
                float: none !important;
                margin: 0 0 10px;
            }
            .panel .panel-heading .btn{ float: none !important; }
        }
    </style>
</head>
<body>

<h2>List of Student</h2>

<div class="container ">
    <div class="row">
        <div class="col-md-offset-1 col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <h4 class="title pull-left">Users List</h4>
                            <a href="add" class="btn btn-sm btn-primary pull-right"><i class="fa fa-plus"></i> Add New</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body table-responsive">
                    <table class="table">
                        <thead>
                        <tr>

                            <th>Projet Name</th>
                            <th>Description</th>
                            <th>Start Date </th>
                            <th>End date</th>
                            <th>Budget</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="5"><input type="text" class="form-control" placeholder="Search Users"></td>
                        </tr>
                        <c:forEach items="${listOfProjet}" var="proj">

                            <tr>
                                <td>${proj.getProjetName()}</td>
                                <td>${proj.getProjetDescription()}</td>
                                <td>${proj.getStartDate()}</td>
                                <td>${proj.getEndDate()}</td>
                                <td>${proj.getBudget()}</td>
                                <td>
                                    <ul class="action-list">
                                        <li><a href="edit?idP=${proj.getProjetId()}" class="btn btn-primary"><i class="fa fa-pencil"></i></a></li>
                                        <li><a href="del?idP=${proj.getProjetId()}" class="btn btn-danger"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>