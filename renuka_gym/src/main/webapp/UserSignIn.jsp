<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Sign In</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 50px;
        }
        .form-container {
            max-width: 400px;
            margin: auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .form-group label {
            font-size: 14px;
            color: #555;
        }
        .alert {
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>User Sign In</h2>
    <form action="userSignIn" method="POST">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Sign In">
        </div>
    </form>

    <!-- Display error message if there is one -->
    <c:if test="${not empty errorMessage}">
        <div style="color: red; font-weight: bold;">
            ${errorMessage}
             ${user}
        </div>
    </c:if>

    <a href="ForgotPassword">Forgot Password?</a>
</div>

</body>
</html>
