<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Task Duration Calculator</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            padding: 20px;
        }
        h3 {
            color: #333;
        }
        .btn {
            margin: 10px 0;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .table {
            margin-top: 20px;
            width: 100%;
        }
        .table th, .table td {
            text-align: center;
        }
        .thead-dark th {
            background-color: #343a40;
            color: white;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- Back to Menu Button -->
        <a href="Menu.jsp" class="btn btn-primary mb-4">Back to Menu</a>

        <!-- Button to Show/Hide the TimeSlot Form -->
        <button onclick="toggleTimeSlotForm()" class="btn btn-success">Add Slot</button>

        <!-- TimeSlot Form (Initially hidden) -->
        <div id="timeSlotForm" style="display:none; margin-top: 20px;">
            <h4>TimeSlot Form</h4>
            <form action="TimeSlots" method="post">
                <div class="form-group">
                    <label for="startTime">Start Time</label>
                    <input type="time" class="form-control" id="startTime" name="startTime" required onchange="calculateTimeSlotDuration()">
                </div>

                <div class="form-group">
                    <label for="endTime">End Time</label>
                    <input type="time" class="form-control" id="endTime" name="endTime" required onchange="calculateTimeSlotDuration()">
                </div>

                <div class="form-group">
                    <label for="duration">Duration</label>
                    <input type="text" class="form-control" id="duration" readonly>
                    <input type="hidden" id="durationInSeconds" name="duration">
                </div>

                <div class="form-group">
                    <!-- Submit button -->
                    <button type="submit" class="btn btn-success">Save TimeSlot</button>
                </div>
            </form>
        </div>

        <!-- Button to Show/Hide Trainer Form -->
        <button onclick="toggleTrainerForm()" class="btn btn-success">Add Trainer</button>

        <!-- Trainer Form (Initially Hidden) -->
        <div id="trainerForm" style="display:none; margin-top: 20px;">
            <form action="saveTrainerDetails" method="post">
                <div class="form-group">
                    <label for="trainer">Trainer Name:</label>
                    <input type="text" id="trainer" name="trainer" required class="form-control">
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required class="form-control">
                </div>

                <div class="form-group">
                    <label for="slotId">Select Slot Timing:</label>
                    <select id="slotId" class="form-control" name="slotTimings" required>
                        <option value="">-- Select Slot --</option>
                        <c:forEach var="slot" items="${list}">
                            <option value="${slot.startTime} - ${slot.endTime}">${slot.startTime} - ${slot.endTime}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>

        <!-- Table for Trainer Details -->
        <h3>Trainer Details</h3>
        <table border="1" class="table table-striped">
            <thead class="thead-dark">
               <tr>
                                   <th>Trainer</th>
                                   <th>Phone Number</th>
                                   <th>Slot Timings</th>
                                   <th>Delete Slot</th>
                               </tr>
                           </thead>
                           <tbody>
                               <c:forEach var="trainer" items="${listofdto}">
                                   <tr>
                                       <input type="hidden" name="trainer" value="${trainer.id}">
                                       <td>${trainer.trainer}</td>
                                       <td>${trainer.phoneNumber}</td>
                                       <td>${trainer.slotTimings}</td>
                                   <td><a href="getAllotedUsers?trainer=${trainer.id}"><i class="fas fa-cog"></i>delete</a></td>


                                       </td>
                                   </tr>
                               </c:forEach>
                           </tbody>
                       </table>
                   </div>
                     ${success}
                     ${failure}

                   <!-- Delete Confirmation Modal -->





    <script>
        // Function to toggle the form visibility
        function toggleTimeSlotForm() {
            var form = document.getElementById("timeSlotForm");
            form.style.display = (form.style.display === "none" || form.style.display === "") ? "block" : "none";
        }

        // Function to calculate duration based on start and end time
        function calculateTimeSlotDuration() {
            let start = document.getElementById("startTime").value;
            let end = document.getElementById("endTime").value;

            if (start && end) {
                let startTime = new Date("1970-01-01 " + start);
                let endTime = new Date("1970-01-01 " + end);

                // Validate that end time is after start time
                if (endTime.getTime() <= startTime.getTime()) {
                    alert("End time must be greater than start time");
                    document.getElementById("endTime").value = ""; // Reset endTime field
                    document.getElementById("duration").value = "";
                    document.getElementById("durationInSeconds").value = "";
                    return;
                }

                let duration = (endTime - startTime) / 1000; // Convert to seconds

                let hours = Math.floor(duration / 3600);
                let minutes = Math.floor((duration % 3600) / 60);
                let seconds = duration % 60;

                let formattedDuration =
                    String(hours).padStart(2, '0') + ":" +
                    String(minutes).padStart(2, '0') + ":" +
                    String(seconds).padStart(2, '0');

                document.getElementById("duration").value = formattedDuration;
                document.getElementById("durationInSeconds").value = duration;
            }
        }

        // Function to toggle the form visibility
        function toggleTrainerForm() {
            var form = document.getElementById("trainerForm");
            form.style.display = (form.style.display === "none" || form.style.display === "") ? "block" : "none";
        }
    </script>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
