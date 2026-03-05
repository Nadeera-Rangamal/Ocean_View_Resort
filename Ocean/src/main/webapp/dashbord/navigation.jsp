<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reception Dashboard | Ocean View Resort</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dashbord/navigation.css">
</head>
<body>

<%
    String currentUser = (String) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<nav class="top-nav">
    <div class="logo">
    <a href="dashboard.jsp" style="text-decoration: none; color: inherit; display: flex; align-items: center;">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Resort Logo" class="logo-img">
    </a>
</div>

    <div class="user-area" onclick="toggleProfileCard()">
        <div class="user-info">
            <span class="role">Receptionist</span>
            <span class="username"><%= (currentUser != null) ? currentUser : "User" %></span>
        </div>
        <div class="user-avatar">
            <i class="fa-solid fa-user-tie"></i>
        </div>
    </div>
</nav>

<div id="userProfileCard" class="user-modal">
    <span class="close-modal" onclick="toggleProfileCard()">&times;</span>
    <i class="fa-solid fa-circle-user fa-3x"></i>
    <h4><%= (currentUser != null) ? currentUser : "Receptionist" %></h4>
    <p>Reception Management Staff</p>
    <hr>
    <a href="LogoutServlet" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
</div>

<main class="dashboard-container">
    <section class="welcome-section">
        <div class="welcome-text">
            <h1>Welcome Back, <%= (currentUser != null) ? currentUser : "Receptionist" %>!</h1>
            <p>Easily start managing the daily operations of your Ocean View Resort from here. You can handle guest arrivals, reservations, and payments with great efficiency.</p>
        </div>
    </section>

    <div class="menu-grid">
        <a href="guestadd.jsp" class="menu-card">
            <div class="icon-box"><i class="fa-solid fa-calendar-plus"></i></div>
            <div class="card-content">
                <h3>New Registration</h3>
                <p>Register new guest </p>
            </div>
        </a>


        <a href="viewGuest.jsp" class="menu-card">
            <div class="icon-box"><i class="fa-solid fa-clipboard-list"></i></div>
            <div class="card-content">
                <h3>Reservations</h3>
                <p>Experience Luxury, Your Way</p>
            </div>
        </a>
        
        <a href="viewBooking.jsp" class="menu-card">
            <div class="icon-box" ><i class="fa-solid fa-book-bookmark"></i></div>
            <div class="card-content">
                <h3>Booking Details</h3>
                <p>Check all room bookings</p>
            </div>
        </a>

        <a href="billing.jsp" class="menu-card">
            <div class="icon-box"><i class="fa-solid fa-file-invoice-dollar"></i></div>
            <div class="card-content">
                <h3>Billing</h3>
                <p>Calculate and print invoices</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/help.jsp" class="menu-card">
            <div class="icon-box"><i class="fa-solid fa-circle-info"></i></div>
            <div class="card-content">
                <h3>Help Center</h3>
                <p>User guides and support</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/home.jsp" class="menu-card exit">
            <div class="icon-box"><i class="fa-solid fa-power-off"></i></div>
            <div class="card-content">
                <h3>Exit System</h3>
                <p>Go back to main website</p>
            </div>
        </a>
    </div>
</main>

<script>
    function toggleProfileCard() {
        var card = document.getElementById("userProfileCard");
        card.style.display = (card.style.display === "block") ? "none" : "block";
    }

    window.onclick = function(event) {
        var card = document.getElementById("userProfileCard");
        var userArea = document.querySelector(".user-area");
        if (card && userArea && !userArea.contains(event.target) && !card.contains(event.target)) {
            card.style.display = "none";
        }
    }
</script>

</body>
</html>