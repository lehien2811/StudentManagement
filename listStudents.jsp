<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sinh viên</title>
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
            max-width: 900px;
            box-shadow: var(--box-shadow);
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

        .table-container {
            overflow-x: auto;
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #E0E0E0;
        }

        th {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 500;
            position: relative;
        }

        th:first-child {
            border-top-left-radius: 8px;
        }

        th:last-child {
            border-top-right-radius: 8px;
        }

        tr:last-child td:first-child {
            border-bottom-left-radius: 8px;
        }

        tr:last-child td:last-child {
            border-bottom-right-radius: 8px;
        }

        tbody tr {
            transition: all 0.3s ease;
        }

        tbody tr:hover {
            background: rgba(71, 118, 230, 0.05);
            transform: translateY(-2px);
        }

        td a {
            color: var(--primary-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        td a:hover {
            color: var(--secondary-color);
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            color: var(--text-color);
            font-size: 1.1em;
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
                padding: 20px;
            }

            h1 {
                font-size: 2em;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Danh sách sinh viên</h1>

        <c:if test="${empty studentList}">
            <div class="empty-message">
                <i class="fas fa-info-circle"></i>
                Chưa có sinh viên nào trong danh sách
            </div>
        </c:if>

        <c:if test="${not empty studentList}">
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã sinh viên</th>
                            <th>Họ và tên</th>
                            <th>Tuổi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${studentList}" varStatus="loop">
                            <tr>
                                <td>${loop.count}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/studentDetail?studentId=${student.studentId}">
                                        ${student.studentId}
                                    </a>
                                </td>
                                <td>${student.name}</td>
                                <td>${student.age}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <a href="${pageContext.request.contextPath}/student" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Quay lại trang chủ
        </a>
    </div>
</body>
</html>