<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.dbconnection" %>

<%
    String searchNIC = request.getParameter("searchNIC");
    String status = request.getParameter("status");
    String gName = "", gEmail = "", gAddress = "", gContact = "";
    
    String reservationNo = "RES-" + (int)(Math.random() * 90000 + 10000);
    boolean detailsFound = false;
    
    if (searchNIC != null && !searchNIC.isEmpty()) {
        try (Connection conn = dbconnection.getConnection()) {
            String sql = "SELECT * FROM reservation WHERE id_number = ? LIMIT 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, searchNIC);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                gName = rs.getString("guest_name");
                gEmail = rs.getString("email");
                gAddress = rs.getString("address");
                gContact = rs.getString("contact");
                detailsFound = true;
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guest Booking | Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/viewGuest.css">
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
            <div class="icon-box bg-blue"><i class="fa-solid fa-list-check"></i></div>
            <div class="text-box"><span class="label-main">New Registration</span><span class="label-sub">Register guest </span></div>
        </a>
        <a href="#" class="nav-item active">
            <div class="icon-box bg-cyan"><i class="fa-solid fa-calendar-plus"></i></div>
            <div class="text-box"><span class="label-main">Reservations</span><span class="label-sub">Manage reservations</span></div>
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
            <div class="text-box"><span class="label-main">Billing</span><span class="label-sub">Print invoices</span></div>
        </a>
        <a href="help.jsp" class="nav-item">
            <div class="icon-box bg-info"><i class="fa-solid fa-circle-info"></i></div>
            <div class="text-box"><span class="label-main">Help Center</span><span class="label-sub">User guides</span></div>
        </a>
        <div class="nav-spacer"></div>
        <a href="home.jsp" class="nav-item exit">
            <div class="icon-box bg-danger"><i class="fa-solid fa-power-off"></i></div>
            <div class="text-box"><span class="label-main">Exit System</span><span class="label-sub">Back to website</span></div>
        </a>
    </div>
</aside>

<div class="sidebar-overlay" id="overlay" onclick="toggleSidebar()"></div>

<main class="main-content-area">
    <div class="reservation-container">
        <div class="form-header">
            <h2>Guest Reservation System</h2>
            <p>Search for existing guests or register a new booking below</p>
        </div>

        <div class="form-body">
            <% if("success".equals(status)) { %>
                <div class="alert-box alert-success"><i class="fa-solid fa-circle-check"></i> Reservation booked successfully!</div>
            <% } else if("failed".equals(status)) { %>
                <div class="alert-box alert-danger"><i class="fa-solid fa-circle-xmark"></i> Failed to book reservation. Please try again.</div>
            <% } %>

            <div class="search-section">
                <form action="" method="GET">
                    <label><i class="fa-solid fa-magnifying-glass"></i> QUICK SEARCH BY NIC / PASSPORT</label>
                    <div class="custom-input-group">
                        <input type="text" name="searchNIC" placeholder="Enter NIC number..." value="<%= (searchNIC != null) ? searchNIC : "" %>" required>
                        <button type="submit" class="search-btn">Search Details</button>
                    </div>
                </form>
            </div>

            <form action="SaveGuest" method="POST">
                <input type="hidden" name="id_number" value="<%= (searchNIC != null) ? searchNIC : "" %>">
                
                <div class="input-grid">
                    <div class="field-group col-full">
                        <label>RESERVATION NUMBER (AUTO-GENERATED)</label>
                        <input type="text" name="reservation_no" class="read-only-field" value="<%= reservationNo %>" readonly>
                    </div>

                    <div class="field-group col-full">
                        <label>FULL NAME</label>
                        <input type="text" name="guest_name" placeholder="John Doe" class="<%= detailsFound ? "auto-filled" : "" %>" value="<%= gName %>" required>
                    </div>

                    <div class="field-group">
                        <label>EMAIL ADDRESS</label>
                        <input type="email" name="email" placeholder="example@mail.com" value="<%= gEmail %>">
                    </div>

                    <div class="field-group">
                        <label>CONTACT NUMBER</label>
                        <input type="text" name="contact" placeholder="07XXXXXXXX" value="<%= gContact %>">
                    </div>

                    <div class="col-full triple-grid">
                        <div class="field-group">
                            <label>ROOM NO</label>
                            <input type="text" name="room_no" placeholder="E.g. 102" required>
                        </div>
                        <div class="field-group">
                            <label>CHECK-IN</label>
                            <input type="date" name="check_in" required>
                        </div>
                        <div class="field-group">
                            <label>CHECK-OUT</label>
                            <input type="date" name="check_out" required>
                        </div>
                    </div>

                    <div class="field-group col-full">
                        <label>RESIDENTIAL ADDRESS</label>
                        <textarea name="address" rows="3" placeholder="Enter permanent address"><%= gAddress %></textarea>
                    </div>
                </div>

                <div class="submit-area">
                    <button type="submit" class="book-btn">Confirm & Book Now</button>
                </div>
            </form>
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

    window.onload = function() {
        const alert = document.querySelector(".alert-box");
        if(alert) {
            setTimeout(() => {
                alert.style.transition = "0.6s opacity";
                alert.style.opacity = "0";
                setTimeout(() => alert.remove(), 600);
            }, 4000);
        }
    };
</script>

</body>
</html>