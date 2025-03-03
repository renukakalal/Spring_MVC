<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: system-ui, -apple-system, sans-serif;
        }

        body {
            background: #f8f8f8;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 2rem;
        }

        .sidebar {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            height: fit-content;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 60px;
            background: #f0f0f0;
            margin: 0 auto 1rem;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .profile-name {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .profile-email {
            color: #666;
            font-size: 0.9rem;
        }

        .nav-links {
            list-style: none;
        }

        .nav-links li {
            margin-bottom: 0.5rem;
        }

        .nav-links a {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            text-decoration: none;
            color: #333;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: #f0f0f0;
        }

        .nav-links .active {
            background: #ff3278;
            color: white;
        }

        .main-content {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .profile-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        .detail-item {
            padding: 1rem;
            background: #f8f8f8;
            border-radius: 8px;
        }

        .detail-label {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }

        .detail-value {
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }

            .profile-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <div class="profile-header">
                <div class="profile-pic"></div>
                <h2 class="profile-name">${isAuthenticated.name}</h2>
                <p class="profile-email">${isAuthenticated.email}</p>
            </div>
            <nav>
                <ul class="nav-links">
                    <li><a href="#" class="active">Profile</a></li>
                  <li><a href="editDetails?id=${isAuthenticated.id}">Update Profile</a></li>


                    <li><a href="ResetPassword.jsp">reset Password</a></li>
                    <li><a href="UserTrainerSlotDetails?id=${isAuthenticated.trainer}">Trainer Details</a></li>

                    <li><a href="registerView?id=${isAuthenticated.id}">Payment Details</a></li>
                     <li><a href="getByUserId?UserId=${isAuthenticated.id}">Diet Plan</a><li>
                     <li><a href="getChanges?UserId=${isAuthenticated.id}">Changes</a><li>



                </ul>
            </nav>
        </aside>




        <main class="main-content">
        <aside class="sidebar">
            <div class="profile-header">
                <form action="uploadProfileImage" method="post" enctype="multipart/form-data">
                    <div class="profile-pic">

                        <c:choose>
                            <c:when test="${not empty isAuthenticated.filePath}">

                          <img src="image?filePath=${isAuthenticated.filePath}" alt="Profile Image"
                               style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;" />
                            </c:when>
                            <c:otherwise>
                                <span style="opacity: 0.5;">📷</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </form>
            </div>

        </aside>

        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function() {
                    var imgElement = document.querySelector(".profile-pic img");
                    if (!imgElement) {
                        imgElement = document.createElement("img");
                        imgElement.style.width = "100%";
                        imgElement.style.height = "100%";
                        imgElement.style.objectFit = "cover";
                        imgElement.style.borderRadius = "50%";
                        document.querySelector(".profile-pic").appendChild(imgElement);
                    }
                    imgElement.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>

            <h2 class="section-title">Personal Information</h2>
            <div class="profile-details">

                  <input type="hidden" name="trainer" value="${isAuthenticated.trainer}">
                <div class="detail-item">
                    <div class="detail-label">Full Name</div>
                    <div class="detail-value">${isAuthenticated.name}</div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Email</div>
                    <div class="detail-value">${isAuthenticated.email}</div>
                </div>


                <div class="detail-item">
                    <div class="detail-label">Age</div>
                    <div class="detail-value">${isAuthenticated.age} years</div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Gender</div>
                    <div class="detail-value">${isAuthenticated.gender}</div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Height</div>
                    <div class="detail-value">${isAuthenticated.height} cm</div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Weight</div>
                    <div class="detail-value">${isAuthenticated.weight} kg</div>
                </div>





            </div>
        </main>
    </div>
</body>
</html>