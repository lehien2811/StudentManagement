<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sinh viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
        }
        input[type=text], input[type=number] {
            width: 250px;
            padding: 6px;
            margin: 5px 0;
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        a {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<h2>Thông tin chi tiết sinh viên</h2>

<form action="${pageContext.request.contextPath}/updateStudent" method="post">
    <!-- ID cũ để xác định sinh viên cần cập nhật -->
    <input type="hidden" name="oldId" value="${student.studentId}">

    <label>Mã SV:</label>
    <input type="text" name="studentId" value="${student.studentId}" required><br>

    <label>Tên:</label>
    <input type="text" name="name" value="${student.name}" required><br>

    <label>Tuổi:</label>
    <input type="number" name="age" value="${student.age}" min="0" required><br>

    <label>Địa chỉ:</label>
    <input type="text" name="address" value="${student.address}" required><br><br>

    <input type="submit" value="Cập nhật">
</form>

<a href="${pageContext.request.contextPath}/listStudents">Quay lại danh sách</a>

</body>
</html>
