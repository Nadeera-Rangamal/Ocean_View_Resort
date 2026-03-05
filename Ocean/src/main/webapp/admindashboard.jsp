<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Ocean View Resort</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admindashboard.css">
</head>
<body>

<div class="split-container">
    
    <div class="image-section">
        <img src="${pageContext.request.contextPath}/images/ocean.jpg" alt="Resort View" class="bg-image">
        <div class="glass-overlay">
            <h3 id="date-text">Loading Date...</h3>
            <h1 id="time-text">00:00:00 AM</h1>
            <p class="location-text"><i class="fa-solid fa-location-dot"></i> Ocean View Resort, Galle</p>
        </div>
    </div>

    <div class="content-section">
        
        <nav class="nav-header">
            <div class="logo-area">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="main-logo">
                
            </div>
            <div class="admin-badge">
                <i class="fa-solid fa-shield-halved"></i> <span>Administrator</span>
            </div>
        </nav>

        <div class="dashboard-body">
            <div class="header-text">
                <h2>Admin Control Panel</h2>
                <p>Manage your staff and resort infrastructure with ease.</p>
            </div>

            <div class="action-list">
                <a href="${pageContext.request.contextPath}/receptionadd.jsp" class="action-card">
                    <div class="icon-box blue-bg">
                        <i class="fa-solid fa-user-plus"></i>
                    </div>
                    <div class="card-info">
                        <h4>Register Staff</h4>
                        <p>Onboard new receptionists</p>
                    </div>
                    <span class="go-btn">Get Started <i class="fa-solid fa-arrow-right"></i></span>
                </a>

                <a href="${pageContext.request.contextPath}/admin.jsp" class="action-card">
                    <div class="icon-box green-bg">
                        <i class="fa-solid fa-bed"></i>
                    </div>
                    <div class="card-info">
                        <h4>Manage Rooms</h4>
                        <p>Add and update room details</p>
                    </div>
                    <span class="go-btn">Manage Now <i class="fa-solid fa-arrow-right"></i></span>
                </a>
                
                <a href="${pageContext.request.contextPath}/viewreception.jsp" class="action-card">
                    <div class="icon-box orange-bg">
                        <i class="fa-solid fa-users-viewfinder"></i>
                    </div>
                    <div class="card-info">
                        <h4>View Reception</h4>
                        <p>View and remove reception details</p>
                    </div>
                    <span class="go-btn">View Details <i class="fa-solid fa-arrow-right"></i></span>
                </a>

                <a href="${pageContext.request.contextPath}/home.jsp" class="action-card logout-card">
        	<div class="icon-box red-bg">
            		<i class="fa-solid fa-power-off"></i>
        			</div>
        			<div class="card-info">
           					 <h4>Exit Dashboard</h4>
            			<p>Return to main website portal</p>
        			</div>
        			<span class="go-btn logout-btn">Exit Now <i class="fa-solid fa-arrow-right-from-bracket"></i></span>
    			</a>
            </div>
        </div>
    </div>
</div>

<script>
    function updateClock() {
        const now = new Date();
        const dateOptions = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        document.getElementById('date-text').innerText = now.toLocaleDateString('en-US', dateOptions);
        const timeOptions = { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true };
        document.getElementById('time-text').innerText = now.toLocaleTimeString('en-US', timeOptions);
    }
    setInterval(updateClock, 1000);
    updateClock();
</script>

</body>
</html>