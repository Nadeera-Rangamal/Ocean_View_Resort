<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reception Register | Admin Dashboard</title>
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
                <h1>Reception Management</h1>
                <p>Here, the details of a new receptionist can be accurately added to the system for staff management at our Ocean View Resort.</p>
            </div>

            <nav class="admin-menu">
            	<a href="${pageContext.request.contextPath}/admindashboard.jsp" class="menu-item ">
                    <i class="fa-solid fa-gauge-high"></i> Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/receptionadd.jsp" class="menu-item active">
                    <i class="fa-solid fa-user-plus"></i> Register Staff
                </a>
                <a href="${pageContext.request.contextPath}/admin.jsp" class="menu-item">
                    <i class="fa-solid fa-bed"></i> Manage Room
                </a>
                <a href="viewreception.jsp" class="menu-item "><i class="fa-solid fa-users-viewfinder"></i> View Staff</a>
                <a href="${pageContext.request.contextPath}/home.jsp" class="menu-item exit">
                    <i class="fa-solid fa-right-from-bracket"></i> Exit
                </a>
            </nav>
        </div>
    </div>

    <div class="form-panel py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-10">
                    
                    <% if ("success".equals(request.getParameter("status"))) { %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fa-solid fa-circle-check me-2"></i> Reception registered successfully!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <div class="card shadow-lg p-4">
                        <h4 class="card-title mb-4"><i class="fa-solid fa-id-card-clip me-2"></i> Add New Receptionist</h4>

                        <form action="Receptionist" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">First Name</label>
                                    <input type="text" name="first_name" class="form-control" placeholder="Ex: Nadeera" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">Last Name</label>
                                    <input type="text" name="last_name" class="form-control" placeholder="Ex: Rajapaksha" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Email Address</label>
                                <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Contact Number</label>
                                <input type="text" name="contact" class="form-control" placeholder="07XXXXXXXX" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Address</label>
                                <textarea name="address" class="form-control" placeholder="Current residential address" rows="2"></textarea>
                            </div>

                            <hr class="my-4 text-muted">

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">Username</label>
                                    <input type="text" name="username" class="form-control" placeholder="Create username" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label class="form-label small fw-bold text-muted">Password</label>
                                    <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-3 shadow-sm">
                                <i class="fa-solid fa-user-check me-2"></i> Register Receptionist
                            </button>
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