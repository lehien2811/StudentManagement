<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sinh viên</title>
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
        * { margin: 0; padding: 0; box-sizing: border-box; }
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
            max-width: 480px;
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
        .form-group {
            margin-bottom: 1.25rem;
        }
        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            font-size: 1rem;
            transition: border-color 0.2s;
        }
        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.2);
        }
        button {
            width: 100%;
            padding: 0.75rem 1rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        button:hover { background-color: #1e40af; }
        .link {
            display: block;
            text-align: center;
            margin-top: 1.25rem;
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }
        .error {
            background-color: #fef2f2;
            color: #ef4444;
            border-radius: varಸ
            padding: 0.75rem 1rem;
            margin-bottom: 1.25rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Quản lý sinh viên</h1>
        <c:if test="${not empty error}">
            <div class="error">
                <i class="fas fa-exclamation-circle"></i>
                ${error}
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/addStudent" method="post">
            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="studentId">Mã sinh viên</label>
                <input type="text" id="studentId" name="studentId" required>
            </div>
            <div class="form-group">
                <label for="age">Tuổi</label>
                <input type="number" id="age" name="age" required>
            </div>
            <button type="submit">Thêm sinh viên</button>
        </form>
        <a href="${pageContext.request.contextPath}/listStudents" class="link">
            Xem danh sách sinh viên
        </a>
    </div>
</body>
</html>