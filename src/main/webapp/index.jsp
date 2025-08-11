<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chào Mừng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 {
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 100px;
        }
        input[type="text"], input[type="number"] {
            padding: 5px;
            width: 200px;
        }
        input[type="submit"] {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
        a {
            display: inline-block;
            padding: 8px 15px;
            background-color: #008CBA;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
        }
        a:hover {
            background-color: #007B9A;
        }
    </style>
</head>
<body>
    <h1>${message}</h1>
    <p>Chào mừng đến với hệ thống quản lý sinh viên!</p>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <!-- Form nhập sinh viên -->
    <h2>Nhập thông tin sinh viên mới</h2>
    <form action="${pageContext.request.contextPath}/student" method="post">
        <div class="form-group">
            <label for="name">Tên:</label>
            <input type="text" id="name" name="name" required><br>
        </div>
        <div class="form-group">
            <label for="studentId">Mã sinh viên:</label>
            <input type="text" id="studentId" name="studentId" required><br>
        </div>
        <div class="form-group">
            <label for="age">Tuổi:</label>
            <input type="number" id="age" name="age" required><br>
        </div>
        <input type="submit" value="Thêm sinh viên">
    </form>

<a href="${pageContext.request.contextPath}/listStudents">Xem danh sách sinh viên</a>
</body>
</html>