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

    // Lấy 1 sinh viên theo studentId
    public static Student getStudentById(String studentId) {
        for (Student s : studentsList) {
            if (s.getStudentId().equals(studentId)) {
                return s;
            }
        }
        return null;
    }

    // Cập nhật thông tin sinh viên
    public static void updateStudent(String oldStudentId, String newStudentId, String name, int age, String address) {
        for (Student s : studentsList) {
            if (s.getStudentId().equals(oldStudentId)) {
                s.setStudentId(newStudentId);
                s.setName(name);
                s.setAge(age);
                s.setAddress(address);
                break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "Quản lý sinh viên");
        request.setAttribute("studentList", studentsList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            int age = Integer.parseInt(request.getParameter("age"));
            String address = request.getParameter("address"); // Thêm địa chỉ

            Student newStudent = new Student(name, studentId, age, address);
            studentsList.add(newStudent);

            response.sendRedirect(request.getContextPath() + "/listStudents");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Tuổi phải là số hợp lệ!");
            doGet(request, response);
        }
    }
}
