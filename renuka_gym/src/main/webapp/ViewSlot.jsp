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

<!-- Form to Fetch Trainer Details -->
<c:if test="${not empty trainerDetails}">
    <div class="container mt-5">
        <h3 class="text-center mb-4">Trainer Details</h3>
        <table class="table table-bordered">
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

<c:if test="${empty trainerDetails}">
    <div class="container mt-5">
        <p class="text-center">No trainer details found.</p>
    </div>
</c:if>

</body>
</html>
