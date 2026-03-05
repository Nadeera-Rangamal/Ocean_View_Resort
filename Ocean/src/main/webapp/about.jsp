<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Our Sanctuary | Ocean View</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome (UPDATED) -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- About CSS (IMPORTANT FIX) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/about.css">
</head>
<body>

<%@ include file="components/header.jsp" %>

<!-- Header -->
<section class="about-header-simple py-5">
    <div class="container text-center">
        <span class="top-label">Luxury Redefined</span>
        <h1 class="main-title">Our Story & Philosophy</h1>
        <div class="title-line"></div>
    </div>
</section>

<!-- Intro -->
<section class="intro-section py-3">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-7">
                <div class="image-wrapper">
                    <img src="${pageContext.request.contextPath}/images/about2.jpg"
                         alt="Experience"
                         class="img-fluid shadow-lg">
                </div>
            </div>
            <div class="col-lg-5">
                <div class="content-text">
                    <h2 class="section-heading">
                        A Sanctuary Built on <br>Passion & Heritage
                    </h2>
                    <p class="mt-4">
                        Nestled along the golden sands of Sri Lanka, Ocean View Resort isn't just a
                        destination it's a tribute to the island's natural beauty.
                    </p>
                    <p>
                        Every corner of our resort is designed to connect you with the ocean,
                        offering a tranquil escape from the modern world.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- WHY OCEAN VIEW -->
<section class="ocean-why-section">
    <div class="container">
        <div class="row g-4 justify-content-center">

            <div class="col-lg-4 col-md-6">
                <div class="ocean-card text-center">
                    <div class="icon-box">
                        <i class="fa-solid fa-water"></i>
                    </div>
                    <h4>Our Philosophy</h4>
                    <p>
                        We embrace nature led luxury, blending comfort and serenity with the
                        timeless beauty of the sea.
                    </p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="ocean-card text-center">
                    <div class="icon-box">
                        <i class="fa-solid fa-eye"></i>
                    </div>
                    <h4>Our Vision</h4>
                    <p>
                        To be Sri Lanka’s most inspiring seaside sanctuary, where memories are
                        crafted by the ocean.
                    </p>
                </div>
            </div>

            <div class="col-lg-4 col-md-12">
                <div class="ocean-card highlight text-center">
                    <span class="experience">15+ Years</span>
                    <h3>Seaside Hospitality</h3>
                    <p>
                        Over a decade of refined hospitality, personalized service, and breathtaking
                        coastal experiences.
                    </p>
                    <a href="${pageContext.request.contextPath}/contact" class="ocean-btn">
                        Book Your Escape
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>

<%@ include file="components/footer.jsp" %>

</body>
</html>
