<%@page isELIgnored = "false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #1877f2;
            border-color: #1877f2;
        }
        .btn-primary:hover {
            background-color: #145dbf;
            border-color: #145dbf;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="form-container">




               <c:if test="${not empty error}">
                   <c:forEach items="${error}" var="err">
                       <div style="color: red;">${err.defaultMessage}</div>
                   </c:forEach>
               </c:if>



       <h3 class="text-center mb-4">User Registration</h3>
        <form action="save" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">User Name</label>
                <input type="text" id="name" name="name" class="form-control" onchange="onName()" onblur="handleValidate(event)" placeholder="Enter your name">
                <span id="nameValid" style="color:red"></span>
                <br>
                 <span id="nameerror"></span>

            </div>
            <div class="mb-3">
                <label for="email" class="form-label">User Email</label>
                <input type="email" id="email" name="email" class="form-control" onchange="onEmail()" onblur="handleValidate(event)" placeholder="Enter your email">
                 <span id="emailDemo" style="color:red"></span>
                 <br>
                   <span id="emailerror"></span>

            </div>
            <div class="mb-3">
                <label for="altEmail" class="form-label">Alternative Email</label>
                <input type="email" id="alternativeEmail" name="alternativeEmail" class="form-control" onchange="onaltEmail()" onblur="handleValidate(event)" placeholder="Enter your alternative email">
                <span id="altemailDemo" style="color:red"></span>
                <br>
                  <span id="altemailerror"></span>
            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">User Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" onchange="onphoneNumber()" onblur="handleValidate(event)" placeholder="Enter your phone number">
             <span id="numberDemo" style="color:red"></span>
             <br>
               <span id="numbererror" style="color:red"></span>

            </div>
            <div class="mb-3">
                <label for="alternativePhoneNumber" class="form-label">Alternative Phone Number</label>
                <input type="text" id="alternativePhoneNumber" name="alternativePhoneNumber" class="form-control" onchange="onalterphoneNumber()" onblur="handleValidate(event)" placeholder="Enter your alternative phone number">
             <span id="altnumberDemo" style="color:red"></span>
             <br>
             <span id="altnumbererror"></span>
            </div>
            <div class="mb-3">
                <label for="location" class="form-label">User Location</label>
                <input type="text" id="location" name="location" class="form-control" onblur="handleValidate(event)" placeholder="Enter your location">
             <span id="locationDemo" style="color:red"></span>
             <br>
             <span id="locationerror" style="color:red"></span>
            </div>
            <button type="submit" class="btn btn-primary w-100">Save</button>

        </form>
         ${message}

    </div>

    <script>



    function onName() {

                           var name= document.getElementById('name').value;
                            console.log("User name: ", email);
                            var xhttp = new XMLHttpRequest();
                           xhttp.open("GET", "http://localhost:8080/xworkz_CommonModule_renuka/name/" + name, true);
                           xhttp.send();
                             xhttp.onload=function()
                                      {
                                      document.getElementById("nameValid").innerHTML=this.responseText;
                                      }
                       }

       function onEmail() {

                  var email= document.getElementById('email').value;
                   console.log("User email: ", email);
                   var xhttp = new XMLHttpRequest();
                  xhttp.open("GET", "http://localhost:8080/xworkz_CommonModule_renuka/email/" + email, true);
                  xhttp.send();
                    xhttp.onload=function()
                             {
                             document.getElementById("emailDemo").innerHTML=this.responseText;
                             }
              }
               function onaltEmail() {

                                var alternativeEmail= document.getElementById('alternativeEmail').value;
                                 console.log("User altEmail: ", email);
                                 var xhttp = new XMLHttpRequest();
                                xhttp.open("GET", "http://localhost:8080/xworkz_CommonModule_renuka/alternativeEmail/" + alternativeEmail, true);
                                xhttp.send();
                                  xhttp.onload=function()
                                           {
                                           document.getElementById("altemailDemo").innerHTML=this.responseText;
                                           }
                            }

              function onphoneNumber() {

                  var phoneNumber= document.getElementById('phoneNumber').value;
                console.log("User phoneNumber: ", phoneNumber);
                  var xhttp = new XMLHttpRequest();
               xhttp.open("GET", "http://localhost:8080/xworkz_CommonModule_renuka/phoneNumber/" + phoneNumber, true);
                   xhttp.send();
                    xhttp.onload=function()
                           {
                      document.getElementById("numberDemo").innerHTML=this.responseText;
                             }
              }

             function onalterphoneNumber()
             {

               var alternativePhoneNumber= document.getElementById('alternativePhoneNumber').value;
               console.log("User alternativePhoneNumber: ", alternativePhoneNumber);
               var xhttp = new XMLHttpRequest();
               xhttp.open("GET", "http://localhost:8080/xworkz_CommonModule_renuka/alternativePhoneNumber/" + alternativePhoneNumber, true);
                   xhttp.send();
                     xhttp.onload=function()
                                              {
                                         document.getElementById("altnumberDemo").innerHTML=this.responseText;
                                                }
             }


        const handleValidate = (event) => {
            const { name, value } = event.target;
            if (name === "name" && value.length > 3 && value.length < 10 && value.trim()) {
                console.log("Name is valid");
                document.getElementById("nameerror").innerHTML = "<span style='color:green'>Name is Valid</span>";
            } else if (name === "name" && value.length < 3 && value.length < 10 && value.trim()) {
                console.log("Name is invalid");
                document.getElementById("nameerror").innerHTML = "<span style='color:red'>Name is invalid</span>";
                return;
          }

                    if (name === "email" && value.includes("@gmail.com") && value.trim()) {
                        console.log("email is valid");
                        document.getElementById("emailerror").innerHTML = "<span style='color:green'>email is Valid</span>";
                    } else if (name === "email" && value.includes("@gmail.com") && value.trim()) {
                        console.log("email is invalid");
                        document.getElementById("emailerror").innerHTML = "<span style='color:red'>email is invalid</span>";
                        return;
                    }


                 if (name === "alternativeEmail" && value.includes("@gmail.com") && value.trim()) {
                                        console.log("alternative Email is valid");
                                        document.getElementById("altemailerror").innerHTML = "<span style='color:green'>alternative Email is Valid</span>";
                                    } else if (name === "alternativeEmail" && value.includes("@gmail.com") && value.trim()) {
                                        console.log("alternative Email is invalid");
                                        document.getElementById("altemailerror").innerHTML = "<span style='color:red'>alternative Email is invalid</span>";
                                        return;
                 }
                 if (name === "alternativeEmail" && value === document.getElementById("email").value) {
                     console.log("email and alternative email are the same");
                     document.getElementById("altemailerror").innerHTML = "<span style='color:red'>Email and alternative email cannot be the same</span>";
                     return;
                 }
                 if (name === "phoneNumber") {
                        const phonePattern = /^[0-9]{10}$/;  // Regex for 10-digit phone number (modify length as needed)

                        if (phonePattern.test(value.trim())) {
                            console.log("Phone number is valid");
                            document.getElementById("numbererror").innerHTML = "<span style='color:green'>Phone number is valid</span>";
                        } else {
                            console.log("Phone number is invalid");
                            document.getElementById("numbererror").innerHTML = "<span style='color:red'>Phone number must be 10 digits</span>";
                        }
                    }
                   if (name === "alternativePhoneNumber") {
                                         const phonePattern = /^[0-9]{10}$/;  // Regex for 10-digit phone number (modify length as needed)

                                         if (phonePattern.test(value.trim())) {
                                             console.log("alternative PhoneNumber number is valid");
                                             document.getElementById("altnumbererror").innerHTML = "<span style='color:green'>alternative PhoneNumber number is valid</span>";
                                         } else {
                                             console.log("Phone number is invalid");
                                             document.getElementById("altnumbererror").innerHTML = "<span style='color:red'>alternative PhoneNumber number must be 10 digits</span>";
                                         }
                     }

                  if (name === "location" && value.length > 3 && value.length < 100 && value.trim()) {
                                 console.log("location is valid");
                                 document.getElementById("locationerror").innerHTML = "<span style='color:green'>location is Valid</span>";
                             } else if (name === "location" && value.length < 3 && value.length < 100 && value.trim()) {
                                 console.log("location is invalid");
                                 document.getElementById("locationerror").innerHTML = "<span style='color:red'>location is invalid</span>";
                                 return;
                           }






                };







        </script>
        
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
