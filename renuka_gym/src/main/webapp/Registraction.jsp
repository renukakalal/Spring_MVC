<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Registration</title>
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

        /* Main Styles */
        body {
            padding-top: 100px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
        }

        .container {
            max-width: 1000px;
            width: 95%;
            margin: 2rem auto;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in;
            background: rgba(255, 255, 255, 0.95);
            margin-top: 20px;
        }

        .card-header {
            background: linear-gradient(45deg, #2193b0, #6dd5ed);
            color: white;
            border-radius: 20px 20px 0 0 !important;
            padding: 1.5rem;
        }

        .card-body {
            padding: 2rem !important;
        }

        .form-section {
            margin-bottom: 2rem;
            padding: 1.5rem;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .form-group {
            flex: 1;
            min-width: 250px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px;
            transition: all 0.3s ease;
            border: 2px solid #e0e0e0;
            background-color: rgba(255, 255, 255, 0.9);
        }

        .form-label {
            color: #2a5298;
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: block;
        }

        .payment-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .btn-primary {
            background: linear-gradient(45deg, #2193b0, #6dd5ed);
            border: none;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            margin-top: 2rem;
        }

        .form-text {
            margin-top: 0.5rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .form-group {
                min-width: 100%;
            }

            .payment-details {
                grid-template-columns: 1fr;
            }

            .nav-links {
                flex-direction: column;
                align-items: center;
                gap: 1rem;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="nav-container">
        <div class="container">
            <ul class="nav-links">
                <li><a href="Enquiry.jsp">Enquiry</a></li>
                <li><a href="follow">Follow</a></li>
                <li><a href="Registraction.jsp">Registration</a></li>
                <li><a href="UpdateDetails.jsp">UpdateDetails</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="card">
            <div class="card-header text-center">
                <h2 class="mb-0">Gym Registration</h2>
            </div>
            <div class="card-body">
                <form action="registerDetails" method="post" class="needs-validation" novalidate>
                    <!-- Personal Information Section -->
                    <div class="form-section">
                        <h4 class="mb-4">Personal Information</h4>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" id="name" name="name" class="form-control" onchange="onNameFun()" onblur="handleValidate(event)" required>
                                <div id="nameError" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" id="email" name="email" class="form-control" onchange="onEmail()" onblur="handleValidate(event)" required>
                                <div id="emailError" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber" class="form-label">Phone Number</label>
                                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" onchange="onPhoneNumberFun()" onblur="handleValidate(event)" required>
                                <div id="phoneNumberError" class="form-text"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Membership Details Section -->
                    <div class="form-section">
                        <h4 class="mb-4">Membership Details</h4>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="packaged" class="form-label">Package</label>
                                <select id="packaged" name="packaged" class="form-select" onchange="calculateTotalAmount()" required>
                                    <option value="">Select Package</option>
                                    <c:forEach items="${listOfPackageEnum}" var="packaged">
                                        <option value="${packaged}">${packaged} - Rs ${packaged.price}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="discount" class="form-label">Discount (%)</label>
                                <input type="text" id="discount" name="discount" class="form-control" oninput="calculateTotalAmount()" onblur="handleValidate(event)" required>
                                <div id="discountError" class="form-text"></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="gymName" class="form-label">Gym Name</label>
                                <select id="gymName" name="gymName" class="form-select" required>
                                    <option value="">Select Gym Name</option>
                                    <c:forEach items="${listOfGymname}" var="gymName">
                                        <option value="${gymName}">${gymName}</option>
                                    </c:forEach>
                                </select>
                            </div>


                    </div>

                    <!-- Payment Details Section -->
                    <div class="form-section">
                        <h4 class="mb-4">Payment Details</h4>
                        <div class="payment-details">
                            <div class="form-group">
                                <label for="amount" class="form-label">Total Amount</label>
                                <input type="text" id="amount" name="amount" class="form-control" onblur="handleValidate(event)" required>
                                <div id="amountError" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="amountPaid" class="form-label">Amount Paid</label>
                                <input type="text" id="amountPaid" name="amountPaid" class="form-control" onblur="handleValidate(event)" required>
                                <div id="amountPaidError" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="instalment" class="form-label">Instalment</label>
                                <input type="text" id="instalment" name="instalment" class="form-control" onblur="handleValidate(event)" required>
                                <div id="installmentError" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="balance" class="form-label">Balance</label>
                                <input type="text" id="balance" name="balance" class="form-control" onblur="handleValidate(event)" required>
                                <div id="balanceError" class="form-text"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Location Section -->
                    <div class="form-section">
                        <h4 class="mb-4">Location Details</h4>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="location" class="form-label">Location</label>
                                <input type="text" id="location" name="location" class="form-control" onblur="handleValidate(event)" required>
                                <div id="locationError" class="form-text"></div>
                            </div>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg px-5">Register Now</button>
                    </div>
                </form>
                ${success}
                ${failure}
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const handleValidate = (event) => {
            const { name, value } = event.target;

            if (name === "name") {
                if (value.length >= 4 && value.length <= 9 && value.trim()) {
                    document.getElementById("nameError").innerHTML = "<span style='color:green'>Name is Valid</span>";
                } else {
                    document.getElementById("nameError").innerHTML = "<span style='color:red'>Name is invalid (must be 4 to 9 characters)</span>";
                }
            }

            if (name === "email") {
                if (value.includes("@gmail.com") && value.trim()) {
                    document.getElementById("emailError").innerHTML = "<span style='color:green'>Email is Valid</span>";
                } else {
                    document.getElementById("emailError").innerHTML = "<span style='color:red'>Email is invalid (must be a valid Gmail address)</span>";
                }
            }

            if (name === "phoneNumber") {
                const phonePattern = /^[0-9]{10}$/;
                if (phonePattern.test(value.trim())) {
                    document.getElementById("phoneNumberError").innerHTML = "<span style='color:green'>Phone Number is Valid</span>";
                } else {
                    document.getElementById("phoneNumberError").innerHTML = "<span style='color:red'>Phone Number is invalid (must be a 10-digit number)</span>";
                }
            }

            if (name === "discount") {
                if (!isNaN(value) && value >= 0 && value <= 100) {
                    document.getElementById("discountError").innerHTML = "<span style='color:green'>Discount is Valid</span>";
                } else {
                    document.getElementById("discountError").innerHTML = "<span style='color:red'>Discount is invalid (must be between 0 and 100)</span>";
                }
            }

            if (name === "instalment") {
                if (!isNaN(value) && value >= 1 && value <= 10) {
                    document.getElementById("installmentError").innerHTML = "<span style='color:green'>Installment is Valid</span>";
                } else {
                    document.getElementById("installmentError").innerHTML = "<span style='color:red'>Installment is invalid (must be between 1 and 10)</span>";
                }
            }

            if (name === "amount") {
                if (!isNaN(value) && value > 0) {
                    document.getElementById("amountError").innerHTML = "<span style='color:green'>Amount is Valid</span>";
                } else {
                    document.getElementById("amountError").innerHTML = "<span style='color:red'>Amount is invalid (must be positive)</span>";
                }
            }

            if (name === "amountPaid") {
                if (!isNaN(value) && value > 0) {
                    document.getElementById("amountPaidError").innerHTML = "<span style='color:green'>Amount Paid is Valid</span>";
                } else {
                    document.getElementById("amountPaidError").innerHTML = "<span style='color:red'>Amount Paid is invalid (must be positive)</span>";
                }
            }
            if (name === "balance") {
                if (!isNaN(value) && value >= 0) {
                    document.getElementById("balanceError").innerHTML = "<span style='color:green'>Balance is Valid</span>";
                } else {
                    document.getElementById("balanceError").innerHTML = "<span style='color:red'>Balance is invalid (must be non-negative)</span>";
                }
            }
            if (name === "location") {
                if (value.length >= 5 && value.length <= 100 && value.trim()) {
                    document.getElementById("locationError").innerHTML = "<span style='color:green'>Location is Valid</span>";
                } else {
                    document.getElementById("locationError").innerHTML = "<span style='color:red'>Location is invalid (must be 5 to 100)</span>";
                    }
                    }
                    };
                           function calculateTotalAmount() {
                               const packageSelect = document.getElementById("packaged");
                               const discountInput = document.getElementById("discount");
                               const amountInput = document.getElementById("amount");
                               const amountPaidInput = document.getElementById("amountPaid");
                               const balanceInput = document.getElementById("balance");
                               const payInput = document.getElementById("pay");

                               // Get the selected package price
                               const selectedOption = packageSelect.options[packageSelect.selectedIndex];
                               const priceMatch = selectedOption.text.match(/Rs\s+(\d+)/);
                               let originalAmount = priceMatch && priceMatch[1] ? parseFloat(priceMatch[1]) : 0;

                               // Get discount percentage (default to 0 if invalid)
                               const discount = parseFloat(discountInput.value) || 0;
                               if (discount < 0 || discount > 100) {
                                   document.getElementById("discountError").innerHTML = "<span style='color:red'>Discount must be between 0 and 100</span>";
                                   return;
                               } else {
                                   document.getElementById("discountError").innerHTML = "<span style='color:green'>Discount is Valid</span>";
                               }

                               // Calculate discounted amount
                               const discountedAmount = originalAmount - (originalAmount * (discount / 100));
                               amountInput.value = discountedAmount.toFixed(2);

                               // Get the amount paid from the "pay" input field
                               const payAmount = parseFloat(payInput.value) || 0;
                               amountPaidInput.value = payAmount.toFixed(2);  // Ensure pay amount is reflected in amountPaid

                               // Calculate balance
                               const balance = discountedAmount - payAmount;
                               balanceInput.value = balance.toFixed(2);
                           }

                           // Ensure that any change in "pay" updates "amountPaid"
                           document.getElementById("pay").addEventListener("input", calculateTotalAmount);

</script>
</body>
</html>