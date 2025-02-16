<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .top-nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 60px;
            background-color: white;
            display: flex;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 100;
        }

        .nav-links {
            margin-left: auto;
            display: flex;
            gap: 20px;
        }

        .nav-link {
            color: #333;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .nav-link:hover {
            background-color: #f0f0f0;
            color: #007bff;
        }

        .success-container {
            margin-top: 100px;
            text-align: center;
            padding: 2rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .success-icon {
            color: #2ecc71;
            font-size: 48px;
            margin-bottom: 1rem;
        }

        .success-heading {
            color: #2c3e50;
            margin-bottom: 1rem;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <!-- Top Navigation Bar -->
    <div class="top-nav">
        <div class="nav-links">
            <a class="nav-link" href="Enquiry.jsp">Enquiry</a>
            <a class="nav-link" href="follow">Follow</a>
            <a class="nav-link" href="getRegister">Registration</a>
            <a class="nav-link" href="updateList">Update</a>
        </div>
    </div>

    <!-- Success Message -->
    <div class="container">
        <div class="success-container">
            <i class="fas fa-check-circle success-icon"></i>
            <h1 class="success-heading">Your Details Successfully Saved</h1>
        </div>
    </div>
</body>
</html>