<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            padding-top: 20px;
        }
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .table thead {
            background-color: #003366;
            color: white;
        }
        .table-striped tbody tr:nth-of-type(even) {
            background-color: rgba(0,51,102,0.05);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(0,51,102,0.1);
            transition: background-color 0.3s ease;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-container">
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>

                        <th>Package</th>
                        <th>Trainer</th>
                        <th>Installment</th>
                        <th>TotalAmount</th>
                        <th>AmountPaid</th>
                        <th>Balance</th>
                        <th>Updated By</th>
                        <th>Update Date & Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="dto">
                        <tr>

                            <td>${dto.packaged}</td>
                            <td>${dto.trainer}</td>
                            <td>${dto.instalment}</td>
                            <td>${dto.amount}</td>
                            <td>${dto.amountPaid}</td>
                            <td>${dto.balance}</td>
                            <td>${dto.updatedBy}</td>
                            <td>${dto.updatedDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty list}">
                <div class="alert alert-info text-center" role="alert">
                    No registration records found.
                </div>
            </c:if>
        </div>
    </div>

    <!-- Bootstrap JS (optional, but recommended for full functionality) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>