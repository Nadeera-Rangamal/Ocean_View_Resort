<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Receptionist" %>
<%@ page import="DAO.ReceptionistDAO" %>
<%
    String username = request.getParameter("id");
    ReceptionistDAO dao = new ReceptionistDAO();
    Receptionist r = dao.getReceptionistByUsername(username);
    
    
    if (r == null) {
        response.sendRedirect("viewreception.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Receptionist | Admin Dashboard</title>
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
                <h1>Edit Staff</h1>
                <p>Modify contact details and address of your receptionist team members.</p>
            </div>
            <nav class="admin-menu">
                <a href="admindashboard.jsp" class="menu-item"><i class="fa-solid fa-gauge-high"></i> Dashboard</a>
                <a href="viewreceptionists.jsp" class="menu-item active"><i class="fa-solid fa-users-viewfinder"></i> View Staff</a>
                <a href="home.jsp" class="menu-item exit"><i class="fa-solid fa-right-from-bracket"></i> Exit</a>
            </nav>
        </div>
    </div>

    <div class="form-panel py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-8">
                    <div class="card shadow-lg p-4">
                        <h4 class="card-title mb-4">
                            <i class="fa-solid fa-user-pen me-2"></i> Update Details: <%= r.getFirstName() %>
                        </h4>

                        <form action="receptionAction" method="post">
                            <input type="hidden" name="username" value="<%= r.getUsername() %>">

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Email Address</label>
                                <input type="email" name="email" class="form-control" value="<%= r.getEmail() %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Contact Number</label>
                                <input type="text" name="contact" class="form-control" value="<%= r.getContact() %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Residential Address</label>
                                <textarea name="address" class="form-control" rows="3" required><%= r.getAddress() %></textarea>
                            </div>

                            <div class="mt-4">
                                <button type="submit" class="btn btn-success w-100 py-3 shadow-sm mb-2">
                                    <i class="fa-solid fa-floppy-disk me-2"></i> Save Changes
                                </button>
                                <a href="viewreceptionists.jsp" class="btn btn-light w-100 py-2 text-muted">
                                    Cancel & Go Back
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>