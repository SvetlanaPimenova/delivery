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

/* Full height image header */
.bgimg-1 {
  background-position: center;
  background-size: cover;
  background-image: url("resources/img/Capture.jpg");
  min-height: 100%;
}

.w3-bar .w3-button {
  padding: 16px;
}

.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  width: 50%; /* Could be more or less, depending on screen size */
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
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
        <a href="#home" class="w3-bar-item w3-button w3-wide">HOME</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <a href="#about" class="w3-bar-item w3-button">ABOUT</a>
            <a href="#pricing" class="w3-bar-item w3-button"><i class="fa fa-usd"></i> PRICING</a>
            <a href="#calculator" class="w3-bar-item w3-button"><i class="fa fa-calculator"></i> CALCULATOR</a>
            <a href="#contact" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <a href="profile" class="w3-button w3-bar-item"><i class="fa fa-user-circle-o"></i> PROFILE</a>
                </c:when>
                <c:otherwise>
                    <button class="w3-button w3-bar-item"
                            onclick="document.getElementById('id01').style.display='block'">
                        LOGIN
                    </button>
                    <a href="signup_page" class="w3-bar-item w3-button">SIGN-UP</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
    <div class="w3-display-left w3-text-white" style="padding:42px">
        <span class="w3-xxlarge">Integrated Logistic Services</span><br>
        <p><a href="#calculator"
              class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off">Calculate
            shipping cost now</a></p>
    </div>
</header>

<!-- Login window -->
<div id="id01" class="modal w3-container w3-padding-16 w3-grayscale w3-card w3-center">
    <form class="modal-content animate" action="login" method="post" style="border-radius: 8px;">
        <div class="w3-container w3-padding-16">
            <div class="w3-row-padding">
                <button class="w3-button w3-large w3-right w3-opacity-max"
                        onclick="this.form.reset(); document.getElementById('id01').style.display='none'"><i
                        class="fa fa-close"></i>
                </button>
            </div>
            <div class="w3-row-padding">
                <label for="emaillogin" class="w3-left">E-mail</label>
            </div>
            <div class="w3-row-padding">
                <input class="w3-input w3-border" type="email" placeholder="Enter e-mail" id="emaillogin"
                       name="emaillogin" required>
            </div>
            <div class="w3-row-padding">
                <br>
            </div>
            <div class="w3-row-padding">
                <label for="passlogin" class="w3-left">Password</label>
            </div>
            <div class="w3-row-padding">
                <input class="w3-input w3-border" type="password" placeholder="Enter password" id="passlogin"
                       name="passlogin" required>
            </div>
            <div class="w3-row-padding">
                <br>
            </div>
            <div class="w3-row-padding w3-left">
                <input type="checkbox" onclick="myFunction()"> Show Password
            </div>
            <div class="w3-row-padding">
                <br>
            </div>
            <div class="w3-row-padding clearfix">
                <button class="w3-button" type="submit">Login</button>
                <button class="w3-button" type="button"
                        onclick="this.form.reset(); document.getElementById('id01').style.display='none'">
                    Cancel
                </button>
            </div>
        </div>
    </form>
</div>

<!-- About Section -->
<div class="w3-container" style="padding:128px 16px" id="about">
    <h3 class="w3-center">ABOUT THE COMPANY</h3>
    <p class="w3-center w3-large">Key features of our company</p>
    <div class="w3-row-padding w3-center" style="margin-top:64px">
        <div class="w3-quarter">
            <i class="fa fa-compass w3-margin-bottom w3-jumbo w3-center"></i>
            <p class="w3-large">Worldwide Shipping</p>
            <p>Cargo Delivery Service provides international express delivery services to more than 200 countries and
                territories</p>
        </div>
        <div class="w3-quarter">
            <i class="fa fa-cubes w3-margin-bottom w3-jumbo"></i>
            <p class="w3-large">Cargo Integrity</p>
            <p>We take care of the proper packaging of goods using appropriate materials that will ensure their
                integrity throughout transportation</p>
        </div>
        <div class="w3-quarter">
            <i class="fa fa-hourglass-o w3-margin-bottom w3-jumbo"></i>
            <p class="w3-large">Quickness</p>
            <p>Cargo Delivery Service is constantly introducing the latest technologies to reduce delivery terms</p>
        </div>
        <div class="w3-quarter">
            <i class="fa fa-cog w3-margin-bottom w3-jumbo"></i>
            <p class="w3-large">Support</p>
            <p>Registered users are provided with an additional service - registration of a package online</p>
        </div>
    </div>
</div>

<!-- Pricing Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px" id="pricing">
    <h3 class="w3-center">PRICING</h3>
    <p class="w3-center w3-large">Shipping rates</p>
    <div class="w3-half">
        <table class="w3-table w3-centered w3-border w3-bordered">
            <tr>
                <td class="w3-large">Weight up to, kg</td>
                <td class="w3-large">Fare, UAH</td>
            </tr>
            <tr>
                <td>0.5</td>
                <td>35</td>
            </tr>
            <tr>
                <td>1</td>
                <td>37</td>
            </tr>
            <tr>
                <td>2</td>
                <td>40</td>
            </tr>
            <tr>
                <td>5</td>
                <td>50</td>
            </tr>
        </table>
    </div>
    <div class="w3-half">
        <table class="w3-table w3-centered w3-border w3-bordered">
            <tr>
                <td class="w3-large">Weight up to, kg</td>
                <td class="w3-large">Fare, UAH</td>
            </tr>
            <tr>
                <td>10</td>
                <td>60</td>
            </tr>
            <tr>
                <td>20</td>
                <td>70</td>
            </tr>
            <tr>
                <td>30</td>
                <td>80</td>
            </tr>
            <tr>
                <td>40</td>
                <td>100</td>
            </tr>
        </table>
    </div>
</div>

<!-- Calculator Section -->
<div class="w3-container" style="padding:128px 16px" id="calculator">
    <h3 class="w3-center">CALCULATOR</h3>
    <p class="w3-center w3-large">Calculate shipping cost</p>
    <div class="w3-container w3-padding-16 w3-grayscale w3-card w3-center">
        <c:choose>
            <c:when test="${result == null}">
                <form action="calculate" method="post">
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <label>Route</label>
                        </div>
                        <div class="w3-third w3-margin-bottom">
                            <label for="cityfrom">From</label>
                            <input class="w3-input w3-border" list="citiesfrom" placeholder="Locality" id="cityfrom"
                                   name="cityfrom" required>
                            <datalist id="citiesfrom">
                                <option value="Vinnytsia">
                                <option value="Dnipro">
                                <option value="Zaporizhzhia">
                                <option value="Kyiv">
                                <option value="Kryvyi Rih">
                                <option value="Lviv">
                                <option value="Mykolayiv">
                                <option value="Odesa">
                                <option value="Poltava">
                                <option value="Kharkiv">
                            </datalist>
                        </div>
                        <div class="w3-third w3-margin-bottom">
                            <label for="cityto">To</label>
                            <input class="w3-input w3-border" list="citiesto" placeholder="Locality" id="cityto"
                                   name="cityto"
                                   required>
                            <datalist id="citiesto">
                                <option value="Vinnytsia">
                                <option value="Dnipro">
                                <option value="Zaporizhzhia">
                                <option value="Kyiv">
                                <option value="Kryvyi Rih">
                                <option value="Lviv">
                                <option value="Mykolayiv">
                                <option value="Odesa">
                                <option value="Poltava">
                                <option value="Kharkiv">
                            </datalist>
                        </div>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <br>
                        </div>
                        <div class="w3-twothird w3-margin-bottom">
                            <p class="w3-small w3-left-align">*Enter the city you will be shipping from and the city
                                where your
                                shipment should arrive</p>
                        </div>
                    </div>
                    <br>
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <label for="freighttype">Freight type</label>
                        </div>
                        <div class="w3-twothird w3-margin-bottom">
                            <select class="w3-input w3-border" id="freighttype" name="freighttype">
                                <option value="goods">GOODS</option>
                                <option value="glass">GLASS</option>
                                <option value="compact">DOCUMENTS</option>
                            </select>
                        </div>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <label for="deliverytype">Delivery type</label>
                        </div>
                        <div class="w3-twothird w3-margin-bottom">
                            <select class="w3-input w3-border" id="deliverytype" name="deliverytype">
                                <option value="to_the_branch">TO THE BRANCH</option>
                                <option value="courier">BY COURIER</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <label for="weight">Weight, kg</label>
                        </div>
                        <div class="w3-twothird w3-margin-bottom">
                            <div class="w3-third w3-margin-bottom">
                                <label for="length">Length, cm</label>
                            </div>
                            <div class="w3-third w3-margin-bottom">
                                <label for="width">Width, cm</label>
                            </div>
                            <div class="w3-third w3-margin-bottom">
                                <label for="height">Height, cm</label>
                            </div>
                        </div>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <input type="number" id="weight" name="weight" placeholder="0.0" step="0.1" min="0.1"
                                   max="100.0"
                                   required>
                        </div>
                        <div class="w3-twothird w3-margin-bottom">
                            <div class="w3-third w3-margin-bottom">
                                <input type="number" id="length" name="length" placeholder="0.0" step="0.1" min="0.1"
                                       max="10000.0" required>
                            </div>
                            <div class="w3-third w3-margin-bottom">
                                <input type="number" id="width" name="width" placeholder="0.0" step="0.1" min="0.1"
                                       max="10000.0" required>
                            </div>
                            <div class="w3-third w3-margin-bottom">
                                <input type="number" id="height" name="height" placeholder="0.0" step="0.1" min="0.1"
                                       max="10000.0" required>
                            </div>
                        </div>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-third w3-margin-bottom">
                            <label for="cost">Estimated cost, UAH</label>
                        </div>
                        <div class="w3-twothird w3-margin-bottom">
                            <input type="number" id="cost" name="cost" placeholder="0.0">
                        </div>
                    </div>
                    <div class="w3-row-padding">
                        <button class="w3-button" type="submit">Calculate</button>
                        <button class="w3-button" type="reset">Reset</button>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <div class="w3-container w3-padding-16 w3-center">
                    <div class="w3-half w3-left">
                        <p>From: ${param.cityfrom}</p>
                        <p>To: ${param.cityto}</p>
                        <p>Freight Type: ${param.freighttype}</p>
                        <p>Delivery Type: ${param.deliverytype}</p>
                    </div>
                    <div class="w3-half w3-left">
                        <p>Weight: ${param.weight} kg</p>
                        <p>Length: ${param.length} cm</p>
                        <p>Width: ${param.width} cm</p>
                        <p>Height: ${param.height} cm</p>
                    </div>
                </div>
                <div class="w3-container w3-left">
                    <p class="w3-large" style="line-height: 0.5;"> Estimated cost of delivery: ${requestScope.result}
                        UAH</p>
                    <p class="w3-small w3-left" style="line-height: 0.5;"> * including VAT.</p>
                    <br>
                    <p class="w3-small w3-left"> ** the final cost of transportation may differ from the calculated
                        one.</p>
                </div>
                <div class="w3-container w3-padding-16 w3-center">
                    <button class="w3-button" onclick="document.getElementById('id02').style.display='block'">
                        CREATE SHIPMENT
                    </button>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>


<!-- Contact Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px" id="contact">
    <h3 class="w3-center">CONTACT</h3>
    <p class="w3-center w3-large">Lets get in touch. Send us a message:</p>
    <div style="margin-top:48px">
        <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i> Kyiv, Ukraine</p>
        <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> Phone: +38 (098) 000-00-00</p>
        <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: mail@mail.com</p>
    </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
</footer>


<script>

 // Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<script src="./resources/js/showPassword.js"></script>
<script src="./resources/js/confirmPassword.js"></script>
<script src="./resources/js/phoneValidation.js"></script>
</body>
</html>
