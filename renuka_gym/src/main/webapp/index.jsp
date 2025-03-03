<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FitZone Gym</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        /* Navigation Styles */
        nav {
            background-color: #1e1e1e;
            background-image: linear-gradient(to right, #1e1e1e, #3a3a3a);
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #ff6b00;
            font-size: 28px;
            font-weight: bold;
            text-decoration: none;
            text-shadow: 1px 1px 0 rgba(0,0,0,0.3);
        }

        .menu {
            display: flex;
            list-style: none;
        }

        .menu li {
            margin-left: 25px;
        }

        .menu a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
            font-weight: 500;
            padding: 5px 0;
            position: relative;
        }

        .menu a:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: #ff6b00;
            bottom: 0;
            left: 0;
            transition: width 0.3s;
        }

        .menu a:hover {
            color: #ff6b00;
        }

        .menu a:hover:after {
            width: 100%;
        }

        /* Home Section / Slider */
        .slider-container {
            max-width: 100%;
            margin: 0 auto;
            overflow: hidden;
            position: relative;
            height: 600px;
        }

        .slides {
            width: 300%;
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .slide {
            width: 33.33%;
            height: 600px;
            background-position: center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }

        .slide h2 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
        }

        .slide p {
            font-size: 1.8rem;
            max-width: 700px;
            margin: 0 auto;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.7);
        }

        .slide-content {
            background-color: rgba(0,0,0,0.4);
            padding: 30px;
            border-radius: 10px;
            backdrop-filter: blur(5px);
        }

        /* Section Styles */
        section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h2.section-title {
            text-align: center;
            font-size: 2.8rem;
            margin-bottom: 50px;
            position: relative;
            color: #1e1e1e;
        }

        h2.section-title:after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, #ff6b00, #ff9d45);
            border-radius: 2px;
        }

       /* Updated Trainer Section Styles */
       .trainers-container {
           display: flex;
           flex-wrap: wrap;
           justify-content: center;
           gap: 25px;
       }

       .trainer-card {
           width: 240px;
           border-radius: 10px;
           overflow: hidden;
           box-shadow: 0 5px 15px rgba(0,0,0,0.1);
           transition: transform 0.3s, box-shadow 0.3s;
           background-color: white;
       }

       .trainer-card:hover {
           transform: translateY(-10px);
           box-shadow: 0 10px 25px rgba(0,0,0,0.2);
       }

       .trainer-img {
           width: 100%;
           height: 240px;
           object-fit: cover;
           filter: brightness(0.95);
           transition: filter 0.3s;
       }

       .trainer-card:hover .trainer-img {
           filter: brightness(1.05);
       }

       .trainer-info {
           padding: 15px;
       }

       .trainer-info h3 {
           font-size: 1.3rem;
           margin-bottom: 8px;
           color: #ff6b00;
       }

       .trainer-info p {
           margin: 5px 0;
           line-height: 1.4;
           color: #555;
           font-size: 0.95rem;
       }

       /* Responsive design for smaller screens */
       @media (max-width: 768px) {
           .trainer-card {
               width: 280px; /* slightly wider on mobile for better visibility */
           }
       }

        /* Schedule Section */
        .schedule-container {
            background-color: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.05);
        }

        .schedule-day {
            margin-bottom: 40px;
        }

        .schedule-day h3 {
            font-size: 1.8rem;
            border-bottom: 3px solid #ff6b00;
            padding-bottom: 10px;
            margin-bottom: 20px;
            color: #1e1e1e;
        }

        .schedule-slot {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s;
        }

        .schedule-slot:hover {
            background-color: #f9f9f9;
            border-radius: 5px;
            padding-left: 10px;
            padding-right: 10px;
        }

        .schedule-time {
            font-weight: bold;
            width: 100px;
            color: #ff6b00;
        }

        .schedule-class {
            flex: 1;
            font-weight: 500;
        }

        .schedule-trainer {
            width: 250px;
            color: #555;
        }

        /* Contact Section */
        .contact-container {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
        }

        .contact-form {
            flex: 1;
            min-width: 320px;
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .contact-info {
            flex: 1;
            min-width: 320px;
            background-color: #f5f5f5;
            padding: 35px;
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s, box-shadow 0.3s;
            font-family: inherit;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #ff6b00;
            box-shadow: 0 0 0 2px rgba(255,107,0,0.2);
            outline: none;
        }

        .form-group textarea {
            height: 160px;
            resize: vertical;
        }

        button {
            background: linear-gradient(to right, #ff6b00, #ff9d45);
            color: white;
            border: none;
            padding: 14px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 10px rgba(255,107,0,0.2);
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(255,107,0,0.3);
        }

        button:active {
            transform: translateY(1px);
        }

        /* About Section */
        .about-content {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            align-items: center;
        }

        .about-image {
            flex: 1;
            min-width: 320px;
        }

        .about-image img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .about-image:hover img {
            transform: scale(1.02);
        }

        .about-text {
            flex: 2;
            min-width: 320px;
            line-height: 1.8;
            color: #555;
        }

        .about-text p {
            margin-bottom: 20px;
        }

        /* Location Section */
        .location-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .map-container {
            width: 100%;
            height: 450px;
            margin-bottom: 40px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .address-container {
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            max-width: 600px;
            text-align: center;
        }

        .address-container h3 {
            color: #ff6b00;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        .address-container h4 {
            color: #1e1e1e;
            font-size: 1.4rem;
            margin: 20px 0 10px;
        }

        .address-container p {
            color: #555;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        /* Footer */
        footer {
            background-color: #1e1e1e;
            color: #ddd;
            padding: 50px 0 30px;
            text-align: center;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .social-links {
            margin: 25px 0;
        }

        .social-links a {
            color: #ddd;
            margin: 0 15px;
            font-size: 1.8rem;
            transition: color 0.3s, transform 0.3s;
            display: inline-block;
        }

        .social-links a:hover {
            color: #ff6b00;
            transform: scale(1.2);
        }

        /* Animation for the slideshow */
        @keyframes slideAnimation {
            0% { transform: translateX(0); }
            28% { transform: translateX(0); }
            33.33% { transform: translateX(-33.33%); }
            61.33% { transform: translateX(-33.33%); }
            66.66% { transform: translateX(-66.66%); }
            94.66% { transform: translateX(-66.66%); }
            100% { transform: translateX(0); }
        }

        .slides {
            animation: slideAnimation 18s infinite;
        }

        /* Call to action button on slides */
        .cta-button {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 30px;
            background: linear-gradient(to right, #ff6b00, #ff9d45);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0,0,0,0.3);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                padding: 0 20px;
            }

            .menu {
                margin-top: 20px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .menu li {
                margin: 8px 12px;
            }

            .slide h2 {
                font-size: 2.2rem;
            }

            .slide p {
                font-size: 1.2rem;
            }

            .slide-content {
                width: 90%;
                padding: 20px;
            }

            .slider-container {
                height: 500px;
            }

            .slide {
                height: 500px;
            }
        }
        /* Login buttons styling */
        .login-button {
            padding: 5px 12px;
            border-radius: 4px;
            transition: all 0.3s;
            font-weight: 600;
        }

        .user-login {
            background-color: rgba(255, 107, 0, 0.2);
            border: 1px solid #ff6b00;
        }

        .user-login:hover {
            background-color: #ff6b00;
            color: white;
        }

        .user-login:hover:after {
            width: 0; /* Override the underline animation for login buttons */
        }

        .admin-login {
            background-color: rgba(0, 0, 0, 0.1);
            border: 1px solid #1e1e1e;
            margin-left: 10px;
        }

        .admin-login:hover {
            background-color: #1e1e1e;
            color: white;
        }

        .admin-login:hover:after {
            width: 0; /* Override the underline animation for login buttons */
        }
        /* Schedule Table Styling */
       /* Schedule Table Styling */
       .schedule-table {
           width: 100%;
           border-collapse: collapse;
           margin-top: 20px;
           background-color: white;
           box-shadow: 0 2px 10px rgba(0,0,0,0.05);
           border-radius: 5px;
           overflow: hidden;
       }

       .schedule-table th,
       .schedule-table td {
           padding: 15px;
           text-align: left;
           border-bottom: 1px solid #eee;
       }

       .schedule-table th {
           background-color: #f5f5f5;
           color: #333;
           font-weight: bold;
           text-transform: uppercase;
           font-size: 0.9rem;
           letter-spacing: 1px;
       }

       .schedule-table tr:last-child td {
           border-bottom: none;
       }

       .schedule-table tr:hover td {
           background-color: #f9f9f9;
       }

       .schedule-table td:nth-child(1) {
           color: #ff6b00;
           font-weight: bold;
       }

       /* For responsive tables */
       @media (max-width: 768px) {
           .schedule-table {
               display: block;
               overflow-x: auto;
               white-space: nowrap;
           }
       }
       /* Light background colors for sections */
       #about {
           background-color: #f9f7f5;
       }

       #trainers {
           background-color: #f5f9f7;
       }

       #schedule {
           background-color: #f7f5f9;
       }

       #location {
           background-color: #f5f7f9;
       }

       #contact {
           background-color: #f9f5f7;
       }

       /* Ensure content within each section has proper padding */
       section {
           padding: 80px 20px;
           max-width: 1200px;
           margin: 0 auto;
       }

       /* Full-width background colors */
       #about, #trainers, #schedule, #location, #contact {
           padding: 80px 0;
           position: relative;
       }

       #about::before, #trainers::before, #schedule::before, #location::before, #contact::before {
           content: '';
           position: absolute;
           top: 0;
           left: 0;
           right: 0;
           bottom: 0;
           z-index: -1;
       }

       #about::before {
           background-color: #f9f7f5;
       }

       #trainers::before {
           background-color: #f5f9f7;
       }

       #schedule::before {
           background-color: #f7f5f9;
       }

       #location::before {
           background-color: #f5f7f9;
       }

       #contact::before {
           background-color: #f9f5f7;
       }

       /* Cards and content areas need background to stand out */
       .trainer-card, .schedule-container, .contact-form, .about-text, .address-container {
           background-color: white;
           border-radius: 10px;
           box-shadow: 0 5px 15px rgba(0,0,0,0.05);
       }

       .about-text {
           padding: 30px;
       }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- Navigation Bar -->
  <nav>
      <div class="nav-container">
          <a href="#home" class="logo">Renuka Gym</a>
          <ul class="menu">
              <li><a href="#home">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#trainers">Trainers</a></li>
              <li><a href="#schedule">Schedule</a></li>
              <li><a href="#location">Location</a></li>
              <li><a href="#contact">Contact</a></li>
              <li><a href="UserSignIn.jsp" class="login-button user-login">User Login</a></li>
              <li><a href="SignIn.jsp" class="login-button admin-login">Admin Login</a></li>
          </ul>
      </div>
  </nav>
    <!-- Home Section / Slider -->
    <section id="home" class="slider-container">
        <div class="slides">
            <div class="slide" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/api/placeholder/1200/600');">
                <div class="slide-content">
                    <h2>Welcome to RenukaGym</h2>
                    <p>Transform your body, transform your life</p>
                    <a href="trainerImage-2.jpeg" class="cta-button">Join Today</a>
                </div>
            </div>
            <div class="slide" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/api/placeholder/1200/600');">
                <div class="slide-content">
                    <h2>Expert Trainers</h2>
                    <p>Our professional team will help you achieve your fitness goals</p>
                    <a href="trainerImage-3.jpeg" class="cta-button">Meet Our Team</a>
                </div>
            </div>
            <div class="slide" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/api/placeholder/1200/600');">
                <div class="slide-content">
                    <h2>Modern Equipment</h2>
                    <p>State-of-the-art facilities for your perfect workout</p>
                    <a href="trainerImage-4.jpeg" class="cta-button">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about">
        <h2 class="section-title">About Us</h2>
        <div class="about-content">
            <div class="about-image">
                <img src="" alt="Gym interior with state-of-the-art equipment">
            </div>
            <div class="about-text">
                <p>Welcome to RenukaGym, where fitness becomes a lifestyle. Established in 2010, we've been helping people transform their lives through exercise and healthy habits for over a decade.</p>
                <p>Our state-of-the-art facility spans 15,000 square feet and includes cardio zones, strength training areas, functional fitness spaces, and dedicated studios for group classes. Whether you're just starting your fitness journey or you're an experienced athlete, our diverse equipment selection will meet your needs.</p>
                <p>At FitZone, we believe that fitness should be accessible to everyone. That's why our certified trainers create personalized workout plans tailored to your specific goals, fitness level, and preferences. We're not just a gym - we're a community dedicated to supporting each other on the path to better health.</p>
                <p>Join our vibrant fitness community today and experience the difference that professional guidance, cutting-edge equipment, and a supportive environment can make in achieving your health and fitness goals.</p>
            </div>
        </div>
    </section>

    <!-- Trainers Section -->
  <!-- Trainers Section -->
  <section id="trainers">
      <h2 class="section-title">Our Trainers</h2>
      <div class="trainers-container">
          <!-- John Smith -->
          <div class="trainer-card">
              <a href="https://imgbb.com/"><img src="https://i.ibb.co/YFFgmV0Z/trainer-Image-4.jpg" alt="trainer-Image-4" border="0" class="trainer-img"></a>
              <div class="trainer-info">
                  <h3>John Smith</h3>
                  <p><strong>Specialization:</strong> Strength & Conditioning</p>
                  <p><strong>Experience:</strong> 8 years</p>
                  <p><strong>Certifications:</strong> NASM-CPT, CrossFit L2</p>
              </div>
          </div>

          <!-- Sarah Johnson -->
          <div class="trainer-card">
             <a href="https://imgbb.com/"><img src="https://i.ibb.co/35b1nrQC/trainer-Image-3.jpg" alt="trainer-Image-3" border="0" class="trainer-img"></a>
              <div class="trainer-info">
                  <h3>Sarah Johnson</h3>
                  <p><strong>Specialization:</strong> HIIT & Fat Loss</p>
                  <p><strong>Experience:</strong> 6 years</p>
                  <p><strong>Certifications:</strong> ACE-CPT, TRX Certified</p>
              </div>
          </div>

          <!-- Michael Chen -->
          <div class="trainer-card">
             <a href="https://imgbb.com/"><img src="https://i.ibb.co/5xJFZdxZ/gym-Picture3.jpg" alt="gym-Picture3" class="trainer-img">
              <div class="trainer-info">
                  <h3>Michael Chen</h3>
                  <p><strong>Specialization:</strong> Yoga & Flexibility</p>
                  <p><strong>Experience:</strong> 10 years</p>
                  <p><strong>Certifications:</strong> RYT-500, CEP</p>
              </div>
          </div>

          <!-- New Trainer: Elena Rodriguez -->
          <div class="trainer-card">
          <a href="https://imgbb.com/"><img src="https://i.ibb.co/9mRN5GCx/image.jpg" alt="trainerImage-2.jpeg" class="trainer-img">
              <div class="trainer-info">
                  <h3>Elena Rodriguez</h3>
                  <p><strong>Specialization:</strong> Pilates & Core Strength</p>
                  <p><strong>Experience:</strong> 7 years</p>
                  <p><strong>Certifications:</strong> PMA-CPT, ACSM-CPT</p>
              </div>
          </div>

          <!-- New Trainer: David Kim -->
          <div class="trainer-card">
               <a href="https://imgbb.com/"><img src="https://i.ibb.co/9mRN5GCx/image.jpg" alt="image" class="trainer-img">
              <div class="trainer-info">
                  <h3>David Kim</h3>
                  <p><strong>Specialization:</strong> Nutrition & Weight Management</p>
                  <p><strong>Experience:</strong> 9 years</p>
                  <p><strong>Certifications:</strong> PN2, ISSA-NS</p>
              </div>
          </div>

          <!-- New Trainer: Aisha Williams -->
          <div class="trainer-card">
             <a href="https://ibb.co/SDqPCJ9k"><img src="https://i.ibb.co/9mRN5GCx/image.jpg" alt="image" border="0"></a>  class="trainer-img">
              <div class="trainer-info">
                  <h3>Aisha Williams</h3>
                  <p><strong>Specialization:</strong> Functional Training</p>
                  <p><strong>Experience:</strong> 5 years</p>
                  <p><strong>Certifications:</strong> NSCA-CPT, FMS</p>
              </div>
          </div>
      </div>
  </section>

    <!-- Schedule Section -->
   <!-- Schedule Section with Table -->
  <!-- Schedule Section with Table -->
  <!-- Schedule Section with Table -->
  <section id="schedule">
      <h2 class="section-title">Daily Class Schedule</h2>
      <div class="schedule-container">
          <div class="schedule-day">
              <h3>Today's Classes</h3>
              <table class="schedule-table">
                  <thead>
                      <tr>

                          <th>Class</th>
                          <th>Trainer</th>
                          <th>Phone Number</th>
                          <th>Time</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>

                          <td>Morning Bootcamp</td>
                          <td>John Smith</td>
                          <td>(555) 123-4567</td>
                             <td>6:00 AM</td>
                      </tr>
                      <tr>

                          <td>Yoga Flow</td>
                          <td>Michael Chen</td>
                          <td>(555) 789-0123</td>
                          <td>9:00 AM</td>
                      </tr>
                      <tr>

                          <td>Lunch Express Workout</td>
                          <td>Sarah Johnson</td>
                          <td>(555) 456-7890</td>
                           <td>12:00 PM</td>
                      </tr>
                      <tr>

                          <td>Strength Circuit</td>
                          <td>John Smith</td>
                          <td>(555) 123-4567</td>
                           <td>3:00 PM</td>
                      </tr>
                      <tr>

                          <td>HIIT Blast</td>
                          <td>Sarah Johnson</td>
                          <td>(555) 456-7890</td>
                           <td>5:30 PM</td>
                      </tr>
                      <tr>

                          <td>Gentle Yoga</td>
                          <td>Michael Chen</td>
                          <td>(555) 789-0123</td>
                            <td>7:00 PM</td>
                      </tr>
                  </tbody>
              </table>
          </div>
      </div>
  </section>

    <!-- Contact Section -->
    <section id="contact">
        <h2 class="section-title">Contact Us</h2>
        <div class="contact-container">
            <form class="contact-form">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" placeholder="Your full name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Your email address" required>
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" placeholder="Tell us how we can help you..." required></textarea>
                </div>
                <button type="submit">Send Message</button>
            </form>
            <div class="contact-info">
                <h3 style="color: #ff6b00; font-size: 1.8rem; margin-bottom: 20px;">Get In Touch</h3>
                <p>Have questions about our gym, services, or membership options? Feel free to reach out to us! Our friendly team is ready to assist you with any inquiries you might have.</p>
                <p>You can also call us at <strong>(555) 123-4567</strong> or visit us during our operating hours.</p>
                <p>We look forward to helping you start your fitness journey!</p>
                <div style="margin-top: 30px; text-align: center;">
                    <img src="/api/placeholder/300/200" alt="Gym reception area" style="border-radius: 5px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <p>&copy; 2025 FitZone Gym. All Rights Reserved.</p>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
            <p style="margin-top: 20px; font-size: 0.9rem; color: #999;">FitZone Gym is committed to helping you achieve your fitness goals in a welcoming and supportive environment. Join our community today!</p>
        </div>
    </footer>

    <script>
        // Simple JavaScript for the slideshow
        // In a production site, you might want to use a library for this
        document.addEventListener('DOMContentLoaded', function() {
            // Slideshow functionality
            const slideContainer = document.querySelector('.slides');
            const slides = document.querySelectorAll('.slide');
            const totalSlides = slides.length;
            let currentSlide = 0;

            function goToSlide(index) {
                if (index >= totalSlides) {
                    index = 0;
                } else if (index < 0) {
                    index = totalSlides - 1;
                }

                currentSlide = index;
                const offset = -currentSlide * (100 / totalSlides);
                slideContainer.style.transform = `translateX(${offset}%)`;
                slideContainer.style.transition = 'transform 0.5s ease-in-out';
            }

            // Auto advance slides
            setInterval(() => {
                goToSlide(currentSlide + 1);
            }, 6000);

            // Smooth scrolling for navigation links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();

                    const targetId = this.getAttribute('href');
                    const targetElement = document.querySelector(targetId);

                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 70,
                            behavior: 'smooth'
                        });
                    }
                });
            });

            // Highlight active nav item on scroll
            window.addEventListener('scroll', function() {
                const sections = document.querySelectorAll('section');
                let current = '';

                sections.forEach(section => {
                    const sectionTop = section.offsetTop;
                    const sectionHeight = section.clientHeight;
                    if (window.pageYOffset >= sectionTop - 150) {
                        current = section.getAttribute('id');
                    }
                });

                document.querySelectorAll('.menu a').forEach(a => {
                    a.classList.remove('active');
                    if (a.getAttribute('href') === '#' + current) {
                        a.classList.add('active');
                    }
                });
            });
        });
    </script>
