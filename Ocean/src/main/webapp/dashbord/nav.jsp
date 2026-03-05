<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reception Dashboard | Ocean View Resort</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dashbord/nav.css">
</head>
<body>

<!-- ===== SIDE NAVIGATION ===== -->
<div class="side-nav">
    <div class="logo-container">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="logo-img">
        <span class="nav-brand">Ocean View Resort</span>
    </div>

    <ul class="side-menu">
        <li><a href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
        <li><a href="guestadd.jsp"><i class="fa-solid fa-calendar-plus"></i> Add Reservation</a></li>
        <li><a href="viewReservation.jsp"><i class="fa-solid fa-clipboard-list"></i> View Reservation</a></li>
        <li><a href="bill.jsp"><i class="fa-solid fa-file-invoice-dollar"></i> Calculate Bill</a></li>
        <li><a href="help.jsp"><i class="fa-solid fa-circle-info"></i> Help</a></li>
        <li class="exit"><a href="${pageContext.request.contextPath}/home.jsp"><i class="fa-solid fa-power-off"></i> Exit System</a></li>
    </ul>
</div>

<!-- ===== MAIN CONTENT ===== -->
<div class="main-content">
    <h2>Reception Dashboard</h2>
    <p class="subtitle">Manage reservations, guests & billing efficiently</p>
    <!-- You can add dashboard widgets/cards here -->
</div>

</body>
</html>
