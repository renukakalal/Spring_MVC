<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Gym Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
        }
        /* Navigation Bar Custom Styles */
        .navbar {
            background-color: #ff6347;
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
        }
        .navbar-toggler-icon {
            background-color: #fff;
        }
        .navbar-nav .nav-item {
            margin-right: 15px;
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107 !important;
        }

        /* Table Styling */
        .table thead {
            background-color: #ff6347;
            color: white;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .table tbody tr:hover {
            background-color: #e2e6ea;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Gym Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Enquiry.jsp">Enquiry</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="follow">Follow</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="getRegister">Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="updateList">Update</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Search Container -->
        <div class="search-container mb-4">
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <input type="text" id="searchInput" class="form-control" placeholder="Search by name...">
                </div>
                <div class="col-md-6">
                    <select id="updateSelect" class="form-control">
                        <option value="">Select records</option>
                        <option value="all">View All</option>
                        <option value="updated">Updated Records</option>
                        <option value="not-updated">Not Updated Records</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Table Form -->
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Discount</th>
                        <th>Gym Name</th>
                        <th>Instalment</th>
                        <th>Package</th>
                        <th>Trainer</th>
                        <th>TotalAmount</th>
                        <th>Pay</th>
                        <th>AmountPaid</th>
                         <th>Balance</th>
                        <th>Action</th>
                        <th>View</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                    <c:forEach items="${list}" var="dto">
                        <form action="updateRegDetails" method="post">
                            <input type="hidden" name="registerId" value="${dto.id}" />
                            <tr>
                                <td><input type="text" name="name" value="${dto.name}" class="form-control" /></td>
                                <td><input type="email" name="email" class="form-control" value="${dto.email}" /></td>
                                <td>${dto.discount}</td>
                                <td><input type="text" name="gymName" class="form-control" value="${dto.gymName}" /></td>
                                <td><input type="text" name="instalment" class="form-control" value="${dto.instalment}" /></td>
                                <td>
                                    <select name="packaged" class="form-control package-select">
                                        <option value="">Select Package</option>
                                        <option value="ELITE" ${dto.packaged == 'ELITE' ? 'selected' : ''}>ELITE - Rs 25,000</option>
                                        <option value="PRO" ${dto.packaged == 'PRO' ? 'selected' : ''}>PRO - Rs 10,000</option>
                                        <option value="TRANSFORM" ${dto.packaged == 'TRANSFORM' ? 'selected' : ''}>TRANSFORM - Rs 5,000</option>
                                        <option value="PLATINUM" ${dto.packaged == 'PLATINUM' ? 'selected' : ''}>PLATINUM - Rs 15,000</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="trainer" class="form-control">
                                        <option value="">Select Trainer</option>
                                        <c:forEach items="${listOftrainer}" var="trainer">
                                            <option value="${trainer}"
                                                ${trainer == dto.trainer ? 'selected' : ''}>${trainer}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td><input type="text" name="amount" class="form-control" value="${dto.amount}" readonly /></td>
                                <td><input type="text" name="pay" class="form-control"</td>
                                <td><input type="text" name="amountPaid" class="form-control" value="${dto.amountPaid}" readonly/></td>
                                <td><input type="text" name="balance" class="form-control" value="${dto.balance}" readonly/></td>

                                <td>
                                    <button type="submit" class="btn btn-success w-100">Submit</button>
                                </td>
                                <td>
                                    <a href="registerView?id=${dto.id}" class="btn btn-info">View</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
  function updateAmountPaidAndBalance(row) {
      console.log('Updating amountPaid and balance...');

      const amountPaidInput = row.querySelector('input[name="amountPaid"]');
      const payInput = row.querySelector('input[name="pay"]');
      const balanceInput = row.querySelector('input[name="balance"]');
      const amountInput = row.querySelector('input[name="amount"]');

      // Get the initial amountPaid value from the backend (i.e., dto.amountPaid)
      let amountPaid = parseFloat(amountPaidInput.value) || 0;
      let pay = parseFloat(payInput.value) || 0;
      let amount = parseFloat(amountInput.value) || 0;

      console.log('Previous Amount Paid:', amountPaid);
      console.log('New Pay:', pay);

      // Calculate the updated amountPaid by adding the current pay to the previous amountPaid
      amountPaid += pay;
      console.log('Updated Amount Paid:', amountPaid);

      // Calculate the new balance (Total Amount - Amount Paid)
      let newBalance = amount - amountPaid;
      console.log('New Balance:', newBalance);

      // Update the fields with the new values
      amountPaidInput.value = amountPaid.toFixed(2);  // Update amountPaid field
      balanceInput.value = newBalance.toFixed(2);    // Update balance field
  }

  document.addEventListener('DOMContentLoaded', function () {
      const tbody = document.getElementById('tableBody');

      tbody.addEventListener('input', function (e) {
          const target = e.target;
          // Ensure that the event listener is triggered only for the 'pay' field input
          if (target.matches('input[name="pay"]')) {
              const row = target.closest('tr');
              updateAmountPaidAndBalance(row);  // Call the function to update the values
          }
      });
  });


</body>
</html>