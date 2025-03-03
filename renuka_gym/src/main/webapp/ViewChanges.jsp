<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Body Transformation Progress</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 20px;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .month-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .month-header {
            background: #e3f2fd;
            color: #333;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #bbdefb;
            color: #333;
        }
        td img {
            border-radius: 10px;
            max-width: 150px;
            max-height: 150px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Body Transformation Progress</h1>

        <c:set var="month" value="1" />
        <c:forEach var="entity" items="${changesList}">
            <div class="month-card">
                <div class="month-header">Month ${month}</div>
                <table>
                    <tr>
                        <th>Weight</th>
                        <th>Height</th>
                        <th>Profile Image</th>
                    </tr>
                    <tr>
                        <td>${entity.weight} kg</td>
                        <td>${entity.height} cm</td>
                        <td>
                            <c:if test="${not empty entity.file}">
                                <img src="${pageContext.request.contextPath}/image?filePath=${entity.file}"
                                     alt="Profile Image">
                            </c:if>
                        </td>
                    </tr>
                </table>
            </div>
            <c:set var="month" value="${month + 1}" />
        </c:forEach>
    </div>
</body>
</html>
