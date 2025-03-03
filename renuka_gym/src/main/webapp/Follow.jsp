<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
        }

        .navbar {
            background: linear-gradient(45deg, #2193b0, #6dd5ed);
            padding: 1rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }

        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            transform: translateY(-2px);
            text-shadow: 0 2px 10px rgba(255,255,255,0.3);
        }

        .search-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .table-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow-x: auto;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background: linear-gradient(45deg, #2193b0, #6dd5ed);
            color: white;
            border: none;
            padding: 15px;
        }

        .table tbody td {
            vertical-align: middle;
            padding: 12px;
        }

        .form-select, .form-control {
            border-radius: 8px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-select:focus, .form-control:focus {
            border-color: #2193b0;
            box-shadow: 0 0 0 0.25rem rgba(33, 147, 176, 0.25);
        }

        .btn-success {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            border: none;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
        }

        @media (max-width: 768px) {
            .table-container {
                padding: 10px;
            }
            .table thead th {
                padding: 10px;
            }
            .search-container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Gym Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
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
                        <a class="nav-link" href="Registraction.jsp">Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UpdateDetails.jsp">UpdateDetails</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Search and Filter Section -->
        <div class="search-container">
            <div class="row g-3">
                <div class="col-md-4">
                    <input type="text" class="form-control" id="searchInput" placeholder="Search by name..." onkeyup="filterTable()">
                </div>
                <div class="col-md-4">
                    <select class="form-select" id="statusFilter" onchange="filterTable()">
                        <option value="">All Status</option>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                        <option value="In Progress">In Progress</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <div class="table-container">
            <table class="table table-hover" id="dataTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Area</th>
                        <th>Phone</th>
                        <th>Age</th>
                        <th>updatedBy</th>
                         <th>Status</th>
                        <th>Reason</th>
                        <th>Action</th>
                        <th>view</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="dto">
                        <tr>
                            <form action="updateStatus" method="post">
                                <input type="hidden" name="enquiryId" value="${dto.id}" />

                                <td><input type="text" name="name" value="${dto.name}"1 class="form-control" /></td>
                                <td>${dto.area}</td>
                                <td>${dto.phoneNumber}</td>
                                <td>${dto.age}</td>
                                <td>
                                    <select class="form-select" name="updatedBy" required>
                                        <option value="Trainer" ${dto.updatedBy == 'Trainer' ? 'selected' : ''}>Trainer</option>
                                        <option value="HR" ${dto.updatedBy == 'HR' ? 'selected' : ''}>HR</option>
                                        <option value="Manager" ${dto.updatedBy == 'Manager' ? 'selected' : ''}>Manager</option>
                                    </select>
                                </td>


                                <td>
                                    <select class="form-select" name="status" required>
                                        <option value="Pending" ${dto.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                        <option value="Completed" ${dto.status == 'Completed' ? 'selected' : ''}>Completed</option>
                                        <option value="In Progress" ${dto.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="reason" value="${dto.reason}" />
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-success btn-sm w-100">Update</button>
                                </td>
                                <td>
                                ${success}
                                 ${failure}
                               <a href="EnquiryView?id=${dto.id}"/>View</button>
                               </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function filterTable() {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            const statusFilter = document.getElementById('statusFilter').value;
            const table = document.getElementById('dataTable');
            const rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const name = row.cells[0].textContent.toLowerCase();
                const status = row.querySelector('select[name="status"]').value;

                const nameMatch = name.includes(searchInput);
                const statusMatch = !statusFilter || status === statusFilter;

                row.style.display = (nameMatch && statusMatch) ? '' : 'none';
            }
        }
    </script>
</body>
</html>