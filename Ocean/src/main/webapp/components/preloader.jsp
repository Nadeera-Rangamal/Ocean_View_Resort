<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/components/preloader.css">

<div id="preloader">
    <div class="loader-container">
        <div class="ocean-wave"></div>
        <div class="loader-text">OCEAN VIEW RESORT</div>
    </div>
</div>

<script>
    window.addEventListener("load", function() {
        const loader = document.getElementById("preloader");
        setTimeout(function() {
            loader.classList.add("loader-fade-out");
            setTimeout(function() {
                loader.style.display = "none";
            }, 500);
        }, 1500); 
    });
</script>