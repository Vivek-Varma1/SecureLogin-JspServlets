<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies

String uname = (String) session.getAttribute("username");
if (uname == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #f0f4ff;
            color: #333;
            animation: fadeInBody 0.5s ease-in;
        }

        @keyframes fadeInBody {
            from {opacity: 0; transform: scale(0.98);}
            to {opacity: 1; transform: scale(1);}
        }

        .header {
            background: linear-gradient(to right, #4e54c8, #8f94fb);
            color: white;
            padding: 30px 0;
            text-align: center;
            animation: slideDown 1s ease-in;
        }

        @keyframes slideDown {
            from {transform: translateY(-100%); opacity: 0;}
            to {transform: translateY(0); opacity: 1;}
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 0.8s ease;
        }
        
	
        @keyframes fadeInUp {
            from {transform: translateY(20px); opacity: 0;}
            to {transform: translateY(0); opacity: 1;}
        }

        .container h2 {
            color: #4e54c8;
            font-size: 1.8rem;
        }

        .button {
            display: block;
            width: fit-content;
            margin: 20px auto 0;
            background-color: #4e54c8;
            color: white;
            padding: 10px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .button:hover {
            background-color: #3438a9;
        }

        .footer {
            text-align: center;
            padding: 15px;
            background: linear-gradient(to right, #4e54c8, #8f94fb);
            color: white;
            animation: fadeInUp 1.2s ease;
        }

        nav.navbar {
            background: #ffffff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        
        @media (prefers-color-scheme: dark) {
    body {
        background-color: #1e1e1e;
        color: #dadada;
    }

    .container {
        background-color: #2c2c2c;
        color: #e0e0e0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        border: 1px solid rgba(255, 255, 255, 0.05);
    }

    .container h2 {
        color: #c5cae9;
    }

    .button {
        background: linear-gradient(135deg, #7986cb, #9fa8da);
        color: #ffffff;
    }

    .button:hover {
        filter: brightness(1.15);
    }

    .header,
    .footer {
        background: linear-gradient(to right, #3f3f7f, #6f74dd);
        color: #e0e0e0;
    }

    nav.navbar {
        background: #2a2a2a;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    }

    nav .nav-link,
    nav .navbar-brand {
        color: #ddd !important;
    }

    nav .btn-outline-primary {
        border-color: #7986cb;
        color: #c5cae9;
    }

    nav .btn-outline-primary:hover {
        background-color: #7986cb;
        color: white;
    }

    input.form-control {
        background-color: #1e1e1e;
        color: #e0e0e0;
        border: 1px solid #444;
    }

    input.form-control::placeholder {
        color: #888;
    }
}
        
        
        
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-primary" href="#">Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                        </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                       </li>
                    
                            
                       
                   
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search">
                    <button class="btn btn-outline-primary" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="header">
        <h1>Welcome to Your Dashboard</h1>
    </div>

    <div class="container">
        <h2>Hello, <%= uname %>!</h2>
        <p>Thank you for logging in. Use the options below to navigate through your dashboard. If you need assistance, feel free to contact us.</p>
        <a href="logout.jsp" class="button">Logout</a>
    </div>

    <div class="footer">
        &copy; 2024 Your Company. All rights reserved.
    </div>

   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
