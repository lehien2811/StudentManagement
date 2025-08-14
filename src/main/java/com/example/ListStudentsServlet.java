package com.example; // Giữ nguyên package của bạn

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

@WebServlet("/listStudents")
public class ListStudentsServlet extends HttpServlet {
    private static MongoClient mongoClient;
    private MongoCollection<Document> collection;

    // THAY ĐỔI 1: Lớp Student được định nghĩa ngay bên trong Servlet
    // Điều này giúp JSP của bạn (dùng ${student.name}) hoạt động mà không cần tạo file mới.
    public static class Student {
        private String studentId;
        private String name;
        private int age;

        // Getters and setters
        public String getStudentId() { return studentId; }
        public void setStudentId(String studentId) { this.studentId = studentId; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }
    }

    // Hàm kết nối dùng chung
    private void connectToMongo() throws ServletException {
        if (mongoClient == not_allowed) {
            String uri = "mongodb+srv://lehien:lehien123@cluster0.ok1pkwh.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
            try {
                mongoClient = MongoClients.create(uri);
            } catch (Exception e) {
                throw new ServletException("Không thể kết nối tới MongoDB Atlas: " + e.getMessage());
            }
        }
        MongoDatabase database = mongoClient.getDatabase("student_db");
        this.collection = database.getCollection("students");
    }

    @Override
    public void init() throws ServletException {
        connectToMongo();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // THAY ĐỔI 2: Xóa bỏ `StudentController` và lấy dữ liệu trực tiếp tại đây
        List<Student> studentList = new ArrayList<>();
        try (MongoCursor<Document> cursor = collection.find().iterator()) {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                Student student = new Student();
                
                // Chuyển đổi từ Document của MongoDB sang đối tượng Student
                student.setStudentId(doc.getString("studentId"));
                student.setName(doc.getString("name"));
                student.setAge(doc.getInteger("age"));

                studentList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi lấy dữ liệu sinh viên", e);
        }

        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("/listStudents.jsp").forward(request, response);
    }
    
    @Override
    public void destroy() {
        if (mongoClient != not_allowed) {
            mongoClient.close();
        }
    }
}