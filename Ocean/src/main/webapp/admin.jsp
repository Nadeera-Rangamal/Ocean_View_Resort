<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Rooms | Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin.css">
</head>
<body>

<div class="main-wrapper">
    <div class="side-nav-panel">
        <img src="${pageContext.request.contextPath}/images/ocean.jpg" alt="Hotel Interior" class="side-bg-img">
        
        <div class="side-content">
            <div class="info-text mb-5">
                <h1>Room Management</h1>
                <p>New rooms at Ocean View Resort can be added to the system, and existing room types and prices can be updated here.</p>
            </div>

            <nav class="admin-menu">
            	<a href="${pageContext.request.contextPath}/admindashboard.jsp" class="menu-item ">
                    <i class="fa-solid fa-gauge-high"></i> Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/receptionadd.jsp" class="menu-item">
                    <i class="fa-solid fa-user-plus"></i> Register Staff
                </a>
                <a href="${pageContext.request.contextPath}/admin.jsp" class="menu-item active">
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
                <div class="col-xl-9 col-lg-11">
                    
                    <%-- Status message --%>
                    <% if("success".equals(request.getParameter("status"))) { %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fa-solid fa-circle-check me-2"></i> Room added successfully!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <div class="card shadow-lg p-4 border-0">
                        <h4 class="card-title mb-4"><i class="fa-solid fa-plus-circle me-2"></i> Add New Room</h4>

                        <form action="AddRoomServlet" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">Room Number</label>
                                    <input type="text" name="room_number" class="form-control" placeholder="e.g. 101, A-05" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">Room Type</label>
                                    <select name="room_type" class="form-select" required>
                                        <option value="">Select Room Type</option>
                                        <option value="Standard">Standard</option>
                                        <option value="Deluxe">Deluxe</option>
                                        <option value="Suite">Suite</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Price per Night (Rs)</label>
                                <input type="number" step="0.01" name="price" class="form-control" placeholder="0.00" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Room Description</label>
                                <textarea name="description" class="form-control" placeholder="Details about amenities, view, etc." rows="3"></textarea>
                            </div>

                            <div class="mb-4">
                                <label class="form-label small fw-bold text-muted">Room Image</label>
                                <input type="file" name="image" class="form-control mb-3" id="imageInput" accept="image/*" onchange="previewImage(event)" required>
                                
                                <div class="image-preview-box" id="previewContainer">
                                    <i class="fa-solid fa-cloud-arrow-up" id="placeholderIcon"></i>
                                    <img id="outputPreview">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-3 shadow-sm">
                                <i class="fa-solid fa-save me-2"></i> Add Room to System
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('outputPreview');
            var icon = document.getElementById('placeholderIcon');
            output.src = reader.result;
            output.style.display = "block";
            icon.style.display = "none";
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>