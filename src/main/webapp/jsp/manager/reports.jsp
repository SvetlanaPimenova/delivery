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
                <div class="w3-third w3-left">
                    <label for="searchParameter">Search by:</label>
                    <select class="w3-input w3-border" id="searchParameter" name="searchParameter">
                        <option value="" disabled selected></option>
                        <option value="sender">Sender</option>
                        <option value="city_from">City from</option>
                        <option value="city_to">City to</option>
                    </select>
                </div>
                <div class="w3-twothird w3-left">
                    <input type="text" name="search" placeholder="Search..">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="w3-container" style="padding:16px 16px">
    <c:choose>
        <c:when test="${empty requestScope.list}">
            <p class="w3-center">Nothing found.</p>
        </c:when>
        <c:otherwise>
            <a href="pdf"><i class="fa fa-file-pdf-o"></i> DOWNLOAD REPORT</a>
        </c:otherwise>
    </c:choose>
</div>


</body>
</html>