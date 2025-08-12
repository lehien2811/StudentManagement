<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sinh viên</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Quicksand', 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: rgba(255,255,255,0.25);
            box-shadow: 0 8px 32px 0 rgba(31,38,135,0.18);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 24px;
            border: 1.5px solid rgba(255,255,255,0.28);
            max-width: 420px;
            width: 100%;
            padding: 40px 36px 32px 36px;
            margin: 40px 0;
            animation: fadeIn 0.8s;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(40px);}
            to { opacity: 1; transform: translateY(0);}
        }
        h1 {
            color: #2d3a4b;
            text-align: center;
            margin-bottom: 10px;
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-shadow: 0 2px 8px rgba(60,60,120,0.10);
        }
        .fa-graduation-cap {
            color: #43e97b;
            font-size: 2.2rem;
            margin-right: 10px;
            vertical-align: middle;
            filter: drop-shadow(0 2px 8px #43e97b55);
        }
        h2 {
            color: #43e97b;
            text-align: center;
            margin-bottom: 24px;
            font-size: 1.35rem;
            font-weight: 700;
            letter-spacing: 0.5px;
        }
        .welcome {
            text-align: center;
            color: #444;
            margin-bottom: 22px;
            font-size: 1.13rem;
            font-weight: 500;
        }
        .form-group {
            margin-bottom: 22px;
        }
        label {
            display: block;
            margin-bottom: 7px;
            color: #2d3a4b;
            font-weight: 600;
            letter-spacing: 0.2px;
        }
        .input-icon {
            position: relative;
        }
        .input-icon input {
            padding-left: 44px;
            background: rgba(255,255,255,0.7);
            border: 1.5px solid #cfd8dc;
            border-radius: 9px;
            font-size: 16px;
            transition: border 0.2s, box-shadow 0.2s;
            width: 100%;
            padding-top: 11px;
            padding-bottom: 11px;
        }
        .input-icon i {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            color: #43e97b;
            font-size: 1.25rem;
            opacity: 0.85;
        }
        .input-icon input:focus {
            border: 1.5px solid #43e97b;
            background: #fff;
            box-shadow: 0 2px 12px rgba(67,233,123,0.10);
        }
        input[type="submit"] {
            width: 100%;
            padding: 13px 0;
            background: linear-gradient(90deg, #43e97b 0%, #38f9d7 100%);
            color: #fff;
            border: none;
            border-radius: 9px;
            cursor: pointer;
            font-size: 1.13rem;
            font-weight: 700;
            box-shadow: 0 2px 16px rgba(67,233,123,0.13);
            transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
            margin-top: 10px;
            letter-spacing: 0.5px;
        }
        input[type="submit"]:hover {
            background: linear-gradient(90deg, #38f9d7 0%, #43e97b 100%);
            transform: translateY(-2px) scale(1.04);
            box-shadow: 0 4px 24px rgba(67,233,123,0.18);
        }
        .error {
            color: #e53935;
            margin-top: 10px;
            text-align: center;
            font-weight: 600;
            font-size: 1.08rem;
        }
        a {
            display: block;
            text-align: center;
            padding: 13px 0;
            background: linear-gradient(90deg, #008CBA 0%, #43a7f5 100%);
            color: white;
            text-decoration: none;
            border-radius: 9px;
            margin-top: 32px;
            font-weight: 700;
            font-size: 1.13rem;
            transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 2px 14px rgba(0,140,186,0.09);
            letter-spacing: 0.5px;
        }
        a:hover {
            background: linear-gradient(90deg, #43a7f5 0%, #008CBA 100%);
            transform: translateY(-2px) scale(1.04);
            box-shadow: 0 4px 24px rgba(0,140,186,0.13);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fa-solid fa-graduation-cap"></i>Quản lý sinh viên</h1>
        <p class="welcome">Chào mừng đến với hệ thống quản lý sinh viên!</p>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <h2>Nhập thông tin sinh viên mới</h2>
        <form action="${pageContext.request.contextPath}/student" method="post">
            <div class="form-group input-icon">
                <label for="name">Tên:</label>
                <i class="fa-solid fa-user"></i>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group input-icon">
                <label for="studentId">Mã sinh viên:</label>
                <i class="fa-solid fa-id-card"></i>
                <input type="text" id="studentId" name="studentId" required>
            </div>
            <div class="form-group input-icon">
                <label for="age">Tuổi:</label>
                <i class="fa-solid fa-cake-candles"></i>
                <input type="number" id="age" name="age" required>
            </div>
            <input type="submit" value="Thêm sinh viên">
        </form>

        <a href="${pageContext.request.contextPath}/listStudents"><i class="fa-solid fa-list"></i> Xem danh sách sinh viên</a>
    </div>
</body>
</html>