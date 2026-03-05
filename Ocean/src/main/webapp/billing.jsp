<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, DAO.dbconnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guest Billing | Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/billing.css">

    <style>
        
        @media print {
            body * { visibility: hidden; }
            .container, .container * { visibility: visible; }
            .sidebar, .mobile-top-bar, .sidebar-overlay { display: none !important; }
            .container { position: absolute; left: 0; top: 0; width: 100%; box-shadow: none; padding: 0; border: none; }
            .btn-save, .btn-print, .btn-search, .search-section, hr, .success-msg { display: none !important; }
            input, select { border: none !important; background: transparent !important; font-weight: bold; padding: 5px 0; font-family: 'Poppins', serif; }
            label { color: #000; font-weight: bold; }
            h2 { text-decoration: underline; margin-bottom: 40px; text-align: center; }
            .main-content-area { margin: 0; padding: 0; }
        }
    </style>

    <script>
        function toggleSidebar() {
            document.getElementById("sidebar").classList.toggle("open");
            document.getElementById("overlay").classList.toggle("show");
        }

        function searchBooking() {
            const resNo = document.getElementById("reservation_no").value;
            if (resNo === "") { alert("Please enter a Reservation Number"); return; }
            window.location.href = "billing.jsp?search_id=" + resNo;
        }

        function calculateBilling() {
            const cin = document.getElementById("check_in").value;
            const cout = document.getElementById("check_out").value;
            const nightField = document.getElementById("num_nights");
            const rateField = document.getElementById("room_rate");
            const chargeField = document.getElementById("room_charges");
            const taxField = document.getElementsByName("tax")[0];
            const additionalField = document.getElementsByName("additional_charges")[0];
            const totalField = document.getElementById("total_amount");

            let nights = 0;
            if (cin && cout) {
                const start = new Date(cin);
                const end = new Date(cout);
                const diff = end - start;
                nights = Math.ceil(diff / (1000 * 60 * 60 * 24));
                nights = nights > 0 ? nights : 0;
                nightField.value = nights;
            }

            const rate = parseFloat(rateField.value) || 0;
            const roomTotal = nights * rate;
            chargeField.value = roomTotal.toFixed(2);
            const calculatedTax = roomTotal * 0.05;
            taxField.value = calculatedTax.toFixed(2);
            const additional = parseFloat(additionalField.value) || 0;
            const finalTotal = roomTotal + calculatedTax + additional;
            totalField.value = finalTotal.toFixed(2);
        }

        window.onload = calculateBilling;
        function printBill() { window.print(); }
    </script>
</head>
<body>

<%
    String searchId = request.getParameter("search_id");
    String gName = "", rNo = "", cIn = "", cOut = "";
    double roomPrice = 0.0;
    boolean isPaid = false;

    if (searchId != null && !searchId.isEmpty()) {
        try (Connection conn = dbconnection.getConnection()) {
            String checkSql = "SELECT reservation_no FROM payment_status WHERE reservation_no = ?";
            PreparedStatement psCheck = conn.prepareStatement(checkSql);
            psCheck.setString(1, searchId);
            ResultSet rsCheck = psCheck.executeQuery();
            if (rsCheck.next()) { isPaid = true; }

            String sql = "SELECT b.guest_name, b.room_no, b.check_in, b.check_out, r.price " +
                         "FROM booking b " +
                         "LEFT JOIN rooms r ON b.room_no = r.room_number " +
                         "WHERE b.reservation_no = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, searchId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                gName = rs.getString("guest_name");
                rNo = rs.getString("room_no");
                cIn = rs.getString("check_in");
                cOut = rs.getString("check_out");
                roomPrice = rs.getDouble("price");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
%>

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
        <a href="guestadd.jsp" class="nav-item">
            <div class="icon-box bg-blue"><i class="fa-solid fa-calendar-plus"></i></div>
            <div class="text-box">
                <span class="label-main">New Registration</span>
                <span class="label-sub">Register guests</span>
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
        <a href="billing.jsp" class="nav-item active">
            <div class="icon-box bg-teal"><i class="fa-solid fa-file-invoice-dollar"></i></div>
            <div class="text-box">
                <span class="label-main">Billing</span>
                <span class="label-sub">Invoices</span>
            </div>
        </a>
        <a href="help.jsp" class="nav-item">
            <div class="icon-box bg-info"><i class="fa-solid fa-circle-info"></i></div>
            <div class="text-box">
                <span class="label-main">Help Center</span>
                <span class="label-sub">Instructions</span>
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
        <div class="bill-header">
            <h2>Guest Bill / Invoice</h2>
            <p>Ocean View Resort - Management System</p>
        </div>

        <% if (isPaid) { %>
            <div class="success-msg">
                <i class="fa-solid fa-circle-check"></i> PAID & SETTLED
            </div>
        <% } %>

        <div class="search-section">
            <label><i class="fa-solid fa-magnifying-glass"></i> Search Reservation</label>
            <div class="search-box">
                <input type="text" id="reservation_no" value="<%= (searchId != null) ? searchId : "" %>" placeholder="Enter RES-ID (e.g. RES-101)">
                <button type="button" class="btn-search" onclick="searchBooking()">Search</button>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/GuestBilling" method="post" class="billing-form">
            <input type="hidden" name="reservation_no" value="<%= (searchId != null) ? searchId : "" %>">

            <div class="row">
                <div class="form-group">
                    <label>Guest Full Name</label>
                    <input type="text" name="guest_name" value="<%= gName %>" readonly>
                </div>
                <div class="form-group">
                    <label>Room Number</label>
                    <input type="text" name="room_no" value="<%= rNo %>" readonly>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label>Check-in Date</label>
                    <input type="date" name="check_in" id="check_in" value="<%= cIn %>" readonly>
                </div>
                <div class="form-group">
                    <label>Check-out Date</label>
                    <input type="date" name="check_out" id="check_out" value="<%= cOut %>" readonly>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label>Total Nights</label>
                    <input type="number" name="num_nights" id="num_nights" readonly>
                </div>
                <div class="form-group">
                    <label>Room Rate (per night)</label>
                    <input type="number" step="0.01" name="room_rate" id="room_rate" value="<%= roomPrice %>" readonly>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label>Base Room Charges</label>
                    <input type="number" step="0.01" name="room_charges" id="room_charges" readonly>
                </div>
                <div class="form-group">
                    <label>Additional Charges (Minibar/Laundry)</label>
                    <input type="number" step="0.01" name="additional_charges" value="0.00" oninput="calculateBilling()">
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label>Service Tax (5%)</label>
                    <input type="number" step="0.01" name="tax" readonly>
                </div>
                <div class="form-group">
                    <label>Total Amount Payable</label>
                    <input type="number" step="0.01" name="total_amount" id="total_amount" readonly class="total-highlight">
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label>Select Payment Method</label>
                    <select name="payment_method">
                        <option value="Cash">Cash Payment</option>
                        <option value="Card">Credit/Debit Card</option>
                        <option value="Online">Online Transfer</option>
                    </select>
                </div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn-save" <%= isPaid ? "disabled style='background-color:#cbd5e1; cursor:default;'" : "" %>>
                    <i class="fa-solid fa-floppy-disk"></i> <%= isPaid ? "Already Settled" : "Complete Payment" %>
                </button>
                <button type="button" class="btn-print" onclick="printBill()"><i class="fa-solid fa-print"></i> Print Invoice</button>
            </div>
        </form>
    </div>
</main>
</body>
</html>