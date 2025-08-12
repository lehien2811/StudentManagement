<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sinh viên</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <style>
        :root {
            --primary: #2563eb;
            --text: #374151;
            --surface: #f9fafb;
            --border: #e5e7eb;
            --radius: 0.5rem;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Nunito', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #edf2f7;
            color: var(--text);
            padding: 1rem;
        }

        .card {
            width: 100%;
            max-width: 900px;
            background-color: var(--surface);
            border-radius: var(--radius);
            padding: 2rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        h1 {
            font-size: 1.75rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--primary);
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        th {
            font-weight: 600;
            background-color: #f3f4f6;
        }

        td a {
            color: var(--primary);
            text-decoration: none;
            transition: color 0.2s;
        }

        td a:hover {
            color: #1e40af;
        }

        .empty-message {
            text-align: center;
            padding: 1.5rem;
            color: #6b7280;
        }

        .back-button {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: var(--radius);
            font-weight: 600;
            text-decoration: none;
            transition: background-color 0.2s;
        }

        .back-button:hover {
            background-color: #1e40af;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Danh sách sinh viên</h1>

        <c:if test="${empty studentList}">
            <p class="empty-message">Không có sinh viên nào trong danh sách.</p>
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

        <a href="${pageContext.request.contextPath}/student" class="back-button">
            Quay lại trang chủ
        </a>
    </div>
</body>
</html>