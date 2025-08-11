package com.example;

import com.example.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/student")
public class StudentController extends HttpServlet {
 
    private static List<Student> studentsList = new ArrayList<>();

 
    public static List<Student> getStudentsList() {
        return studentsList;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "Quản lý sinh viên");
        request.setAttribute("studentList", studentsList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            int age = Integer.parseInt(request.getParameter("age"));

            Student newStudent = new Student(name, studentId, age);
            studentsList.add(newStudent);

            response.sendRedirect(request.getContextPath() + "/listStudents");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Tuổi phải là số hợp lệ!");
            doGet(request, response);
        }
    }
}