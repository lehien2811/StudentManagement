<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sinh viên</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700&family=Quicksand:wght@500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Quicksand', 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: radial-gradient(ellipse at top left, #2b5876 0%, #4e4376 100%), url('https://www.transparenttextures.com/patterns/stardust.png');
            background-blend-mode: lighten;
            color: #e0eafc;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: rgba(30,34,60,0.85);
            border-radius: 22px;
            box-shadow: 0 8px 40px 0 #1a1a2e99, 0 1.5px 0 #43e97b55 inset;
            padding: 38px 36px 28px 36px;
            max-width: 420px;
            width: 100%;
            margin: 40px 0;
            animation: fadeIn 1s;
            border: 1.5px solid rgba(67,233,123,0.18);
            position: relative;
            overflow: hidden;
        }
        .container::before {
            content: "";
            position: absolute;
            top: -60px; left: -60px;
            width: 180px; height: 180px;
            background: radial-gradient(circle, #43e97b55 0%, transparent 80%);
            z-index: 0;
            pointer-events: none;
            filter: blur(2px);
        }
        .container::after {
            content: "";
            position: absolute;
            bottom: -60px; right: -60px;
            width: 180px; height: 180px;
            background: radial-gradient(circle, #38f9d755 0%, transparent 80%);
            z-index: 0;
            pointer-events: none;
            filter: blur(2px);
        }
        h2 {
            font-family: 'Orbitron', 'Quicksand', Arial, sans-serif;
            color: #43e97b;
            text-align: center;
            margin-bottom: 28px;
            font-size: 2rem;
            letter-spacing: 2px;
            text-shadow: 0 2px 12px #43e97b33, 0 0px 18px #fff2;
            position: relative;
            z-index: 1;
        }
        form {
            margin-top: 0;
            position: relative;
            z-index: 1;
        }
        label {
            display: block;
            margin-bottom: 7px;
            color: #aeeaff;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .input-icon {
            position: relative;
            margin-bottom: 20px;
        }
        .input-icon input {
            padding-left: 40px;
            background: rgba(255,255,255,0.09);
            border: 1.5px solid #43e97b55;
            border-radius: 9px;
            font-size: 16px;
            color: #e0eafc;
            width: 100%;
            padding-top: 11px;
            padding-bottom: 11px;
            transition: border 0.2s, box-shadow 0.2s, background 0.2s;
            outline: none;
        }
        .input-icon i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #43e97b;
            font-size: 1.18rem;
            opacity: 0.85;
        }
        .input-icon input:focus {
            border: 1.5px solid #43e97b;
            background: rgba(67,233,123,0.08);
            box-shadow: 0 2px 12px #43e97b33;
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
            box-shadow: 0 2px 16px #43e97b33;
            transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
            margin-top: 10px;
            letter-spacing: 0.5px;
        }
        input[type="submit"]:hover {
            background: linear-gradient(90deg, #38f9d7 0%, #43e97b 100%);
            transform: translateY(-2px) scale(1.04);
            box-shadow: 0 4px 24px #43e97b44;
        }
        .back-btn {
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
            box-shadow: 0 2px 14px #008cba33;
            letter-spacing: 0.5px;
        }
        .back-btn:hover {
            background: linear-gradient(90deg, #43a7f5 0%, #008CBA 100%);
            transform: translateY(-2px) scale(1.04);
            box-shadow: 0 4px 24px #008cba44;
        }
        @media (max-width: 600px) {
            .container { padding: 18px 4px; }
            h2 { font-size: 1.2rem; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fa-solid fa-user-astronaut"></i> Thông tin chi tiết sinh viên</h2>
        <form action="${pageContext.request.contextPath}/updateStudent" method="post">
            <input type="hidden" name="oldId" value="${student.studentId}">
            <div class="input-icon">
                <label for="studentId">Mã SV:</label>
                <i class="fa-solid fa-id-card"></i>
                <input type="text" id="studentId" name="studentId" value="${student.studentId}" required>
            </div>
            <div class="input-icon">
                <label for="name">Tên:</label>
                <i class="fa-solid fa-user"></i>
                <input type="text" id="name" name="name" value="${student.name}" required>
            </div>
            <div class="input-icon">
                <label for="age">Tuổi:</label>
                <i class="fa-solid fa-cake-candles"></i>
                <input type="number" id="age" name="age" value="${student.age}" min="0" required>
            </div>
            <div class="input-icon">
                <label for="address">Địa chỉ:</label>
                <i class="fa-solid fa-location-dot"></i>
                <input type="text" id="address" name="address" value="${student.address}" required>
            </div>
            <input type="submit" value="Cập nhật">
        </form>
        <a class="back-btn" href="${pageContext.request.contextPath}/listStudents"><i class="fa-solid fa-arrow-left"></i> Quay lại danh sách</a>
    </div>