<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.RoomDAO, models.AddRoomServlet, java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Accommodations | Ocean View Resort</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/roompage.css">
</head>
<body>

<%@ include file="components/preloader.jsp" %>
<%@ include file="components/header.jsp" %>

<div class="container py-5 mt-5">
    <div class="text-center mb-5">
        <h6 class="text-primary text-uppercase fw-bold letter-spacing-2">Luxury Living</h6>
        <h2 class="display-5 fw-bold">Our Luxurious Rooms</h2>
        <div class="custom-divider mx-auto"></div>
        <p class="text-muted col-lg-6 mx-auto">Experience the perfect blend of luxury and comfort in our meticulously designed rooms overlooking the turquoise ocean.</p>
    </div>

    <div class="row g-4">
    <%
        RoomDAO dao = new RoomDAO();
        List<AddRoomServlet> roomList = dao.getAllRooms();

        if (roomList != null && !roomList.isEmpty()) {
            for (AddRoomServlet room : roomList) {
    %>
        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="card room-card shadow-sm w-100 d-flex flex-column">
                <div class="room-img-container">
                    <img src="uploads/<%= room.getImageName() %>" class="card-img-top room-img" alt="Luxury Room">
                    <div class="price-tag">Rs.<%= String.format("%.0f", room.getPrice()) %> <span>/ Night</span></div>
                </div>

                <div class="card-body p-4 d-flex flex-column">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="badge bg-primary-soft text-primary px-3 py-2"><%= room.getRoomType() %></span>
                        <div class="rating-stars text-warning small">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                        </div>
                    </div>

                    <h5 class="card-title fw-bold mb-2">Room No: <%= room.getRoomNumber() %></h5>
                    <p class="card-text text-muted mb-4 flex-grow-1"><%= room.getDescription() %></p>

                    <div class="amenities-container mt-auto">
                        <div class="amenities d-flex gap-3 mb-4 text-muted border-top pt-3">
                            <i class="fas fa-wifi" title="Free Wifi"></i>
                            <i class="fas fa-snowflake" title="AC"></i>
                            <i class="fas fa-tv" title="Smart TV"></i>
                            <i class="fas fa-coffee" title="Breakfast"></i>
                        </div>
                        <a href="login.jsp?id=<%= room.getRoomNumber() %>" class="btn btn-booking w-100 rounded-pill py-2 fw-bold">
                            Book This Room <i class="fas fa-arrow-right ms-2"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <div class="col-12 text-center py-5">
            <div class="alert alert-light border-dashed p-5">
                <i class="fas fa-bed fa-3x mb-3 text-muted"></i>
                <p class="h5 text-muted">No rooms available at the moment. Please check back later!</p>
            </div>
        </div>
    <% } %>
    </div>
</div>

<%@ include file="components/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>