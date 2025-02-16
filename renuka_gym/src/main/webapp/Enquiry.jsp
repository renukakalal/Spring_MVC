<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colorful Enquiry Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Navigation Styles */
        .nav-container {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: linear-gradient(45deg, #4ECDC4, #2ECC71);
            padding: 1rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .nav-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }

        /* Original Body Styles with navbar adjustment */
        body {
            padding-top: 70px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding-bottom: 2rem;
        }

        .card {
            max-width: 600px;
            width: 90%;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in;
            margin: 2rem auto;
        }

        .card-header {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            border-radius: 15px 15px 0 0 !important;
            padding: 1.5rem;
        }

        .form-control {
            border-radius: 10px;
            transition: all 0.3s ease;
            border: 2px solid #e0e0e0;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(78, 205, 196, 0.25);
            border-color: #4ECDC4;
        }

        .btn-success {
            background: linear-gradient(45deg, #4ECDC4, #2ECC71);
            border: none;
            padding: 10px 30px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
        }

        .form-label {
            color: #555;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .card-body {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 0 0 15px 15px;
            padding: 2rem;
        }

        .form-text span {
            font-weight: 500;
            padding: 3px 10px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .card-body {
                padding: 1.5rem;
            }
            .card {
                width: 95%;
                margin: 1rem;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .input-group-text {
            background: linear-gradient(45deg, #4ECDC4, #2ECC71);
            color: white;
            border: none;
        }

        .is-valid {
            border-color: #2ECC71 !important;
            background-color: rgba(46, 204, 113, 0.05) !important;
        }

        .is-invalid {
            border-color: #FF6B6B !important;
            background-color: rgba(255, 107, 107, 0.05) !important;
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
            <li><a href="UpdateDetails.jsp">UpdateDetails</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h3 class="mb-0 text-white text-center">Enquiry Form</h3>
            </div>
            <div class="card-body">
                <form id="enquiryForm" action="enquiry" method="post" onsubmit="return validateForm(event)">
                    <!-- Name -->
                    <div class="mb-4">
                        <label for="name" class="form-label">Name</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="name" name="name" onblur="handleValidate(event)" onchange="onName()" onkeyup="handleValidate(event)" placeholder="Enter your name">
                        </div>
                        <div id="nameError" class="form-text"></div>

                    </div>
                    <!-- Area -->
                    <div class="mb-4">
                        <label for="area" class="form-label">Area</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="area" name="area" onblur="handleValidate(event)"  onkeyup="handleValidate(event)" placeholder="Enter your area">
                        </div>
                        <div id="areaError" class="form-text"></div>
                    </div>
                    <!-- Phone Number -->
                    <div class="mb-4">
                        <label for="phoneNumber" class="form-label">Phone Number</label>
                        <div class="input-group">
                            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" onchange="onPhoneNumber()" onblur="handleValidate(event)" onkeyup="handleValidate(event)" placeholder="Enter your phone number">
                        </div>
                        <div id="phoneNumberError" class="form-text"></div>

                    </div>
                    <!-- Distance -->
                    <div class="mb-4">
                        <label for="distance" class="form-label">Distance</label>
                        <div class="input-group">
                            <input type="number" class="form-control" id="distance" name="distance" onblur="handleValidate(event)" onkeyup="handleValidate(event)" placeholder="Enter distance" min="1" max="1000">
                        </div>
                        <div id="distanceError" class="form-text"></div>
                    </div>
                    <!-- Age -->
                    <div class="mb-4">
                        <label for="age" class="form-label">Age</label>
                        <div class="input-group">
                            <input type="number" class="form-control" id="age" name="age" onblur="handleValidate(event)" onkeyup="handleValidate(event)" placeholder="Enter your age" min="10" max="120">
                        </div>
                        <div id="ageError" class="form-text"></div>
                    </div>
                    <!-- Hidden Fields -->
                    <input type="hidden" id="status" name="status">
                    <input type="hidden" id="reason" name="reason">
                    <!-- Submit Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success btn-lg">Submit Enquiry</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validation rules
        const validationRules = {
            name: {
                validate: (value) => value.length > 3 && value.length < 10 && value.trim(),
                errorMessage: 'Name must be 4 to 9 characters',
                successMessage: 'Name is valid'
            },
            area: {
                validate: (value) => value.length > 3 && value.length < 100 && value.trim(),
                errorMessage: 'Area must be 4 to 99 characters',
                successMessage: 'Area is valid'
            },
            phoneNumber: {
                validate: (value) => /^[0-9]{10}$/.test(value.trim()),
                errorMessage: 'Phone number must be 10 digits',
                successMessage: 'Phone number is valid'
            },
            distance: {
                validate: (value) => !isNaN(value) && value >= 1 && value <= 1000,
                errorMessage: 'Distance must be between 1 and 1000',
                successMessage: 'Distance is valid'
            },
            age: {
                validate: (value) => !isNaN(value) && value >= 10 && value <= 120,
                errorMessage: 'Age must be between 10 and 120',
                successMessage: 'Age is valid'
            }
        };

        // Validation handler
        const handleValidate = (event) => {
            const { name, value } = event.target;
            const errorElement = document.getElementById(`${name}Error`);
            const inputElement = document.getElementById(name);

            if (validationRules[name]) {
                const isValid = validationRules[name].validate(value);
                errorElement.innerHTML = `<span style='color:${isValid ? '#2ECC71' : '#FF6B6B'}'>${
                    isValid ? validationRules[name].successMessage : validationRules[name].errorMessage
                }</span>`;
                inputElement.classList.toggle('is-valid', isValid);
                inputElement.classList.toggle('is-invalid', !isValid);
                return isValid;
            }
            return true;
        };

        // Form submission handler
        const validateForm = (event) => {
            event.preventDefault();
            const form = document.getElementById('enquiryForm');
            const formData = new FormData(form);
            let isValid = true;

            // Validate all fields
            for (const [name, value] of formData.entries()) {
                if (validationRules[name] && !validationRules[name].validate(value)) {
                    isValid = false;
                    break;
                }
            }

            if (isValid) {
                const age = parseInt(formData.get('age'));
                const distance = parseInt(formData.get('distance'));

                let status = 'Pending';
                let reason = '';

                if (age < 18) {
                    status = 'Rejected';
                    reason = 'Age below 18';
                } else if (distance > 500) {
                    status = 'Rejected';
                    reason = 'Distance exceeds 500';
                } else {
                    status = 'Accepted';
                }

                document.getElementById('status').value = status;
                document.getElementById('reason').value = reason;

                form.submit();
            } else {
                alert('Please fix all validation errors before submitting.');
            }

            return false;
        };


                function onName() {
                    var name = document.getElementById('name').value;
                    var xhttp = new XMLHttpRequest();
                    xhttp.open("GET", "http://localhost:8080/renuka_gym/enquery/name/" + name, true);
                    xhttp.send();
                    xhttp.onload = function() {
                        document.getElementById("nameValid").innerHTML = this.responseText;
                    };
                }

                 function onPhoneNumber() {
                                    var phoneNumber = document.getElementById('phoneNumber').value;
                                    var xhttp = new XMLHttpRequest();
                                    xhttp.open("GET", "http://localhost:8080/renuka_gym/enquery/phoneNumber/" + phoneNumber, true);
                                    xhttp.send();
                                    xhttp.onload = function() {
                                        document.getElementById("PhoneNumberValid").innerHTML = this.responseText;
                                    };
                                }
    </script>
</body>
</html>