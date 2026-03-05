<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
</head>
<body>

<div class="login-wrapper">
    <div class="login-image">
        <img src="images/ocean.jpg" alt="Ocean View Resort" class="img-fluid">
        <div class="image-overlay">
            <h1>Ocean View Resort</h1>
            <hr style="width: 50px; margin: 15px auto; border-top: 3px solid #fff;">
            <p>Experience the freedom and luxury of a beautiful beach. We are ready to make your vacation an unforgettable memory.</p>
        </div>
    </div>

    <div class="login-card">
        <div class="text-center mb-4">
            <h2 class="login-title">Welcome Back</h2>
            <p class="login-subtitle">Please login to continue</p>
        </div>

        
        <% if ("error".equals(request.getParameter("status"))) { %>
            <div class="alert alert-danger text-center py-2" style="font-size: 0.9rem;">
                <i class="fas fa-exclamation-circle me-2"></i> Invalid username or password
            </div>
        <% } %>

        <form id="loginForm" action="LoginServlet" method="post" onsubmit="return validateLogin(event)">
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required>
            </div>

            <div class="input-group mb-4">
                <span class="input-group-text"><i class="fa fa-lock"></i></span>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            </div>

            <button type="submit" class="btn btn-login w-100">
                Login <i class="fas fa-arrow-right ms-2"></i>
            </button>
        </form>

        <div class="text-center mt-4">
            <small class="text-muted">© 2026 Ocean View Resort. All rights reserved.</small>
        </div>
    </div>
</div>

<script>
    function validateLogin(event) {
        const user = document.getElementById('username').value;
        const pass = document.getElementById('password').value;

        
        if (user === "admin" && pass === "1230") {
            
            window.location.href = "admindashboard.jsp";
            return false; 
        }
        
        
        return true; 
    }
</script>

</body>
</html>