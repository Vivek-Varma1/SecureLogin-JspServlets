<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
    background-color:background-color: rgba(40, 38, 60, 0.9);
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
        <h2>ForgotPassword..?</h2>
        <form action="forgot" method="post">
            <div class="input-group">
                <label for="Email">Email</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Reset</button>
            <p class="register-link"> <a href="#">Try Another way</a></p>






        </form>
    </div>
</body>
</html>