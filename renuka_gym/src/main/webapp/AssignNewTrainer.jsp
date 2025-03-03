
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


<form action="assignSlot" method="POST">
    <!-- Hidden input for trainerId -->
    <input type="hidden" id="trainerId" name="trainerId" value="" />

    <!-- Hidden input for entityId -->
    <c:forEach var="name" items="${userName}">
        <input type="hidden" name="entityId" value="${name.id}" />
    </c:forEach>

    <!-- Display all trainer names in a single line -->
    <p>Trainer assigned for
        <c:forEach var="name" items="${userName}" varStatus="status">
            <c:if test="${status.index != 0}">, </c:if>
            ${name.name}
        </c:forEach>
    </p>

    <!-- Time Slot Dropdown -->
    <label for="timeSlot">Select Time Slot:</label>
    <select name="timeSlot" id="timeSlot" onchange="filterTrainers()">
        <c:forEach var="slot" items="${list}">
            <option value="${slot.id}" data-start-time="${slot.startTime}">
                ${slot.startTime} - ${slot.endTime}
            </option>
        </c:forEach>
    </select>
    <br>

    <!-- Trainer Dropdown -->
    <label for="trainer">Select Trainer:</label>
    <select name="trainer" id="trainer" onchange="setTrainerId(this)">
        <option value="">Select a trainer</option>
        <!-- Trainer options will be populated by JS -->
    </select>
    <br>

    <button type="submit">Submit</button>
</form>
${success}
${failure}

<script>
    function filterTrainers() {
        var selectedSlot = document.getElementById("timeSlot").value;
        var trainerSelect = document.getElementById("trainer");

        // Create an empty array of trainers
        var trainers = [];

        // Loop through the listofdto and push the necessary info to the array
        <c:forEach var="trainer" items="${listofdto}">
            var trainerData = {
                id: "${trainer.id}",
                trainerName: "${trainer.trainer}",
                slotTimings: "${trainer.slotTimings}"
            };
            trainers.push(trainerData);
        </c:forEach>

        var slotOption = document.querySelector('#timeSlot option:checked');
        var selectedStartTime = slotOption ? slotOption.getAttribute('data-start-time') : '';

        // Clear existing options in the trainer dropdown
        trainerSelect.innerHTML = '<option value="">Select a trainer</option>';

        // Add the trainers that match the selected time slot
        trainers.forEach(function(trainer) {
            if (trainer.slotTimings.indexOf(selectedStartTime) !== -1) {
                var option = document.createElement("option");
                option.value = trainer.id;
                option.text = trainer.trainerName + " - " + trainer.slotTimings;
                trainerSelect.appendChild(option);
            }
        });
    }

    // Set the trainerId when a trainer is selected
    function setTrainerId(selectElement) {
        var trainerId = selectElement.value;
        document.getElementById("trainerId").value = trainerId;
    }
</script>
</body>
</html>

