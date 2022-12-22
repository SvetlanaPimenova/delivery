<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
  display: inline;
}

.container {
  padding: 16px;
}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}


    </style>

</head>

<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="home" class="w3-bar-item w3-button w3-wide">HOME</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small" style="display: inline;">
            <a href="orders" class="w3-button w3-bar-item" style="display: inline;">MY PACKAGES</a>
            <a href="pageCreate" class="w3-button w3-bar-item" style="display: inline;">CREATE SHIPMENT</a>
            <a href="account" class="w3-button w3-bar-item" style="display: inline;">ACCOUNT ${sessionScope.user.account} UAH</a>
            <a href="profile" class="w3-bar-item w3-button"><i class="fa fa-user-circle-o"></i> PROFILE</a>
            <a href="logout" class="w3-button w3-bar-item" style="display: inline;">LOGOUT</a>
        </div>
    </div>
</div>

<!-- Header with profile info -->
<header class="w3-container" id="info">
    <div class="w3-left" style="padding-top: 58px; padding-right: 58px; padding-bottom: 0px; padding-left: 58px;">
        <h3><i class="fa fa-edit"></i> CREATE SHIPMENT</h3>
    </div>
</header>

<!-- Create order form -->
<div class="w3-container" style="padding:16px 16px">
    <c:choose>
        <c:when test="${requestScope.newOrder == null}">
            <form action="createOrder" method="post">
                <div class="w3-row-padding w3-margin-bottom">
                    <h4 class="w3-left">Shipping options</h4><br>
                </div>
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
                <hr>
                <div class="w3-row-padding w3-margin-bottom">
                    <h4 class="w3-left">Receiver info</h4><br>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-half w3-margin-bottom">
                        <label for="rfname">First name:</label><br>
                        <input class="w3-input w3-border" type="text" id="rfname" name="rfname">
                    </div>
                    <div class="w3-half w3-margin-bottom">
                        <label for="rlname">Last name:</label><br>
                        <input class="w3-input w3-border" type="text" id="rlname" name="rlname">
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-half w3-margin-bottom">
                        <label for="rphone">Phone:</label><br>
                        <input class="w3-input w3-border" type="tel" name="rphone"
                               id="rphone" pattern="^\+?38?(0\d{2}\d{3}\d{2}\d{2})$" maxlength="13">
                    </div>
                    <div class="w3-half w3-margin-bottom">
                        <br>
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-half w3-margin-bottom">
                        <label for="rstreet">Street:</label><br>
                        <input class="w3-input w3-border" type="text" id="rstreet" name="rstreet"><br>
                    </div>
                    <div class="w3-half w3-margin-bottom">
                        <label for="rpcode">Postal code:</label><br>
                        <input class="w3-input w3-border" type="text" id="rpcode" name="rpcode">
                    </div>
                </div>
                <div class="w3-row-padding w3-center">
                    <button class="w3-button" type="submit">Submit</button>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <p>Shipment has been created successfully! You can view detailed information
                <a href="orders">here</a></p>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>