<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
        }
        .nav-container {
            background-color: #007bff;
            padding: 10px 0;
        }
        .nav-links {
            list-style: none;
            display: flex;
            justify-content: center;
            padding: 0;
            margin: 0;
        }
        .nav-links li {
            margin: 0 15px;
        }
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .nav-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="nav-container">
    <ul class="nav-links">
        <li><a href="Enquiry.jsp">Enquiry</a></li>
        <li><a href="follow">Follow</a></li>
        <li><a href="getRegister">Registration</a></li>
        <li><a href="UpdateDetails.jsp">Update Details</a></li>
    </ul>
</nav>

<div class="container">
    <h1 class="my-4">Search Here</h1>
    <form action="search" method="GET" class="mb-4">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <h2>Update Admin Details</h2>
    <form action="updateRegDetails" method="post">
        <input type="hidden" name="registerId" value="${entity.id}">

        <div class="form-group">
            <label>Name:</label>
            <input type="text" name="name" value="${entity.name}" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Gym Name:</label>
            <input type="text" name="gymName" value="${entity.gymName}" class="form-control">
        </div>
        <div class="form-group">
            <label>Trainer:</label>
            <select name="trainer" class="form-control">
                <option value="">Select Trainer</option>
                <c:forEach items="${listOfTrainer}" var="trainer">
                    <option value="${trainer}" ${trainer == entity.trainer ? 'selected' : ''}>
                        ${trainer}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Package:</label>
            <select name="packaged" class="form-control">
                <option value="">Select Package</option>
                <c:forEach items="${listOfPackageEnum}" var="pkg">
                    <option value="${pkg}" ${pkg == entity.packaged ? 'selected' : ''}>
                        ${pkg}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Discount:</label>
            <input type="number" name="discount" value="${entity.discount}" class="form-control">
        </div>
        <div class="form-group">
            <label>Total Amount:</label>
            <input type="number" id="amount" name="amount" value="${entity.amount}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label>Amount Paid:</label>
            <input type="number" id="amountPaid" name="amountPaid" value="" class="form-control" oninput="calculateBalance()">
        </div>
        <div class="form-group">
            <label>Balance:</label>
            <span id="balance">${entity.balance}</span>
            <input type="hidden" id="balanceInput" name="balance" value="${entity.balance}">
        </div>
        <div class="form-group">
            <label>Instalment:</label>
            <input type="number" name="instalment" value="${entity.instalment}" class="form-control">
        </div>
        <button type="submit" class="btn btn-success">Update</button>
    </form>
    <a href="registerView?id=${entity.id}" class="btn btn-info mt-3">View Your Details</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function calculateBalance() {
        let totalAmount = parseFloat(document.getElementById("amount").value) || 0;
        let amountPaid = parseFloat(document.getElementById("amountPaid").value) || 0;
        let previousBalance = parseFloat("${entity.balance}") || totalAmount;

        // Calculate new balance
        let newBalance = previousBalance - amountPaid;

        // Prevent Negative Balance
        if (newBalance < 0) {
            newBalance = 0;
        }

        // Update balance display
        document.getElementById("balance").innerText = newBalance;

        // Set hidden input field value (for form submission)
        document.getElementById("balanceInput").value = newBalance;
    }
</script>
</body>
</html>
