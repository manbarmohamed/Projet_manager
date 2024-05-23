<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tâches par Statut</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container mt-5">
    <h1>Tâches par Statut</h1>
    <canvas id="tacheStatutChart"></canvas>
</div>

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
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
