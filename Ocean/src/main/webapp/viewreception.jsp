<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Receptionist" %>
<%@ page import="DAO.ReceptionistDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Receptionists | Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/receptionadd.css">
</head>
<body>

<div class="main-wrapper">
    <div class="side-nav-panel">
        <img src="${pageContext.request.contextPath}/images/ocean.jpg" alt="Hotel Reception" class="side-bg-img">
        <div class="side-content">
            <div class="info-text mb-5">
                <h1>Staff Directory</h1>
                <p>View and manage all registered receptionists for Ocean View Resort.</p>
            </div>
            <nav class="admin-menu">
                <a href="admindashboard.jsp" class="menu-item"><i class="fa-solid fa-gauge-high"></i> Dashboard</a>
                <a href="receptionadd.jsp" class="menu-item"><i class="fa-solid fa-user-plus"></i> Register Staff</a>
                <a href="${pageContext.request.contextPath}/admin.jsp" class="menu-item">
                    <i class="fa-solid fa-bed"></i> Manage Room
                </a>
                <a href="viewreceptionists.jsp" class="menu-item active"><i class="fa-solid fa-users-viewfinder"></i> View Staff</a>
                <a href="home.jsp" class="menu-item exit"><i class="fa-solid fa-right-from-bracket"></i> Exit</a>
            </nav>
        </div>
    </div>

    <div class="form-panel py-5">
        <div class="container-fluid px-4">
            
            <% 
                String msg = request.getParameter("msg");
                if("deleted".equals(msg)) { 
            %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fa-solid fa-trash-can me-2"></i> Record deleted successfully!
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } else if("updated".equals(msg)) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fa-solid fa-check-circle me-2"></i> Record updated successfully!
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <% } else if("error".equals(msg)) { %>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <i class="fa-solid fa-triangle-exclamation me-2"></i> Something went wrong. Please try again.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <div class="card shadow-lg border-0">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h4 class="mb-0 text-primary"><i class="fa-solid fa-list-ul me-2"></i> Registered Receptionists</h4>
                    <a href="receptionadd.jsp" class="btn btn-sm btn-primary"><i class="fa-solid fa-plus"></i> Add New</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Contact</th>
                                    <th>Address</th>
                                    <th>Username</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ReceptionistDAO dao = new ReceptionistDAO();
                                    List<Receptionist> list = dao.getAllReceptionists();
                                    if(list != null && !list.isEmpty()) {
                                        for(Receptionist r : list) {
                                %>
                                <tr>
                                    <td><strong><%= r.getFirstName() + " " + r.getLastName() %></strong></td>
                                    <td><%= r.getEmail() %></td>
                                    <td><%= r.getContact() %></td>
                                    <td><small><%= r.getAddress() %></small></td>
                                    <td><span class="badge bg-info text-dark"><%= r.getUsername() %></span></td>
                                    <td class="text-center">
                                        <a href="editreceptionist.jsp?id=<%= r.getUsername() %>" class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                        
                                        <a href="receptionAction?action=delete&id=<%= r.getUsername() %>" 
                                           class="btn btn-sm btn-outline-danger" 
                                           onclick="return confirm('Are you sure you want to delete this record?');">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                                <% 
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">No records found in the database.</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>