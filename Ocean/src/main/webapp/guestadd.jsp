<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>

<%
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM dd, yyyy");
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a");

    String currentDate = now.format(dateFormatter);
    String currentTime = now.format(timeFormatter);

    String status = request.getParameter("status");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservation Dashboard | Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/guestadd.css">
</head>
<body>

<div class="mobile-top-bar">
    <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="mobile-logo">
    <button class="hamburger-toggle" onclick="toggleSidebar()">
        <i class="fa-solid fa-bars-staggered"></i>
    </button>
</div>

<aside class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="sidebar-logo">
        <button class="close-sidebar" onclick="toggleSidebar()"><i class="fa-solid fa-xmark"></i></button>
    </div>
    
    <div class="nav-links">
    <a href="reciption.jsp" class="nav-item">
    <div class="icon-box bg-purple"><i class="fa-solid fa-gauge-high"></i></div>
    <div class="text-box">
        <span class="label-main">Dashboard</span>
        <span class="label-sub">Overview & Analytics</span>
    </div>
</a>
        <a href="guestadd.jsp" class="nav-item active">
            <div class="icon-box bg-blue"><i class="fa-solid fa-calendar-plus"></i></div>
            <div class="text-box">
                <span class="label-main">New Registration</span>
                <span class="label-sub">Register guest </span>
            </div>
        </a>
        <a href="viewGuest.jsp" class="nav-item">
            <div class="icon-box bg-cyan"><i class="fa-solid fa-list-check"></i></div>
            <div class="text-box">
                <span class="label-main">Reservations</span>
                <span class="label-sub">Manage reservations</span>
            </div>
        </a>
        <a href="viewBooking.jsp" class="nav-item ">
            <div class="icon-box bg-orange"><i class="fa-solid fa-book-bookmark"></i></div>
            <div class="text-box">
                <span class="label-main">Booking Details</span>
                <span class="label-sub">Monitor all bookings</span>
            </div>
        </a>
        <a href="billing.jsp" class="nav-item">
            <div class="icon-box bg-teal"><i class="fa-solid fa-file-invoice-dollar"></i></div>
            <div class="text-box">
                <span class="label-main">Billing</span>
                <span class="label-sub">Print invoices</span>
            </div>
        </a>
        <a href="help.jsp" class="nav-item">
            <div class="icon-box bg-info"><i class="fa-solid fa-circle-info"></i></div>
            <div class="text-box">
                <span class="label-main">Help Center</span>
                <span class="label-sub">User guides</span>
            </div>
        </a>
        
        <div class="nav-spacer"></div>
        
        <a href="home.jsp" class="nav-item exit">
            <div class="icon-box bg-danger"><i class="fa-solid fa-power-off"></i></div>
            <div class="text-box">
                <span class="label-main">Exit System</span>
                <span class="label-sub">Back to website</span>
            </div>
        </a>
    </div>
</aside>

<div class="sidebar-overlay" id="overlay" onclick="toggleSidebar()"></div>

<main class="main-content-area">
    <div class="form-card-container">
        <div class="blue-info-panel">
            <div class="info-content">
                <h1>Make a New Reservation</h1>
                <p>Enter guest details correctly to confirm the reservation at Ocean View Resort. All fields are mandatory for security purposes.</p>

                <div class="status-box-container">
                    <div class="status-box">
                        <i class="fa-regular fa-calendar-check"></i>
                        <span>Date: <%= currentDate %></span>
                    </div>
                    <div class="status-box">
                        <i class="fa-regular fa-clock"></i>
                        <span>Time: <%= currentTime %></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-main-content">
            <% if ("success".equals(status)) { %>
                <div class="alert-box success" id="successAlert">
                    <i class="fa-solid fa-circle-check"></i> 
                    <span>Reservation saved successfully!</span>
                </div>
            <% } %>

            <div class="guest-form-container">
                <h2 class="form-title">Guest Registration</h2>
                <form action="Guest" method="post">
                    <input type="hidden" name="reservationDate" value="<%= currentDate %>">
                    <input type="hidden" name="reservationTime" value="<%= currentTime %>">

                    <div class="input-wrap">
                        <label><i class="fa-solid fa-user"></i> Guest Name</label>
                        <input type="text" name="guestName" placeholder="Enter Full Name" required>
                    </div>

                    <div class="input-wrap">
                        <label><i class="fa-solid fa-envelope"></i> Email Address</label>
                        <input type="email" name="email" placeholder="john@example.com" required>
                    </div>

                    <div class="input-wrap">
                        <label><i class="fa-solid fa-id-card"></i> NIC / Passport Number</label>
                        <input type="text" name="idNumber" placeholder="ID Card No" required>
                    </div>

                    <div class="input-wrap">
                        <label><i class="fa-solid fa-location-dot"></i> Home Address</label>
                        <textarea name="address" rows="3" placeholder="Enter residential address" required></textarea>
                    </div>

                    <div class="input-wrap">
                        <label><i class="fa-solid fa-phone"></i> Mobile Number</label>
                        <input type="tel" name="contact" placeholder="07XXXXXXXX" required>
                    </div>

                    <div class="form-btns">
                        <button type="submit" class="save-btn">Confirm Booking</button>
                        <button type="reset" class="clear-btn">Clear Form</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById("sidebar");
        const overlay = document.getElementById("overlay");
        sidebar.classList.toggle("open");
        overlay.classList.toggle("show");
    }

    // Auto-hide alert
    window.onload = function() {
        const alert = document.getElementById("successAlert");
        if (alert) {
            setTimeout(function() {
                alert.style.opacity = "0";
                alert.style.transform = "translateY(-10px)";
                setTimeout(() => alert.remove(), 600);
            }, 3500); 
        }
    };
</script>

</body>
</html>