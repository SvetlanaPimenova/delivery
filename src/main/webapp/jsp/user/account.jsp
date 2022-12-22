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
        <h3><i class="fa fa-money"></i> ACCOUNT</h3>
    </div>
</header>

<div class="w3-container" style="padding:16px 16px">
    <div class="w3-center">
        <h5>Current account:  ${sessionScope.user.account}  UAH</h5><br>
        <form action="top_up" method="post">
            <label for="account">Top up your account:</label>
            <input type="number" id="account" name="account" placeholder="0"><br>
            <button class="w3-button" type="submit">Top up</button>
        </form>
    </div>
</div>


</body>
</html>