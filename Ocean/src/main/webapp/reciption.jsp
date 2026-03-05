<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="models.AddRoomServlet" %>
<%@ page import="DAO.RoomDAO" %>
<%@ page import="DAO.dbconnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f4f7f6; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    .room-card { transition: all 0.3s ease; border: none; border-radius: 20px; overflow: hidden; position: relative; }
    .room-card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(0,0,0,0.1); }
    .room-img { height: 220px; object-fit: cover; }
    .status-badge { position: absolute; top: 15px; right: 15px; z-index: 10; font-weight: 600; padding: 8px 15px; border-radius: 50px; }
    .price-tag { color: #2c3e50; font-weight: bold; font-size: 1.25rem; }
</style>
</head>
<body>
<%@ include file="dashbord/navigation.jsp" %>

<div class="container mt-5">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h2 class="display-5 fw-bold text-dark">Our Luxury Rooms</h2>
            <p class="text-muted">Discover the perfect stay with real-time availability</p>
        </div>
    </div>

    <div class="row">
        <%
            RoomDAO roomDao = new RoomDAO();
            List<AddRoomServlet> roomList = roomDao.getAllRooms();
            
            if (roomList != null && !roomList.isEmpty()) {
                for (AddRoomServlet room : roomList) {
                    
                    boolean isCurrentlyBooked = false;
                    
                    
                    String checkSql = "SELECT COUNT(*) FROM booking b " +
                                     "LEFT JOIN payment_status p ON b.reservation_no = p.reservation_no " +
                                     "WHERE b.room_no = ? " +
                                     "AND CURDATE() BETWEEN b.check_in AND b.check_out " +
                                     "AND p.reservation_no IS NULL";
                    
                    try (Connection conn = dbconnection.getConnection();
                         PreparedStatement ps = conn.prepareStatement(checkSql)) {
                        
                        ps.setString(1, room.getRoomNumber());
                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next() && rs.getInt(1) > 0) {
                                isCurrentlyBooked = true;
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    String status = isCurrentlyBooked ? "Booked" : "Available";
                    String badgeClass = isCurrentlyBooked ? "bg-danger text-white" : "bg-success text-white";
        %>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card room-card h-100 shadow-sm border-0">
                <span class="badge <%= badgeClass %> status-badge shadow-sm">
                    <%= status %>
                </span>
                
                <img src="uploads/<%= room.getImageName() %>" class="card-img-top room-img" alt="Room Image" 
                     onerror="this.src='https://via.placeholder.com/400x250?text=Room+Image+Not+Found';">
                
                <div class="card-body d-flex flex-column">
                    <div class="mb-2">
                        <small class="text-uppercase text-muted fw-bold tracking-wider"><%= room.getRoomType() %></small>
                        <h4 class="card-title mt-1 mb-0">Room <%= room.getRoomNumber() %></h4>
                    </div>
                    
                    <p class="card-text text-secondary mb-4" style="font-size: 0.95rem;">
                        <%= (room.getDescription() != null && room.getDescription().length() > 80) ? 
                             room.getDescription().substring(0, 80) + "..." : room.getDescription() %>
                    </p>
                    
                    <div class="mt-auto pt-3 border-top d-flex justify-content-between align-items-center">
                        <div>
                            <span class="text-muted small d-block">Price per Night</span>
                            <span class="price-tag">Rs. <%= String.format("%,.2f", room.getPrice()) %></span>
                        </div>
                        
                        <% if(!isCurrentlyBooked) { %>
                            <a href="booking.jsp?roomNo=<%= room.getRoomNumber() %>" class="btn btn-primary rounded-pill px-4 shadow-sm">Book Now</a>
                        <% } else { %>
                            <button class="btn btn-secondary rounded-pill px-4" disabled title="Currently Occupied">Occupied</button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% 
                }
            } else { 
        %>
        <div class="col-12 text-center py-5">
            <div class="p-5 border-2 border-dashed rounded-3 bg-white">
                <h3 class="text-muted">No Rooms Found</h3>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>