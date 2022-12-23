<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="en">
<head>
    <title>Cargo Delivery Service</title>
    <link rel="icon" type="image/x-icon" href="resources/img/favicon.ico">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
body, html {
  height: 100%;
  line-height: 1.8;
}

.w3-bar .w3-button {
  padding: 16px;
}

.container {
  padding: 16px;
}

#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)}
  to {-webkit-transform: scale(1)}
}

@keyframes animatezoom {
  from {transform: scale(0)}
  to {transform: scale(1)}
}


    </style>

</head>

<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="home" class="w3-bar-item w3-button w3-wide">HOME</a>
        <!-- Right-sided navbar links -->
    </div>
</div>

<header class="w3-container" id="info">
    <div class="w3-left" style="padding-top: 58px; padding-right: 58px; padding-bottom: 0px; padding-left: 58px;">
        <h3><i class="fa fa-sign-in"></i> SIGN-UP</h3>
    </div>
</header>

<!-- Sign-up window -->
<div class="w3-container w3-padding-16 w3-grayscale w3-card w3-center">
    <form action="signup" method="post" id="regForm">
        <div class="w3-container w3-padding-16">
            <p class="w3-center w3-large">Please fill in this form to create an account.</p>
            <hr>
            <p class="w3-left">Name:</p>
            <input class="w3-input w3-border" type="text" placeholder="Enter first name..." name="firstname"
                   id="firstname" required><br>
            <input class="w3-input w3-border" type="text" placeholder="Enter last name..." name="lastname"
                   id="lastname" required><br>
            <p class="w3-left">Contact Info:</p>
            <input class="w3-input w3-border" type="text" placeholder="Enter e-mail..." name="email"
                   id="email" required>
            <c:if test="${errorEmail != null}">
                <p class="w3-left" style="color: red;">${errorEmail}</p>
            </c:if><br>
            <input class="w3-input w3-border" type="tel" placeholder="Enter phone..." name="phone"
                   id="phone" pattern="^\+?380\d{2}\d{3}\d{2}\d{2}$" maxlength="13"
                   title="+380XXXXXXXXX" required>
            <c:if test="${errorPhone != null}">
                <p class="w3-left" style="color: red;">${errorPhone}</p>
            </c:if><br>
            <p class="w3-left">Address:</p>
            <input class="w3-input w3-border" type="text" placeholder="Enter city..." name="city" id="city"
                   required><br>
            <input class="w3-input w3-border" type="text" placeholder="Enter street..." name="street"
                   id="street" required><br>
            <input class="w3-input w3-border" type="text" placeholder="Enter postal code..."
                   name="postalcode" id="postalcode" required><br>
            <p class="w3-left">Password:</p>
            <input class="w3-input w3-border" type="password" placeholder="Enter password..." id="password"
                   name="password" onkeyup="matchPassword()" pattern="(?=.*\d)(?=.*[a-zа-я])(?=.*[A-ZА-Я]).{8,}"
                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                   required><br>
            <input class="w3-input w3-border" type="password" placeholder="Repeat password..." id="reppass"
                   name="reppass"
                   required onkeyup="matchPassword()"><br>
            <span id='wrong_pass'></span><br>
            <p class="w3-left"><input type="checkbox" onclick="myFunction2(); myFunction3();"> Show Password</p>
            <br>
            <div id="message" class="w3-container w3-small">
                <p>Password must contain the following:</p>
                <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                <p id="number" class="invalid">A <b>number</b></p>
                <p id="passwordlength" class="invalid">Minimum <b>8 characters</b></p>
            </div>
            <div class="w3-center">
                <button class="w3-button" type="submit">Submit</button>
            </div>
        </div>
    </form>
</div>

<script>
var myInput = document.getElementById("password");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("passwordlength");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-zа-я]/g;
  if(myInput.value.match(lowerCaseLetters)) {
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
}

  // Validate capital letters
  var upperCaseLetters = /[A-ZА-Я]/g;
  if(myInput.value.match(upperCaseLetters)) {
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }

  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}

</script>
<!--
<script>
       // Run on page load
    window.onload = function() {

        // If sessionStorage is storing default values (ex. name), exit the function and do not restore data
        if (sessionStorage.getItem('firstname') == "Enter first name...") {
            return;
        }

        // If values are not blank, restore them to the fields
        var firstname = sessionStorage.getItem('firstname');
        if (firstname !== null) $('#firstname').val(firstname);

        var lastname = sessionStorage.getItem('lastname');
        if (lastname !== null) $('#lastname').val(lastname);

        var email = sessionStorage.getItem('email');
        if (email !== null) $('#email').val(email);

        var phone = sessionStorage.getItem('phone');
        if (phone !== null) $('#phone').val(phone);

        var city = sessionStorage.getItem('city');
        if (city!== null) $('#city').val(city);

        var street = sessionStorage.getItem('street');
        if (street!== null) $('#street').val(street);

        var postalcode = sessionStorage.getItem('postalcode');
        if (postalcode!== null) $('#postalcode').val(postalcode);
    }

    // Before refreshing the page, save the form data to sessionStorage
    window.onbeforeunload = function() {
        sessionStorage.setItem("firstname", $('#firstname').val());
        sessionStorage.setItem("lastname", $('#lastname').val());
        sessionStorage.setItem("email", $('#email').val());
        sessionStorage.setItem("phone", $('#phone').val());
        sessionStorage.setItem("city", $('#city').val());
        sessionStorage.setItem("street", $('#street').val());
        sessionStorage.setItem("postalcode", $('#postalcode').val());
    }
</script>
-->

<script src="resources/js/showPassword.js"></script>
<script src="resources/js/confirmPassword.js"></script>
<script src="resources/js/phoneValidation.js"></script>
</body>
</html>
