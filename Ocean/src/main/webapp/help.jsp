<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help Guide | Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/help.css">
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
        <a href="viewGuest.jsp" class="nav-item">
            <div class="icon-box bg-cyan"><i class="fa-solid fa-list-check"></i></div>
            <div class="text-box">
                <span class="label-main">Reservations</span>
                <span class="label-sub">Manage reservations</span>
            </div>
        </a>
        <a href="viewBooking.jsp" class="nav-item">
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
        <a href="help.jsp" class="nav-item active">
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
    <div class="help-container">
        
        <div class="help-header">
            <span class="badge-new">Receptionist Training Portal</span>
            <h1>Operational Excellence Guide</h1>
            <p>Master the Ocean View Management System with this step-by-step visual manual.</p>
        </div>

        <section class="guide-section">
            <h2 class="section-title"><i class="fa-solid fa-route"></i> Core Operational Flow</h2>
            <div class="workflow-steps">
                <div class="w-step">
                    <div class="w-icon">1</div>
                    <span class="w-text">Guest Reg.</span>
                </div>
                <div class="w-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="w-step">
                    <div class="w-icon">2</div>
                    <span class="w-text">Room Booking</span>
                </div>
                <div class="w-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="w-step">
                    <div class="w-icon">3</div>
                    <span class="w-text">Management</span>
                </div>
                <div class="w-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="w-step">
                    <div class="w-icon">4</div>
                    <span class="w-text">Settlement</span>
                </div>
            </div>
        </section>

        <section class="guide-section mt-50">
            <h2 class="section-title"><i class="fa-solid fa-layer-group"></i> Module Explanations</h2>
            
            <div class="guide-list">
                <div class="guide-visual-card">
                    <div class="visual-content">
                        <div class="info-tag cyan">Step 01: Initial Entry</div>
                        <h3>Guest Registration</h3>
                        <p>Before making a booking, every guest must be registered in the system database. This creates a unique Guest Profile.</p>
                        <ul class="feature-list">
                            <li><i class="fa-solid fa-check"></i> Collect <strong>Full Name</strong> and <strong>NIC/Passport</strong>.</li>
                            <li><i class="fa-solid fa-check"></i> Assign a unique Guest ID for future reference.</li>
                        </ul>
                    </div>
                    <div class="visual-img">
                        <img src="${pageContext.request.contextPath}/images/register.png" alt="Guest Registration" onerror="this.src='https://placehold.co/400x250?text=Guest+Registration+UI'">
                    </div>
                </div>

                <div class="guide-visual-card reversed">
                    <div class="visual-img">
                        <img src="${pageContext.request.contextPath}/images/res.png" alt="Registration Form" onerror="this.src='https://placehold.co/400x250?text=Booking+UI'">
                    </div>
                    <div class="visual-content">
                        <div class="info-tag blue">Step 02: Onboarding</div>
                        <h3>New Reservation Module</h3>
                        <p>Once a guest is registered, use this module to assign them a room and specify their stay duration.</p>
                        <ul class="feature-list">
                            <li><i class="fa-solid fa-check"></i> firstly search guest in nic number or passport number.</li>
                            <li><i class="fa-solid fa-check"></i> Specify <strong>Check-in</strong> and <strong>Check-out</strong> dates.</li>
                        </ul>
                    </div>
                </div>

                <div class="guide-visual-card">
                    <div class="visual-content">
                        <div class="info-tag orange">Step 03: Management</div>
                        <h3>Booking Details Module</h3>
                        <p>Keep track of all active reservations. You can view, search, and manage ongoing bookings here.</p>
                        <ul class="feature-list">
                            <li><i class="fa-solid fa-eye"></i> View <strong>Check-in/Check-out</strong> dates at a glance.</li>
                            <li><i class="fa-solid fa-trash-can"></i> <strong>Cancel Bookings:</strong> Safely remove cancelled stays.</li>
                        </ul>
                    </div>
                    <div class="visual-img">
                        <img src="${pageContext.request.contextPath}/images/details.png" alt="Booking Records" onerror="this.src='https://placehold.co/400x250?text=Booking+Records+UI'">
                    </div>
                </div>

                <div class="guide-visual-card reversed">
                    <div class="visual-img">
                        <img src="${pageContext.request.contextPath}/images/room.png" alt="Dashboard Status" onerror="this.src='https://placehold.co/400x250?text=Room+Grid+UI'">
                    </div>
                    <div class="visual-content">
                        <div class="info-tag purple">Dashboard Monitoring</div>
                        <h3>Live Room Status</h3>
                        <p>Track real-time occupancy. This prevents overbooking and shows which rooms need cleaning.</p>
                        <ul class="feature-list">
                            <li><i class="fa-solid fa-door-open text-success"></i> <strong>Available:</strong> Ready for new check-ins.</li>
                            <li><i class="fa-solid fa-door-closed text-danger"></i> <strong>Booked:</strong> Currently occupied.</li>
                        </ul>
                    </div>
                </div>

                <div class="guide-visual-card">
                    <div class="visual-content">
                        <div class="info-tag teal">Step 04: Settlement</div>
                        <h3>Billing & Invoicing</h3>
                        <p>Finalize the stay by generating the guest's invoice. <strong>Search is performed via Booking ID.</strong></p>
                        <ul class="feature-list">
                            <li><i class="fa-solid fa-receipt"></i> Search by <strong>Reservation ID</strong>.</li>
                            <li><i class="fa-solid fa-print"></i> Calculate taxes and print professional receipts.</li>
                        </ul>
                    </div>
                    <div class="visual-img">
                        <img src="${pageContext.request.contextPath}/images/billing.png" alt="Billing ID Search" onerror="this.src='https://placehold.co/400x250?text=Reservation+ID+UI'">
                    </div>
                </div>
            </div>
        </section>

        <section class="guide-section mt-50">
            <div class="exit-card-modern">
                <div class="exit-visual">
                    <div class="exit-glow"></div>
                    <i class="fa-solid fa-power-off"></i>
                </div>
                <div class="exit-info">
                    <h2>End of Shift?</h2>
                    <p>Ensure all pending invoices are saved. Always log out to protect the resort's data security and guest privacy.</p>
                    <div class="exit-meta">
                        <span><i class="fa-solid fa-lock"></i> Encryption Active</span>
                        <span><i class="fa-solid fa-user-shield"></i> Reception Desk #01</span>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="exit-button-premium">
                    <span>Exit System</span>
                    <i class="fa-solid fa-right-from-bracket"></i>
                </a>
            </div>
        </section>

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