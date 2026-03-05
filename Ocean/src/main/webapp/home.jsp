<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ocean View Resort</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<!-- Home CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/home.css">


</head>
<body>
<%@ include file="components/preloader.jsp" %>

<!-- ===== Header ===== -->
<%@ include file="components/header.jsp" %>

<!-- ===== HERO SLIDER ===== -->
<section class="hero-slider">

<div id="heroCarousel"
     class="carousel slide carousel-fade"
     data-bs-ride="carousel"
     data-bs-interval="3000"
     data-bs-pause="false">

    <div class="carousel-inner">

        <div class="carousel-item active hero-slide-1">
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <h1>Experience Luxury<br><span>By The Ocean</span></h1>
                <p>Wake up to breathtaking sea views</p>
                <a href="hero1.jsp" class="btn btn-hero">Explore Rooms</a>
            </div>
        </div>

        <div class="carousel-item hero-slide-2">
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <h1>Your Perfect<br><span>Beach Getaway</span></h1>
                <p>Relax, unwind & enjoy</p>
                <a href="hero2.jsp" class="btn btn-hero">Contact Us</a>
            </div>
        </div>

        <div class="carousel-item hero-slide-3">
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <h1>Moments Made<br><span>Unforgettable</span></h1>
                <p>Luxury rooms & service</p>
                <a href="hero3.jsp" class="btn btn-hero">View Rooms</a>
            </div>
        </div>

    </div>
</div>

</section>

<section class="about-section py-2 position-relative overflow-hidden">
    <div class="bg-shape"></div>

    <div class="container py-lg-5">
        <div class="row align-items-center gy-5">
            
            <div class="col-lg-6">
                <div class="about-img-combined">
                    <div class="main-img">
                        <img src="${pageContext.request.contextPath}/images/ocean.jpg" alt="Resort Exterior" class="img-fluid shadow-lg">
                    </div>
                    <div class="sub-img">
                        <img src="${pageContext.request.contextPath}/images/ocean1.jpg" alt="Luxury Room" class="img-fluid shadow-lg">
                    </div>
                    <div class="experience-card">
                        <div class="exp-content">
                            <h3>15+</h3>
                            <p>Years of <br>Excellence</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 ps-lg-5">
                <div class="about-content">
                    <div class="section-tag">
                        <span class="line"></span>
                        <span class="tag-text">SINCE 2010</span>
                    </div>
                    <h2 class="display-5 fw-bold text-navy mb-4">A World of <span class="text-cyan">Elegance</span> & Serenity</h2>
                    <p class="lead text-muted mb-4">
                        Discover a coastal retreat where luxury meets the horizon. We offer a bespoke experience tailored to your every desire.
                    </p>

                    <div class="feature-grid">
                        <div class="feature-item">
                            <div class="icon-box"><i class="fas fa-swimming-pool"></i></div>
                            <h5>Infinity Pools</h5>
                        </div>
                        <div class="feature-item">
                            <div class="icon-box"><i class="fas fa-spa"></i></div>
                            <h5>Wellness Spa</h5>
                        </div>
                        <div class="feature-item">
                            <div class="icon-box"><i class="fas fa-cocktail"></i></div>
                            <h5>Beach Bar</h5>
                        </div>
                        <div class="feature-item">
                            <div class="icon-box"><i class="fas fa-wifi"></i></div>
                            <h5>Free Wi-Fi</h5>
                        </div>
                    </div>

                    <div class="about-footer-info d-flex align-items-center mt-5">
                        <a href="about.jsp" class="btn btn-luxury-dark me-4">Discover More</a>
                        <div class="contact-info-small">
                            <span class="d-block text-muted">Call for Booking:</span>
                            <strong class="text-navy">+94 77 123 0000</strong>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="overflow-hidden py-3" id="service-sec" style="margin-top: 40px; background-color: var(--soft-bg);">
    <div class="container th-container2">
        <div class="row justify-content-between align-items-end mb-5">
            <div class="col-xxl-6 col-lg-8">
                <div class="title-area mb-lg-0">
                    <span class="section-tag">
                        <span class="line"></span>
                        <span class="tag-text">OUR EXCLUSIVE SERVICES</span>
                    </span>
                    <h2 class="display-6 fw-bold text-navy mt-2">World-Class Amenities for Your <span class="text-cyan">Perfect Stay</span></h2>
                </div>
            </div>
            <div class="col-auto">
                <div class="sec-btn">
                    <a href="/services" class="btn-luxury-dark">View All Experiences</a>
                </div>
            </div>
        </div>

        <div class="row gy-4">
    <div class="col-xl-3 col-md-6">
        <div class="property-card8 h-100 shadow-sm bg-white rounded-20 overflow-hidden">
            <div class="property-card-thumb img-shine">
                <img src="${pageContext.request.contextPath}/images/luxury.jpg" alt="Luxury Rooms" class="w-100" style="height: 250px; object-fit: cover;">
            </div>
            <div class="property-card-details p-4 text-center">
                <div class="box-icon mb-3">
                    <i class="fas fa-bed fa-2x text-cyan"></i>
                </div>
                <h4 class="property-card-title h5 fw-bold">
                    <a href="/luxury-rooms" class="text-navy text-decoration-none">Luxury Accommodation</a>
                </h4>
                <p class="property-card-text small text-muted">Ocean-facing suites and private villas designed with sustainable elegance.</p>
                <div class="btn-wrap mt-3">
                    <a href="/luxury-rooms" class="text-cyan fw-bold text-decoration-none small">Explore Suites <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="property-card8 h-100 shadow-sm bg-white rounded-20 overflow-hidden">
            <div class="property-card-thumb img-shine">
                <img src="${pageContext.request.contextPath}/images/dining.jpg" alt="Fine Dining" class="w-100" style="height: 250px; object-fit: cover;">
            </div>
            <div class="property-card-details p-4 text-center">
                <div class="box-icon mb-3">
                    <i class="fas fa-utensils fa-2x text-cyan"></i>
                </div>
                <h4 class="property-card-title h5 fw-bold">
                    <a href="/fine-dining" class="text-navy text-decoration-none">Beachside Dining</a>
                </h4>
                <p class="property-card-text small text-muted">Savor fresh seafood and international cuisines prepared by world-class chefs.</p>
                <div class="btn-wrap mt-3">
                    <a href="/fine-dining" class="text-cyan fw-bold text-decoration-none small">View Menu <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="property-card8 h-100 shadow-sm bg-white rounded-20 overflow-hidden">
            <div class="property-card-thumb img-shine">
                <img src="${pageContext.request.contextPath}/images/wellness.jpg" alt="Wellness Spa" class="w-100" style="height: 250px; object-fit: cover;">
            </div>
            <div class="property-card-details p-4 text-center">
                <div class="box-icon mb-3">
                    <i class="fas fa-spa fa-2x text-cyan"></i>
                </div>
                <h4 class="property-card-title h5 fw-bold">
                    <a href="/wellness-spa" class="text-navy text-decoration-none">Wellness & Spa</a>
                </h4>
                <p class="property-card-text small text-muted">Traditional Ayurvedic treatments to rejuvenate your mind, body, and soul.</p>
                <div class="btn-wrap mt-3">
                    <a href="/wellness-spa" class="text-cyan fw-bold text-decoration-none small">Book Treatment <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="property-card8 h-100 shadow-sm bg-white rounded-20 overflow-hidden">
            <div class="property-card-thumb img-shine">
                <img src="${pageContext.request.contextPath}/images/island.jpg" alt="Island Excursions" class="w-100" style="height: 250px; object-fit: cover;">
            </div>
            <div class="property-card-details p-4 text-center">
                <div class="box-icon mb-3">
                    <i class="fas fa-shuttle-van fa-2x text-cyan"></i>
                </div>
                <h4 class="property-card-title h5 fw-bold">
                    <a href="/excursions" class="text-navy text-decoration-none">Island Excursions</a>
                </h4>
                <p class="property-card-text small text-muted">Curated tours to discover local culture, whale watching, and hidden gems.</p>
                <div class="btn-wrap mt-3">
                    <a href="/excursions" class="text-cyan fw-bold text-decoration-none small">See Adventures <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>
</section>

<section class="jarallax" style="padding: 120px 0; position: relative; background-image: url('/images/resort-bg.jpg'); background-attachment: fixed; background-size: cover; background-position: center;">
    
    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(11, 60, 93, 0.7);"></div>

    <div class="container position-relative">
        <div class="row gy-40 justify-content-between">
            
            <div class="col-6 col-lg-3">
                <div class="stat-box text-center">
                    <div class="stat-icon mb-3">
                        <i class="fas fa-umbrella-beach fa-3x text-gold"></i>
                    </div>
                    <h2 class="counter-number text-white fw-bold">25+</h2>
                    <p class="stat-title text-light-50">Private Beach Spots</p>
                </div>
            </div>

            <div class="col-6 col-lg-3">
                <div class="stat-box text-center">
                    <div class="stat-icon mb-3">
                        <i class="fas fa-users fa-3x text-gold"></i>
                    </div>
                    <h2 class="counter-number text-white fw-bold">15k</h2>
                    <p class="stat-title text-light-50">Happy Travelers</p>
                </div>
            </div>

            <div class="col-6 col-lg-3">
                <div class="stat-box text-center">
                    <div class="stat-icon mb-3">
                        <i class="fas fa-cocktail fa-3x text-gold"></i>
                    </div>
                    <h2 class="counter-number text-white fw-bold">100%</h2>
                    <p class="stat-title text-light-50">Natural Refreshments</p>
                </div>
            </div>

            <div class="col-6 col-lg-3">
                <div class="stat-box text-center">
                    <div class="stat-icon mb-3">
                        <i class="fas fa-award fa-3x text-gold"></i>
                    </div>
                    <h2 class="counter-number text-white fw-bold">05</h2>
                    <p class="stat-title text-light-50">Luxury Awards</p>
                </div>
            </div>

        </div>

        <div class="row mt-5">
            <div class="col-12 text-center">
                <div class="video-play-btn-wrap">
                    <a href="#" class="play-btn popup-video shadow-lg">
                        <i class="fas fa-play"></i>
                    </a>
                    <h5 class="text-white mt-4 fw-light italic">Watch Our Virtual Tour</h5>
                </div>
            </div>
        </div>
    </div>
</section>  



<!-- ===== Footer ===== -->
<%@ include file="components/footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
