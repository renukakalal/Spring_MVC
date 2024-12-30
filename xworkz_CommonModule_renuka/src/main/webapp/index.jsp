<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to Xworkz</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Page background */
    body {
      background-color: #f0f8ff; /* Light blue background */
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    /* Navbar styles */
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 40px;
      background-color: #007bff; /* Bootstrap blue */
      color: white;
    }

    .navbar img {
      width: 60px;
      height: auto;
    }

    .navbar a {
      margin-left: 20px;
      text-decoration: none;
      color: white;
      font-weight: bold;
      font-size: 16px;
    }

    .navbar a:hover {
      text-decoration: underline;
    }

    /* Centered typing effect */
    .typing-container {
      font-family: 'Courier New', Courier, monospace;
      font-size: 36px;
      text-align: center;
      color: #333; /* Darker text for contrast */
      margin-top: 5%;
      white-space: nowrap;
      overflow: hidden;
      border-right: 3px solid black;
      width: 22ch;
      animation: typing 5s steps(22, end) infinite, blink 0.5s step-end infinite alternate;
    }

    @keyframes typing {
      from { width: 0; }
      to { width: 22ch; }
    }

    @keyframes blink {
      from { border-color: transparent; }
      to { border-color: black; }
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar">
    <div class="logo">
      <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"> <!-- Replace 'logo.png' with your logo path -->
    </div>
    <div class="links">
      <a href="SignIn.jsp">SIGN IN</a>
      <a href="SignUp.jsp">SIGN UP</a>
    </div>
  </nav>

  <!-- Centered Typing Text -->
  <div class="typing-container">Welcome to Xworkz

  </div>

  <!-- Bootstrap JS (Optional for interactivity) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
