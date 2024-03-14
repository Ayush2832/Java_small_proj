<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display:flex;
            align-items:center;
            justify-content:center;
            height:100vh;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 50px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
            
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .register-link {
            display: block;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container" id="register-container" >
        <h2>Register</h2>
        <form action="register_Servlt" method="post">
            <div class="form-group">
                <label for="reg-username">Username</label>
                <input type="text" id="reg-username" name="reg-username" required>
            </div>
            <div class="form-group">
                <label for="reg-password">Password</label>
                <input type="password" id="reg-password" name="reg-password" required>
            </div>
            
            <button type="submit" class="btn">Register</button>
            <a href="index.html" class="register-link">Already have an account? Login</a>
        </form>
    </div>
</body>
</html>