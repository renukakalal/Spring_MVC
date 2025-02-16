<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        .container {
            width: 100%;
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-size: 14px;
            margin-bottom: 8px;
            display: block;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Reset Password</h2>

    <form action="resetPassword" method="POST">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        <br>

        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <br>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <br>

        <input type="submit" value="Reset Password">
    </form>

</div>

<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            event.preventDefault();
            document.getElementById('passwordMismatchError').style.display = 'block';
        }
    });
</script>

</body>
</html>
