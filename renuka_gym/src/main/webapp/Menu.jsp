<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Previous styles remain the same until main-content */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2c3e50;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 0;
        }

        .logo-container {
            background-color: #243342;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .admin-logo {
            width: 40px;
            height: 40px;
        }

        .logo {
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .menu-links {
            list-style: none;
        }

        .menu-links a {
            display: block;
            padding: 15px 25px;
            color: #ecf0f1;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .menu-links a:hover {
            background-color: #34495e;
        }

        .menu-links i {
            margin-right: 10px;
            width: 20px;
        }

        .top-nav {
            position: fixed;
            top: 0;
            left: 250px;
            right: 0;
            height: 60px;
            background-color: white;
            display: flex;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 100;
        }

        .search-bar {
            flex-grow: 1;
            margin: 0 20px;
        }

        .search-bar input {
            width: 100%;
            max-width: 400px;
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
        }

        .top-nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .notification-icon {
            position: relative;
            cursor: pointer;
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: #e74c3c;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #3498db;
            padding: 5px 15px;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .admin-profile:hover {
            background-color: #2980b9;
        }

        .admin-avatar {
            width: 32px;
            height: 32px;
            background-color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .admin-info {
            color: white;
            font-size: 14px;
        }

        .admin-name {
            font-weight: bold;
        }

        /* New styles for metric cards */
        .main-content {
            margin-left: 250px;
            padding: 80px 20px 20px;
        }

        .metrics-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .metric-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            transition: transform 0.3s;
        }

        .metric-card:hover {
            transform: translateY(-5px);
        }

        .metric-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }

        .metric-info {
            flex-grow: 1;
        }

        .metric-title {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }

        .metric-value {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }

        /* Specific colors for each metric card */
        .enquiry-card .metric-icon {
            background-color: #ffebee;
            color: #ef5350;
        }

        .follow-card .metric-icon {
            background-color: #e8f5e9;
            color: #66bb6a;
        }

        .registration-card .metric-icon {
            background-color: #e3f2fd;
            color: #42a5f5;
        }

        .update-card .metric-icon {
            background-color: #fff3e0;
            color: #ffa726;
        }
    </style>
</head>
<body>
    <!-- Sidebar and Top Nav remain the same -->
    <div class="sidebar">
        <div class="logo-container">
            <svg class="admin-logo" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 4C14.2091 4 16 5.79086 16 8C16 10.2091 14.2091 12 12 12C9.79086 12 8 10.2091 8 8C8 5.79086 9.79086 4 12 4Z" fill="white"/>
                <path d="M12 14C16.4183 14 20 15.7909 20 18V20H4V18C4 15.7909 7.58172 14 12 14Z" fill="white"/>
            </svg>
            <div class="logo">Admin Panel</div>
        </div>
        <ul class="menu-links">
            <li><a href="Enquiry.jsp"><i class="fas fa-question-circle"></i>Enquiry</a></li>
            <li><a href="follow"><i class="fas fa-users"></i>Follow</a></li>
            <li><a href="getRegister"><i class="fas fa-user-plus"></i>Registration</a></li>
            <li><a href="UpdateDetails.jsp"><i class="fas fa-edit"></i>UpdateDetails</a></li>
            <li><a href="getTrainerDetails"><i class="fas fa-chart-bar"></i>TrainerDetails</a></li>
            <li><a href="assignSlot"><i class="fas fa-cog"></i>AssignSlot</a></li>
            <li><a href="UserTrainerAndSlot.jsp"><i class="fas fa-cog"></i>UseSlotAndTrainer</a></li>


        </ul>
    </div>

    <div class="top-nav">
        <div class="search-bar">
            <input type="text" placeholder="Search...">
        </div>
        <div class="top-nav-right">
            <div class="notification-icon">
                <i class="fas fa-bell"></i>
                <span class="notification-badge">3</span>
            </div>
            <div class="admin-profile">
                <div class="admin-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="admin-info">
                    <div class="admin-name">Admin</div>
                    <div class="admin-logout">Logout</div>
                </div>
            </div>
        </div>
    </div>

    <div class="main-content">
        <h2>Dashboard Overview</h2>
        <div class="metrics-container">
            <div class="metric-card enquiry-card">
                <div class="metric-icon">
                    <i class="fas fa-question-circle fa-lg"></i>
                </div>
                <div class="metric-info">
                    <div class="metric-title">Total Enquiries</div>
                    <div class="metric-value">156</div>
                </div>
            </div>

            <div class="metric-card follow-card">
                <div class="metric-icon">
                    <i class="fas fa-users fa-lg"></i>
                </div>
                <div class="metric-info">
                    <div class="metric-title">Total Follows</div>
                    <div class="metric-value">2,847</div>
                </div>
            </div>

            <div class="metric-card registration-card">
                <div class="metric-icon">
                    <i class="fas fa-user-plus fa-lg"></i>
                </div>
                <div class="metric-info">
                    <div class="metric-title">Registrations</div>
                    <div class="metric-value">1,433</div>
                </div>
            </div>

            <div class="metric-card update-card">
                <div class="metric-icon">
                    <i class="fas fa-edit fa-lg"></i>
                </div>
                <div class="metric-info">
                    <div class="metric-title">Updates</div>
                    <div class="metric-value">892</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>