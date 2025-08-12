<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sinh viên</title>
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
            max-width: 600px;
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

        .student-info {
            background: rgba(71, 118, 230, 0.05);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .info-item:hover {
            background: rgba(71, 118, 230, 0.1);
        }

        .info-item i {
            color: var(--primary-color);
            margin-right: 15px;
            font-size: 1.2em;
        }

        .info-label {
            font-weight: 500;
            min-width: 120px;
            color: var(--text-color);
        }

        .info-value {
            color: var(--primary-color);
            font-weight: 500;
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

        .btn-update {
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

        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(71, 118, 230, 0.3);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            margin-top: 20px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-link i {
            margin-right: 8px;
        }

        .back-link:hover {
            color: var(--secondary-color);
            transform: translateX(-5px);
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 2em;
            }

            .info-item {
                flex-direction: column;
                align-items: flex-start;
            }

            .info-label {
                margin-bottom: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chi tiết sinh viên</h1>

        <div class="student-info">
            <div class="info-item">
                <i class="fas fa-id-card"></i>
                <span class="info-label">Mã sinh viên:</span>
                <span class="info-value">${student.studentId}</span>
            </div>
            <div class="info-item">
                <i class="fas fa-user"></i>
                <span class="info-label">Họ và tên:</span>
                <span class="info-value">${student.name}</span>
            </div>
            <div class="info-item">
                <i class="fas fa-birthday-cake"></i>
                <span class="info-label">Tuổi:</span>
                <span class="info-value">${student.age}</span>
            </div>
            <div class="info-item">
                <i class="fas fa-map-marker-alt"></i>
                <span class="info-label">Địa chỉ:</span>
                <span class="info-value">${student.address}</span>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/updateStudent" method="post">
            <input type="hidden" name="oldId" value="${student.studentId}">
            
            <div class="form-group">
                <label for="studentId">Mã sinh viên</label>
                <input type="text" id="studentId" name="studentId" value="${student.studentId}" required>
                <i class="fas fa-id-card icon"></i>
            </div>

            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name" value="${student.name}" required>
                <i class="fas fa-user icon"></i>
            </div>

            <div class="form-group">
                <label for="age">Tuổi</label>
                <input type="number" id="age" name="age" value="${student.age}" required>
                <i class="fas fa-birthday-cake icon"></i>
            </div>

            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address" value="${student.address}" required>
                <i class="fas fa-map-marker-alt icon"></i>
            </div>

            <button type="submit" class="btn-update">
                <i class="fas fa-save"></i> Cập nhật thông tin
            </button>
        </form>

        <a href="${pageContext.request.contextPath}/listStudents" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Quay lại danh sách
        </a>
    </div>
</body>
</html>