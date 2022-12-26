<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html xmlns:c="http://java.sun.com/jsp/jstl/core">
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





    </style>
</head>

<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="home" class="w3-bar-item w3-button w3-wide">HOME</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small" style="display: inline;">
            <a href="packages" class="w3-button w3-bar-item" style="display: inline;">PACKAGES</a>
            <a href="reports" class="w3-button w3-bar-item" style="display: inline;">REPORTS</a>
            <a href="profile" class="w3-bar-item w3-button"><i class="fa fa-user-circle-o"></i> PROFILE</a>
            <a href="logout" class="w3-button w3-bar-item" style="display: inline;">LOGOUT</a>
        </div>
    </div>
</div>

<!-- Header with profile info -->
<header class="w3-container" id="info">
    <div class="w3-left" style="padding-top: 58px; padding-right: 58px; padding-bottom: 0px; padding-left: 58px;">
        <h3><i class="fa fa-tasks"></i> REPORTS</h3>
    </div>
</header>

<div class="w3-container" style="padding:16px 16px">
    <div class="w3-row-padding">
        <form action="reports" method="post">
            <div class="w3-row-padding">
                <div class="w3-quarter w3-left">
                    <label for="searchParameter">Search by:</label>
                </div>
            </div>
            <br>
            <div class="w3-row-padding">
                <div class="w3-third w3-left">
                    <select class="w3-input w3-border" id="searchParameter" name="searchParameter">
                        <option value="sender">Sender</option>
                        <option value="city_from">City from</option>
                        <option value="city_to">City to</option>
                        <option value="date">Date</option>
                    </select>
                </div>
                <div class="w3-third w3-left">
                    <input type="date" class="w3-input w3-border" id="calendar" name="calendar"
                           onchange="this.form.submit()">
                </div>
                <div class="w3-third w3-left"><br></div>
            </div>
            <br>
            <div class="w3-row-padding">
                <div class="w3-left">
                    <input type="text" name="search" placeholder="Search..">
                    <button class="w3-button" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>
        <p class="w3-small">*To perform a search among senders, please enter a phone number in the format
            +380XXXXXXXXX.</p>
    </div>
</div>
<hr>
<div class="w3-container" style="padding:16px 16px">
    <c:choose>
        <c:when test="${empty requestScope.list && requestScope.user == null}">
            <p class="w3-center">Nothing was found.</p>
        </c:when>
        <c:otherwise>
            <a href="pdf" class="w3-button"><i class="fa fa-file-pdf-o"></i> DOWNLOAD REPORT</a><br>
            <c:if test="${not empty requestScope.list}">
                <div class="w3-container w3-padding-16 w3-grayscale w3-card w3-center">
                    <table class="w3-table w3-centered w3-border w3-bordered w3-striped">
                        <tr>
                            <td class="w3-border-right">№</td>
                            <td class="w3-border-right">Shipment date</td>
                            <td class="w3-border-right">From</td>
                            <td class="w3-border-right">To</td>
                            <td class="w3-border-right">Freight info</td>
                            <td class="w3-border-right">Total cost, UAH</td>
                            <td class="w3-border-right">Delivery type</td>
                            <td class="w3-border-right">Sender</td>
                            <td class="w3-border-right">Receiver</td>
                            <td class="w3-border-right">Payment status</td>
                            <td class="w3-border-right">Execution status</td>
                        </tr>
                        <c:forEach var="order" items="${requestScope.list}" varStatus="orderStatus">
                            <tr>
                                <td class="w3-border-right">${orderStatus.index + 1}</td>
                                <td class="w3-border-right">${order.orderDate}</td>
                                <td class="w3-border-right">${order.cityFrom}</td>
                                <td class="w3-border-right">${order.receiver.city}</td>
                                <td class="w3-border-right">${order.freight.type}, ${order.freight.weight} kg,<br>
                                    ${order.freight.length} x ${order.freight.width} x ${order.freight.height} cm,<br>
                                    Estimated cost: ${order.freight.estimatedCost} UAH
                                </td>
                                <td class="w3-border-right">${order.totalCost}</td>
                                <td class="w3-border-right">${order.deliveryType}</td>
                                <td class="w3-border-right">${order.sender.firstname} ${order.sender.lastname},<br>
                                    ${order.sender.email},<br>
                                    ${order.sender.phone},<br>
                                    ${order.sender.city}, ${order.sender.street},<br>
                                    ${order.sender.postalCode}
                                </td>
                                <td class="w3-border-right">${order.receiver.firstname} ${order.receiver.lastname},<br>
                                    ${order.receiver.phone},<br>
                                    ${order.receiver.street}, ${order.receiver.postal_code}
                                </td>
                                <td class="w3-border-right">${order.paymentStatus}</td>
                                <td class="w3-border-right">${order.executionStatus}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
            <c:if test="${requestScope.user != null}">
                <div class="w3-container w3-padding-16 w3-grayscale w3-card w3-center">
                    <div class="w3-container">
                        <div class="w3-third">
                            <h5 class="w3-left">${user.firstname} ${user.lastname}</h5>
                        </div>
                        <div class="w3-twothird"><br></div>
                    </div>
                    <div class="w3-container w3-left">
                        <p>${user.phone}, ${user.email}</p>
                        <p>${user.city}, ${user.street}, ${user.postalCode}.</p>
                        <p>Current account: ${user.account} UAH.</p>
                    </div>
                    <c:choose>
                        <c:when test="${empty requestScope.userShipments}">
                            <p class="w3-center">User has not created any shipment yet.</p>
                        </c:when>
                        <c:otherwise>
                            <table class="w3-table w3-centered w3-border w3-bordered w3-striped">
                                <tr>
                                    <td class="w3-border-right">№</td>
                                    <td class="w3-border-right">Shipment date</td>
                                    <td class="w3-border-right">From</td>
                                    <td class="w3-border-right">To</td>
                                    <td class="w3-border-right">Freight info</td>
                                    <td class="w3-border-right">Total cost, UAH</td>
                                    <td class="w3-border-right">Delivery type</td>
                                    <td class="w3-border-right">Receiver</td>
                                    <td class="w3-border-right">Payment status</td>
                                    <td class="w3-border-right">Execution status</td>
                                </tr>
                                <c:forEach var="shipment" items="${requestScope.userShipments}" varStatus="shipmentStatus">
                                    <tr>
                                        <td class="w3-border-right">${shipmentStatus.index + 1}</td>
                                        <td class="w3-border-right">${shipment.orderDate}</td>
                                        <td class="w3-border-right">${shipment.cityFrom}</td>
                                        <td class="w3-border-right">${shipment.receiver.city}</td>
                                        <td class="w3-border-right">${shipment.freight.type}, ${shipment.freight.weight}
                                            kg,<br>
                                            ${shipment.freight.length} x ${shipment.freight.width} x
                                            ${shipment.freight.height} cm,<br>
                                            Estimated cost: ${shipment.freight.estimatedCost} UAH
                                        </td>
                                        <td class="w3-border-right">${shipment.totalCost}</td>
                                        <td class="w3-border-right">${shipment.deliveryType}</td>
                                        <td class="w3-border-right">${shipment.receiver.firstname}
                                            ${shipment.receiver.lastname},<br>
                                            ${shipment.receiver.phone},<br>
                                            ${shipment.receiver.street}, ${shipment.receiver.postal_code}
                                        </td>
                                        <td class="w3-border-right">${shipment.paymentStatus}</td>
                                        <td class="w3-border-right">${shipment.executionStatus}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>