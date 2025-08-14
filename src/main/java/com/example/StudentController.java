package com.example;

import com.example.model.Student;
import com.mongodb.client.*;
import org.bson.Document;

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

    private static MongoClient mongoClient;
    private static MongoCollection<Document> collection;

    @Override
    public void init() throws ServletException {
        try {
            // Kết nối MongoDB local
            mongoClient = MongoClients.create("mongodb://localhost:27017");
            MongoDatabase database = mongoClient.getDatabase("student_db");
            collection = database.getCollection("students");
        } catch (Exception e) {
            throw new ServletException("Không thể kết nối MongoDB: " + e.getMessage());
        }
    }

    public static List<Student> getStudentsList() {
        List<Student> students = new ArrayList<>();
        FindIterable<Document> docs = collection.find();
        for (Document doc : docs) {
            String name = doc.getString("name");
            String studentId = doc.getString("studentId");
            int age = doc.getInteger("age", 0);
            String address = doc.getString("address");
            students.add(new Student(name, studentId, age, address));
        }
        return students;
    }

    public static Student getStudentById(String studentId) {
        Document doc = collection.find(new Document("studentId", studentId)).first();
        if (doc != null) {
            return new Student(
                    doc.getString("name"),
                    doc.getString("studentId"),
                    doc.getInteger("age", 0),
                    doc.getString("address")
            );
        }
        return null;
    }

    public static void updateStudent(String oldStudentId, String newStudentId, String name, int age, String address) {
        Document query = new Document("studentId", oldStudentId);
        Document update = new Document("$set", new Document("studentId", newStudentId)
                .append("name", name)
                .append("age", age)
                .append("address", address));
        collection.updateOne(query, update);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "Quản lý sinh viên");
        request.setAttribute("studentList", getStudentsList());
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            int age = Integer.parseInt(request.getParameter("age"));
            String address = request.getParameter("address");

            Document newStudent = new Document("name", name)
                    .append("studentId", studentId)
                    .append("age", age)
                    .append("address", address);

            collection.insertOne(newStudent);

            response.sendRedirect(request.getContextPath() + "/listStudents");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Tuổi phải là số hợp lệ!");
            doGet(request, response);
        }
    }

    @Override
    public void destroy() {
        if (mongoClient != null) {
            mongoClient.close();
        }
    }
}
