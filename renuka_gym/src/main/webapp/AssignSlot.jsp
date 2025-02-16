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
    <h2 class="text-center mb-4">Allot Slot</h2>

    <!-- Search Form -->
    <form action="searchEntity" method="GET" class="mb-4 p-3 border rounded shadow bg-light">
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
        <input type="hidden" id="entityId" value="${entity.id}">
        <div class="alert alert-success">
            <p><strong>Name:</strong> ${entity.name}</p>
        </div>
    </c:if>

    <c:if test="${empty entity}">
        <div class="alert alert-warning text-center">No entity found.</div>
    </c:if>

    <!-- Trainer Selection Form -->
    <form action="assignSlot" method="POST" class="p-3 border rounded shadow bg-light">
        <input type="hidden" name="entityId" value="${entity.id}">

        <!-- Slot Timing Dropdown -->
        <div class="form-group">
            <label for="slotId"><strong>Select Slot Timing:</strong></label>
            <select id="slotId" class="form-control form-control-sm" name="slotId" required>
                <option value="">-- Select Slot --</option>
                <c:forEach var="slot" items="${list}">
                    <option value="${slot.id}">${slot.startTime} - ${slot.endTime}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Trainer Selection Dropdown -->
        <div class="form-group">
            <label for="trainerId"><strong>Select Trainer:</strong></label>
            <select id="trainerId" class="form-control form-control-sm" name="trainerId" required>
                <option value="">-- Select Trainer --</option>
                <c:forEach var="trainer" items="${listofdto}">
                    <option value="${trainer.id}" data-slot="${trainer.slotTimings}">
                        ${trainer.trainer} (${trainer.slotTimings})
                    </option>
                </c:forEach>
            </select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-success btn-sm btn-block">Submit</button>
    </form>
</div>

<!-- jQuery Script for Filtering Trainers -->
<script>
    $(document).ready(function () {
        $("#slotId").change(function () {
            var selectedSlot = $(this).find("option:selected").text().trim(); // Get selected slot text

            $("#trainerId option").each(function () {
                var trainerSlot = $(this).data("slot"); // Get trainer slot text

                // Show only trainers whose slot matches the selected slot
                if (trainerSlot === selectedSlot || $(this).val() === "") {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });

            // Reset trainer selection
            $("#trainerId").val("");
        });
    });
</script>

</body>
</html>
