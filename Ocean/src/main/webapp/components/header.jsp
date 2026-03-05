<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/header.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<header class="main-header">

    <!-- Top Bar -->
    <div class="top-bar d-none d-lg-block">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="contact-info">
                <span><i class="fa fa-envelope"></i> info@oceanviewresort.lk</span>
                <span><i class="fa fa-phone"></i> +94 77 123 0000</span>
            </div>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-dark main-navbar">
        <div class="container">

            <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/home.jsp">
    <img src="${pageContext.request.contextPath}/images/logo.png" 
         alt="Ocean View Resort Logo" 
         style="height: 50px; width: auto; margin-right: 10px;">
    
</a>

            <!-- Mobile Menu Button -->
            <button class="mobile-menu-btn d-lg-none" onclick="openMenu()">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Desktop Menu -->
            <div class="d-none d-lg-block ms-auto">
                <ul class="navbar-nav flex-row">
                    <li class="nav-item"><a class="nav-link px-3" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link px-3" href="about.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link px-3" href="roompage.jsp">Rooms</a></li>
                    
                    <li class="nav-item ms-3">
                        <a class="btn btn-book" href="login.jsp">Staff Login</a>
                    </li>
                </ul>
            </div>

        </div>
    </nav>

</header>

<div class="side-menu-overlay" onclick="closeMenu()"></div>

<div class="side-menu" id="sideMenu">
    <div class="side-menu-header d-flex align-items-center justify-content-between p-3">
        <div class="side-logo">
            <img src="${pageContext.request.contextPath}/images/logo.png" 
                 alt="Ocean View Logo" 
                 style="height: 40px; width: auto;">
        </div>
        <button class="close-btn" onclick="closeMenu()">
            <i class="fas fa-times"></i>
        </button>
    </div>

    <ul class="side-menu-list">
        <li>
            <a href="home.jsp">
                <span class="nav-text">HOME</span>
                <i class="fas fa-chevron-right"></i>
            </a>
        </li>
        <li>
            <a href="about.jsp">
                <span class="nav-text">ABOUT US</span>
                <i class="fas fa-chevron-right"></i>
            </a>
        </li>
        <li>
            <a href="rooms.jsp">
                <span class="nav-text">ROOMS</span>
                <i class="fas fa-chevron-right"></i>
            </a>
        </li>
        <li>
            <a href="contact.jsp">
                <span class="nav-text">CONTACT US</span>
                <i class="fas fa-chevron-right"></i>
            </a>
        </li>
    </ul>

    <div class="side-menu-footer">
        <a href="login.jsp" class="staff-link">STAFF LOGIN</a>
    </div>
</div>

<script>
    function openMenu() {
        document.getElementById("sideMenu").classList.add("active");
        document.querySelector(".side-menu-overlay").classList.add("show");
    }

    function closeMenu() {
        document.getElementById("sideMenu").classList.remove("active");
        document.querySelector(".side-menu-overlay").classList.remove("show");
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
