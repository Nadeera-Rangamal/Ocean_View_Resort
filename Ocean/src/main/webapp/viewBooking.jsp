<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<%@ page import="DAO.BookingDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details | Ocean View Resort</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/viewBooking.css">
</head>
<body>

<div class="mobile-top-bar">
    <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="mobile-logo">
    <button class="hamburger-toggle" onclick="toggleSidebar()"><i class="fa-solid fa-bars-staggered"></i></button>
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
        <a href="guestadd.jsp" class="nav-item">
            <div class="icon-box bg-blue"><i class="fa-solid fa-calendar-plus"></i></div>
            <div class="text-box">
                <span class="label-main">New Registration</span>
                <span class="label-sub">Register guest </span>
            </div>
        </a>
        <a href="viewGuest.jsp" class="nav-item ">
            <div class="icon-box bg-cyan"><i class="fa-solid fa-list-check"></i></div>
            <div class="text-box">
                <span class="label-main">Reservations</span>
                <span class="label-sub">Manage reservations</span>
            </div>
        </a>
        
        <a href="viewBooking.jsp" class="nav-item active">
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
                <span class="label-sub">Calculate & print invoices</span>
            </div>
        </a>
        <a href="help.jsp" class="nav-item">
            <div class="icon-box bg-info"><i class="fa-solid fa-circle-info"></i></div>
            <div class="text-box">
                <span class="label-main">Help Center</span>
                <span class="label-sub">User guides & support</span>
            </div>
        </a>
        <div class="nav-spacer"></div>
        <a href="home.jsp" class="nav-item exit">
            <div class="icon-box bg-danger"><i class="fa-solid fa-power-off"></i></div>
            <div class="text-box"><span class="label-main">Exit System</span></div>
        </a>
    </div>
</aside>

<div class="sidebar-overlay" id="overlay" onclick="toggleSidebar()"></div>

<main class="main-content-area">
    <div class="container">
        <div class="header">
            <div class="header-title">
                <span class="badge-new">Reception Portal</span>
                <h2><i class="fa-solid fa-book-bookmark"></i> All Booking Details</h2>
                <p>Monitor and manage all guest reservations effectively.</p>
            </div>
        </div>

        <%-- Alerts --%>
        <% if("cancelled".equals(request.getParameter("status"))) { %>
            <div class="alert success"><i class="fa-solid fa-circle-check"></i> Booking cancelled successfully!</div>
        <% } else if("error".equals(request.getParameter("status"))) { %>
            <div class="alert danger"><i class="fa-solid fa-circle-exclamation"></i> Error occurred! Please try again.</div>
        <% } %>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Res. No</th>
                        <th>Guest Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Room</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BookingDAO dao = new BookingDAO();
                        List<Booking> bookings = dao.getAllBookings();
                        
                        if (bookings != null && !bookings.isEmpty()) {
                            for (Booking b : bookings) {
                    %>
                    <tr>
                        <td><strong><%= b.getReservationNo() %></strong></td>
                        <td><%= b.getGuestName() %></td>
                        <td><%= b.getEmail() %></td>
                        <td><%= b.getContact() %></td>
                        <td class="room-cell"><span><%= b.getRoomNo() %></span></td>
                        <td><i class="fa-regular fa-calendar-days"></i> <%= b.getCheckIn() %></td>
                        <td><i class="fa-regular fa-calendar-check"></i> <%= b.getCheckOut() %></td>
                        <td>
                            <a href="CancelBooking?id=<%= b.getReservationNo() %>" 
                               class="cancel-btn" 
                               onclick="return confirm('Are you sure you want to cancel this booking?')">
                               <i class="fa-solid fa-trash-can"></i> Cancel
                            </a>
                        </td>
                    </tr>
                    <%      } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="8" class="no-data">
                            <i class="fa-solid fa-folder-open"></i>
                            <p>No bookings found in the system.</p>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</main>

<script>
    function toggleSidebar() {
        document.getElementById("sidebar").classList.toggle("open");
        document.getElementById("overlay").classList.toggle("show");
    }
</script>

</body>
</html>