<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/footer.css">
<footer class="footer-wrapper footer-default bg-light-footer">

    <div class="container py-5">
        <div class="row gy-5">

            <!-- ABOUT -->
            <div class="col-12 col-md-6 col-lg-4 text-center text-md-start">
                <div class="footer-widget">
                    <div class="about-logo mb-3">
                        <a href="<%=request.getContextPath()%>/home.jsp">
                            <img src="<%=request.getContextPath()%>/images/logo.png"
                                 alt="Ocean View Resort"
                                 class="footer-logo">
                        </a>
                    </div>

                    <p class="about-text">
                        Ocean View Resort offers a peaceful seaside escape with luxury rooms,
                        stunning ocean views, and warm hospitality.
                    </p>

                    <div class="footer-social mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-whatsapp"></i></a>
                    </div>
                </div>
            </div>

            <!-- CONTACT -->
            <div class="col-12 col-md-6 col-lg-3 text-center text-md-start">
                <div class="footer-widget">
                    <h3 class="widget_title">Get In Touch</h3>
                    <ul class="footer-links list-unstyled">
                        <li>Beach Road, Sri Lanka</li>
                        <li class="mt-2">
                            <a href="tel:+94771234567">+94 77 123 0000</a>
                        </li>
                        <li>
                            <a href="mailto:info@oceanviewresort.lk">
                                info@oceanviewresort.lk
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- QUICK LINKS -->
            <div class="col-6 col-md-6 col-lg-2 text-center text-md-start">
                <div class="footer-widget">
                    <h3 class="widget_title">Quick Links</h3>
                    <ul class="footer-links list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Rooms</a></li>
                        <li><a href="#">Dining</a></li>
                        <li><a href="#">Gallery</a></li>
                    </ul>
                </div>
            </div>

            <!-- SERVICES -->
            <div class="col-6 col-md-6 col-lg-3 text-center text-md-start">
                <div class="footer-widget">
                    <h3 class="widget_title">Our Services</h3>
                    <ul class="footer-links list-unstyled">
                        <li><a href="#">Luxury Rooms</a></li>
                        <li><a href="#">Ocean View Restaurant</a></li>
                        <li><a href="#">Swimming Pool</a></li>
                        <li><a href="#">Spa & Wellness</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

    <!-- COPYRIGHT -->
    <div class="copyright-wrap border-top py-3">
        <div class="container">
            <div class="row gy-2 text-center text-lg-start">
                <div class="col-lg-8">
                    <p class="mb-0">
                        © 2026 Ocean View Resort. All Rights Reserved.
                    </p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a href="#" class="need-help-link">Need Help?</a>
                </div>
            </div>
        </div>
    </div>

</footer>
