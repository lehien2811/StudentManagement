<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sinh viên</title>
</head>
<body>
<h2>Danh sách sinh viên</h2>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Tên</th>
        <th>Mã SV</th>
        <th>Tuổi</th>
    </tr>
    <%
        java.util.List<org.bson.Document> students = 
            (java.util.List<org.bson.Document>) request.getAttribute("studentList");
        if (students != null && !students.isEmpty()) {
            for (org.bson.Document s : students) {
    %>
    <tr>
        <td><%= s.getString("name") %></td>
        <td><%= s.getString("studentId") %></td>
        <td><%= s.getInteger("age") %></td>
    </tr>
    <% 
            }
        } else { 
    %>
    <tr>
        <td colspan="3">Không có dữ liệu sinh viên</td>
    </tr>
    <% } %>
</table>

</body>
</html>
