
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Diet & Exercise Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }
        .diet-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 70%;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .submit-btn {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #218838;
        }
        .search-container {
            margin-bottom: 20px;
            text-align: center;
        }
        .search-container input {
            width: 40%;
            padding: 8px;
            margin-right: 10px;
        }
        .search-btn {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="diet-container">
        <h2>Your Diet & Exercise Plan</h2>

        <!-- Search Form -->
        <div class="search-container">
            <form action="getDietList" method="get">
                <input type="text" name="name" placeholder="Search by Name">
                <input type="email" name="email" placeholder="Search by Email">
                <input type="submit" value="Search" class="search-btn">
            </form>
        </div>

       <form action="saveDietPlan" method="post">
           <table>
               <tr>
                   <th>Meal Time</th>
                   <th>Food Items</th>
                   <th>Calories</th>
                   <th>Exercise</th>
                   <th>Duration (mins)</th>
                   <th>Intensity</th>
               </tr>

               <tr>
                   <!-- Fix input name to match Java entity field -->
                   <input type="hidden" name="UserId" value="${entity.id}">

                   <td><input type="text" name="mealTime" value="${diet.mealTime}"></td>
                   <td><input type="text" name="foodItems" value="${diet.foodItems}"></td>
                   <td><input type="number" name="calories" value="${diet.calories}"></td>
                   <td><input type="text" name="exercise" value="${diet.exercise}"></td>
                   <td><input type="number" name="duration" value="${diet.duration}"></td>
                   <td><input type="text" name="intensity" value="${diet.intensity}"></td>
               </tr>
           </table>
           <input type="submit" value="Save Plan" class="submit-btn">
       </form>

    </div>

</body>
</html>
