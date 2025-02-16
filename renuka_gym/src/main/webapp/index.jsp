<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Website</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; text-align: center; }
        .navbar { background: #333; padding: 15px; color: white; text-align: center; font-size: 20px; }
        .navbar a { color: white; text-decoration: none; margin: 0 15px; }
        .slideshow-container { position: relative; max-width: 100%; margin: auto; }
        .slide { display: none; width: 100%; }
        .active { display: block; }
        .next-btn { position: absolute; top: 50%; right: 20px; background: black; color: white; padding: 10px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#services">Services</a>
        <a href="#contact">Contact</a>
         <a href="SignIn.jsp">AdminLogin</a>
         <a href="UserSignIn.jsp">UserLogin</a>
    </div>
    <div class="slideshow-container">
        <img class="slide active" src="" alt="Gym Image 1">
        <img class="slide" src="" alt="Gym Image 2">
        <img class="slide" src="" alt="Gym Image 3">
        <button class="next-btn" onclick="nextSlide()">Next</button>
    </div>
    <script>
        let index = 0;
        function nextSlide() {
            let slides = document.querySelectorAll('.slide');
            slides[index].classList.remove('active');
            index = (index + 1) % slides.length;
            slides[index].classList.add('active');
        }
    </script>
</body>
</html>
