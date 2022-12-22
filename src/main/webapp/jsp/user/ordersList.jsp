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
        <h3><i class="fa fa-tasks"></i> MY PACKAGES</h3>
    </div>
</header>

<!-- List of orders -->

<div class="w3-container" style="padding:16px 16px">
    <div class="w3-row-padding">
        <form action="orders" method="post">
            <div class="w3-row-padding">
                <div class="w3-half w3-margin-bottom w3-row-padding">
                    <div class="w3-third w3-margin-bottom">
                        <select class="w3-input w3-border" id="sort" name="sort" onchange="this.form.submit()">
                            <option value="" disabled selected>Sort</option>
                            <option value="cost_asc">Total cost low to high</option>
                            <option value="cost_desc">Total cost high to low</option>
                            <option value="date_asc">Old ones first</option>
                            <option value="date_desc">New ones first</option>
                            <option value="default">By default</option>
                        </select>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <select class="w3-input w3-border" id="deliveryFilter" name="deliveryFilter">
                            <option value="" disabled selected>Delivery type</option>
                            <option value="to_the_branch">TO THE BRANCH</option>
                            <option value="courier">BY COURIER</option>
                            <option value="default">ALL</option>
                        </select>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <select class="w3-input w3-border" id="freightFilter" name="freightFilter">
                            <option value="" disabled selected>Freight type</option>
                            <option value="goods">GOODS</option>
                            <option value="glass">GLASS</option>
                            <option value="compact">COMPACT</option>
                            <option value="default">ALL</option>
                        </select>
                    </div>
                </div>
                <div class="w3-half w3-margin-bottom w3-row-padding">
                    <div class="w3-third w3-margin-bottom">
                        <select class="w3-input w3-border" id="paymentFilter" name="paymentFilter">
                            <option value="" disabled selected>Payment status</option>
                            <option value="paid">PAID</option>
                            <option value="unpaid">UNPAID</option>
                            <option value="default">ALL</option>
                        </select>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <select class="w3-input w3-border" id="executionFilter" name="executionFilter">
                            <option value="" disabled selected>Execution status</option>
                            <option value="in_processing">IN PROCESSING</option>
                            <option value="formed">FORMED</option>
                            <option value="sent">SENT</option>
                            <option value="arrived_at_destination">AT DESTINATION</option>
                            <option value="delivered">DELIVERED</option>
                            <option value="default">ALL</option>
                        </select>
                    </div>
                    <div class="w3-third w3-margin-bottom">
                        <div class="w3-row-padding w3-center">
                            <button class="w3-button" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <c:choose>
        <c:when test="${empty requestScope.orders}">
            <p class="w3-center">You have not created any package recently.</p>
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
                <c:forEach var="order" items="${requestScope.orders}" varStatus="orderStatus">
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
                        <td class="w3-border-right">${order.receiver.firstname} ${order.receiver.lastname},<br>
                            ${order.receiver.phone},<br>
                            ${order.receiver.street}, ${order.receiver.postal_code}
                        </td>
                        <td class="w3-border-right">${order.paymentStatus}</td>
                        <td class="w3-border-right">${order.executionStatus}</td>
                        <td>
                            <c:set var="orderId" value="${order.id}" scope="request"/>
                            <button class="w3-button" onclick="document.getElementById('id01').style.display='block'">
                                <i class="fa fa-trash-o"></i></button>
                            <form action="update_page" method="post">
                                <input type="hidden" id="orderId" name="order_id" value="${orderId}"><br>
                                <button class="w3-button"><i class="fa fa-edit"></i></button>
                            </form>
                            <div id="id01" class="modal w3-container w3-padding-16 w3-grayscale w3-card w3-center">
                                <form class="modal-content animate" action="deleteOrder" method="post"
                                      style="border-radius: 8px;">
                                    <div class="w3-container w3-padding-16">
                                        <input type="hidden" id="order_id" name="order_id" value="${orderId}"><br>
                                        <div class="w3-row-padding">
                                            <p>Are you sure you want to delete the shipment?</p><br>
                                            <button class="w3-button" type="submit">Yes</button>
                                            <button class="w3-button" type="button"
                                                    onclick="document.getElementById('id01').style.display='none'">
                                                No
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>