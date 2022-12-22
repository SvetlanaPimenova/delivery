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

<header class="w3-container" id="info">
    <br>
</header>

<!-- Update freight and receiver -->
<div class="w3-container" style="padding:16px 16px">
    <c:choose>
        <c:when test="${requestScope.isUpdated == false}">
            <form action="updateOrder_user" method="post">
                <input type="hidden" id="order_id" name="order_id" value="${currentOrder.id}"><br>
                <div class="w3-row-padding w3-margin-bottom">
                    <h4 class="w3-left">Shipping options</h4><br>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-third w3-margin-bottom">
                        <label>Route</label>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <label for="cityfrom">From</label>
                        <input class="w3-input w3-border" type="text" value="${currentOrder.cityFrom}" id="cityfrom"
                               name="cityfrom" disabled>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <label for="cityto">To</label>
                        <input class="w3-input w3-border" type="text" value="${currentOrder.receiver.city}" id="cityto"
                               name="cityto" required>
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-third w3-margin-bottom">
                        <label for="freighttype">Freight type</label>
                    </div>
                    <div class="w3-twothird w3-margin-bottom">
                        <select class="w3-input w3-border" id="freighttype" name="freighttype">
                            <option value="${currentOrder.freight.type}" disabled selected>${currentOrder.freight.type}</option>
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
                            <option value="${currentOrder.deliveryType}" disabled selected>${currentOrder.deliveryType}</option>
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
                        <input type="number" id="weight" name="weight" value="${currentOrder.freight.weight}" step="0.1" min="0.1"
                               max="100.0"
                               required>
                    </div>
                    <div class="w3-twothird w3-margin-bottom">
                        <div class="w3-third w3-margin-bottom">
                            <input type="number" id="length" name="length" value="${currentOrder.freight.length}" step="0.1" min="0.1"
                                   max="10000.0" required>
                        </div>
                        <div class="w3-third w3-margin-bottom">
                            <input type="number" id="width" name="width" value="${currentOrder.freight.width}" step="0.1" min="0.1"
                                   max="10000.0" required>
                        </div>
                        <div class="w3-third w3-margin-bottom">
                            <input type="number" id="height" name="height" value="${currentOrder.freight.height}" step="0.1" min="0.1"
                                   max="10000.0" required>
                        </div>
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-third w3-margin-bottom">
                        <label for="cost">Estimated cost, UAH</label>
                    </div>
                    <div class="w3-twothird w3-margin-bottom">
                        <input type="number" id="cost" name="cost" value="${currentOrder.freight.estimatedCost}">
                    </div>
                </div>
                <hr>
                <div class="w3-row-padding w3-margin-bottom">
                    <h4 class="w3-left">Receiver info</h4><br>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-half w3-margin-bottom">
                        <label for="rfname">First name:</label><br>
                        <input class="w3-input w3-border" type="text" id="rfname" name="rfname" value="${currentOrder.receiver.firstname}">
                    </div>
                    <div class="w3-half w3-margin-bottom">
                        <label for="rlname">Last name:</label><br>
                        <input class="w3-input w3-border" type="text" id="rlname" name="rlname" value="${currentOrder.receiver.lastname}">
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-half w3-margin-bottom">
                        <label for="rphone">Phone:</label><br>
                        <input class="w3-input w3-border" type="tel" name="rphone"
                               id="rphone" pattern="^\+380\d{2}\d{3}\d{2}\d{2}$" maxlength="13"
                               value="${currentOrder.receiver.phone}">
                    </div>
                    <div class="w3-half w3-margin-bottom">
                        <br>
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-half w3-margin-bottom">
                        <label for="rstreet">Street:</label><br>
                        <input class="w3-input w3-border" type="text" id="rstreet" name="rstreet"
                               value="${currentOrder.receiver.street}"><br>
                    </div>
                    <div class="w3-half w3-margin-bottom">
                        <label for="rpcode">Postal code:</label><br>
                        <input class="w3-input w3-border" type="text" id="rpcode" name="rpcode"
                               value="${currentOrder.receiver.postal_code}">
                    </div>
                </div>
                <hr>
                <div class="w3-row-padding">
                    <div class="w3-third w3-margin-bottom">
                        <label for="totalCost">Total cost:</label><br>
                        <input class="w3-input w3-border" type="number" id="totalCost" name="totalCost"
                               value="${currentOrder.totalCost}" disabled>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <label for="paymentStatus">Payment status:</label><br>
                        <input class="w3-input w3-border" type="text" id="paymentStatus" name="paymentStatus"
                               value="${currentOrder.paymentStatus}" disabled>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <label for="executionStatus">Execution status:</label><br>
                        <input class="w3-input w3-border" type="text" id="executionStatus" name="executionStatus"
                               value="${currentOrder.executionStatus}" disabled>
                    </div>
                </div>
                <div class="w3-row-padding w3-center">
                    <button class="w3-button" type="submit">Update</button>
                </div>
            </form>
            <form action="transaction" method="post">
                <div class="w3-row-padding w3-center">
                    <input type="hidden" id="orderId" name="order_id" value="${currentOrder.id}"><br>
                    <button class="w3-button" type="submit">Pay</button>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <p class="w3-center">Your shipment has been successfully modified! </p>
        </c:otherwise>
    </c:choose>
</div>


</body>
</html>