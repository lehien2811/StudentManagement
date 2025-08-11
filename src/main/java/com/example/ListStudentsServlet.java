package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/listStudents")
public class ListStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Sử dụng getter để lấy danh sách
        request.setAttribute("studentList", StudentController.getStudentsList());
        request.getRequestDispatcher("/listStudents.jsp").forward(request, response);
    }
}