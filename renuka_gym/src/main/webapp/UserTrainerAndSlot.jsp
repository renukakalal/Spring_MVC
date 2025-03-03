<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Allot Slot</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">search trainer and slot </h2>

    <!-- Search Form -->
    <form action="searchTrainerAndSlot" method="GET" class="mb-4 p-3 border rounded shadow bg-light">
        <div class="form-row align-items-center">
            <div class="col-md-4">
                <label for="name" class="sr-only">Name</label>
                <input type="text" id="name" name="name" class="form-control form-control-sm" placeholder="Name" required>
            </div>
            <div class="col-md-4">
                <label for="email" class="sr-only">Email</label>
                <input type="email" id="email" name="email" class="form-control form-control-sm" placeholder="Email" required>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary btn-sm btn-block">Search</button>
            </div>
        </div>
    </form>

    <!-- Entity Details -->
    <c:if test="${not empty entity}">


        <!-- Form to Fetch Trainer Details -->
        <form id="trainerForm" action="trainerSlotDetails" method="GET">
            <input type="hidden" name="id" value="${entity.trainer}">
            <button type="submit" class="btn btn-info btn-block btn-sm">View Trainer Details</button>
        </form>
    </c:if>

    <!-- Trainer Details -->
    <c:if test="${not empty trainerDetails}">
        <div class="mt-5">
            <h3 class="text-center mb-3">Trainer Details</h3>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Trainer Name</th>
                        <th>Phone Number</th>
                        <th>Slot Timings</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${trainerDetails.trainer}</td>
                        <td>${trainerDetails.phoneNumber}</td>
                        <td>${trainerDetails.slotTimings}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </c:if>


</div>

</body>
</html>
