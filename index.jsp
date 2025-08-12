<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sinh viên</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <style>
        :root {
            --primary-color: #4776E6;
            --secondary-color: #8E54E9;
            --accent-color: #FF4081;
            --text-color: #2A2A2A;
            --light-text: #FFFFFF;
            --border-radius: 16px;
            --box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(-45deg, #4776E6, #8E54E9, #4776E6);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-color);
            padding: 20px;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: var(--box-shadow);
            transform-style: preserve-3d;
            transform: perspective(1000px);
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: perspective(1000px) rotateX(2deg) rotateY(2deg);
        }

        h1 {
            color: var(--primary-color);
            font-size: 2.5em;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-color);
            font-weight: 500;
            transform: translateZ(20px);
        }

        .form-group input {
            width: 100%;
            padding: 12px 20px;
            border: 2px solid #E0E0E0;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s ease;
            background: white;
        }

        .form-group input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(71, 118, 230, 0.1);
            outline: none;
        }

        .form-group .icon {
            position: absolute;
            right: 15px;
            top: 40px;
            color: var(--primary-color);
            transition: transform 0.3s ease;
        }

        .form-group input:focus + .icon {
            transform: translateY(-2px);
        }

        .btn-submit {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 20px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(71, 118, 230, 0.3);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .list-link {
            display: inline-block;
            margin-top: 25px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .list-link:hover {
            color: var(--secondary-color);
        }

        .list-link i {
            margin-right: 8px;
        }

        .error-message {
            background: #FFF5F5;
            color: #E53E3E;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 0.9em;
            display: flex;
            align-items: center;
        }

        .error-message i {
            margin-right: 8px;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .floating-element {
            animation: float 3s ease-in-out infinite;
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quản lý sinh viên</h1>
        
        <c:if test="${not empty error}">
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i>
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/student" method="post">
            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name" required placeholder="Nhập họ tên sinh viên">
                <i class="fas fa-user icon"></i>
            </div>

            <div class="form-group">
                <label for="studentId">Mã sinh viên</label>
                <input type="text" id="studentId" name="studentId" required placeholder="Nhập mã sinh viên">
                <i class="fas fa-id-card icon"></i>
            </div>

            <div class="form-group">
                <label for="age">Tuổi</label>
                <input type="number" id="age" name="age" required placeholder="Nhập tuổi">
                <i class="fas fa-birthday-cake icon"></i>
            </div>

            <button type="submit" class="btn-submit floating-element">
                <i class="fas fa-user-plus"></i> Thêm sinh viên
            </button>
        </form>

        <a href="${pageContext.request.contextPath}/listStudents" class="list-link">
            <i class="fas fa-list"></i>
            Xem danh sách sinh viên
        </a>
    </div>
</body>
</html>