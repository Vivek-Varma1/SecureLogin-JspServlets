<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : "";
     %>
<!DOCTYPE html>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f4f4f4;
}

.login-container {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 300px;
}

h2 {
    margin-bottom: 20px;
}

.input-group {
    margin-bottom: 15px;
    text-align: left;
}

label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.forgot-password {
    text-align: right;
    margin-bottom: 15px;
}

.forgot-password a {
    color: #007BFF;
    font-size: 14px;
    text-decoration: none;
}

.forgot-password a:hover {
    text-decoration: underline;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007BFF;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
}

button:hover {
    background-color: #0056b3;
}

.register-link {
    margin-top: 10px;
    font-size: 14px;
}

.register-link a {
    color: #007BFF;
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
} 
</style>
</head>

<body>
    <div class="login-container">
     <% if (error.equals("success")) { %>
        <div style="color:green; border: 1px solid green; padding: 8px;">
            <%= error %>
        </div>
         <% } %>
        
         <% if (error.equals("failed")) { %>
        <div style="color:red; border: 1px solid red; padding: 8px;">
            <%= error %>
        </div>
         <% } %>
        
        <h2>Login</h2>
        <form action="log" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="email" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="forgot-password">
                <a href="forgot.jsp">Forgot Password?</a>
            </div>
            <button type="submit">Login</button>
            <p class="register-link">Don't have an account? <a href="signup.jsp">Register</a></p>






        </form>
    </div>
</body>
</html>