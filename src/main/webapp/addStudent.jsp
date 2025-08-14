<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sinh viên mới</title>
</head>
<body>
<h2>Thêm sinh viên mới</h2>
<form action="addStudent" method="post">
    <label>Họ tên:</label>
    <input type="text" name="name" required><br><br>

    <label>Mã sinh viên:</label>
    <input type="text" name="studentId" required><br><br>

    <label>Tuổi:</label>
    <input type="number" name="age" required><br><br>

    <label>Địa chỉ:</label>
    <input type="text" name="address" required><br><br>

    <button type="submit">Lưu</button>
</form>
</body>
</html>
