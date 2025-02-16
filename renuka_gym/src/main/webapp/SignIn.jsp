<%@page isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 20px;
        }

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            color: #333;
            margin-bottom: 1.5rem;
            text-align: center;
            font-size: 1.75rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        label {
            color: #555;
            font-size: 0.9rem;
            font-weight: 500;
        }

        input {
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.2s;
        }

        input:focus {
            outline: none;
            border-color: #4A90E2;
        }

        button {
            background: #4A90E2;
            color: white;
            padding: 0.75rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 0.5rem;
        }

        button:hover {
            background: #357ABD;
        }

        .error-message {
            color: #dc3545;
            font-size: 0.9rem;
            font-weight: 500;
            text-align: center;
            margin-top: 1rem;
            padding: 0.75rem;
            background: #fde8e8;
            border-radius: 5px;
            display: none;
        }

        .error-message.visible {
            display: block;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Sign In</h2>
        <form action="signIn" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit">Sign In</button>
        </form>

        <c:if test="${not empty errorMessage}">
            <div class="error-message visible">
                ${errorMessage}
            </div>
        </c:if>
    </div>
</body>
</html>