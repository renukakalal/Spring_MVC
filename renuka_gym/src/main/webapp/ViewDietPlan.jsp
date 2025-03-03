<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diet Plan</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .table {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        td {
            text-align: center;
        }
        .header {
            text-align: center;
            padding: 20px 0;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="header"><i class="fas fa-utensils"></i> Diet Plan</h2>

        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Meal Time</th>
                    <th>Food Items</th>
                    <th>Calories</th>
                    <th>Exercise</th>
                    <th>Duration (mins)</th>
                    <th>Intensity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="diet" items="${dietPlans}">
                    <tr>
                        <td>${diet.mealTime}</td>
                        <td>${diet.foodItems}</td>
                        <td>${diet.calories}</td>
                        <td>${diet.exercise}</td>
                        <td>${diet.duration}</td>
                        <td>${diet.intensity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="Profile.jsp" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Back to Home</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
