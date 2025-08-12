<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Sinh Viên</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Quicksand', 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
            min-height: 100vh;
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
            max-width: 900px;
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
            margin-bottom: 18px;
            font-size: 2.3rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-shadow: 0 2px 8px rgba(60,60,120,0.10);
        }
        .fa-users {
            color: #43e97b;
            font-size: 2.1rem;
            margin-right: 10px;
            vertical-align: middle;
            filter: drop-shadow(0 2px 8px #43e97b55);
        }
        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            background: rgba(255,255,255,0.85);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 2px 16px rgba(60,60,120,0.10);
            margin-bottom: 18px;
            animation: tableFadeIn 1s;
        }
        @keyframes tableFadeIn {
            from { opacity: 0; transform: scale(0.97);}
            to { opacity: 1; transform: scale(1);}
        }
        th, td {
            border-bottom: 1.5px solid #e0eafc;
            padding: 14px 12px;
            text-align: left;
            transition: background 0.2s;
        }
        th {
            background: linear-gradient(90deg, #43e97b 0%, #38f9d7 100%);
            color: #fff;
            font-weight: 700;
            font-size: 1.08rem;
            border: none;
            letter-spacing: 0.5px;
        }
        tr {
            transition: box-shadow 0.2s, transform 0.15s;
        }
        tr:nth-child(even) {
            background-color: #f7fafc;
        }
        tr:hover {
            background: linear-gradient(90deg, #e0f7fa 0%, #f7fafc 100%);
            box-shadow: 0 2px 12px rgba(67,233,123,0.09);
            transform: scale(1.01);
        }
        td a {
            color: #008CBA;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s;
        }
        td a:hover {
            color: #43e97b;
            text-decoration: underline;
        }
        .empty-msg {
            text-align: center;
            color: #e53935;
            font-weight: 600;
            font-size: 1.13rem;
            margin: 30px 0 18px 0;
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
            box-shadow: 0 2px 14px rgba(0,140,186,0.09);
            letter-spacing: 0.5px;
        }
        .back-btn:hover {
            background: linear-gradient(90deg, #43a7f5 0%, #008CBA 100%);
            transform: translateY(-2px) scale(1.04);
            box-shadow: 0 4px 24px rgba(0,140,186,0.13);
        }
        @media (max-width: 600px) {
            .container { padding: 18px 4px; }
            th, td { padding: 8px 4px; font-size: 0.98rem; }
            h1 { font-size: 1.3rem; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fa-solid fa-users"></i>Danh Sách Sinh Viên</h1>

        <c:if test="${empty studentList}">
            <p class="empty-msg"><i class="fa-solid fa-face-frown"></i> Không có sinh viên nào trong danh sách.</p>
        </c:if>

        <c:if test="${not empty studentList}">
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th><i class="fa-solid fa-id-card"></i> Mã Sinh Viên</th>
                        <th><i class="fa-solid fa-user"></i> Tên</th>
                        <th><i class="fa-solid fa-cake-candles"></i> Tuổi</th>
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
        </c:if>

        <a class="back-btn" href="${pageContext.request.contextPath}/student"><i class="fa-solid fa-arrow-left"></i> Quay lại trang nhập</a>