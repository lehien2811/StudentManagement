<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Sinh Viên</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Danh Sách Sinh Viên</h1>

    <c:if test="${empty studentList}">
        <p>Không có sinh viên nào trong danh sách.</p>
    </c:if>

    <c:if test="${not empty studentList}">
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã Sinh Viên</th>
                    <th>Tên</th>
                    <th>Tuổi</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${studentList}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${student.studentId}</td>
                        <td>${student.name}</td>
                        <td>${student.age}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <a href="${pageContext.request.contextPath}/student">Quay lại trang nhập</a>
</body>
</html>
