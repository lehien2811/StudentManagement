package com.example.model;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    // Giữ MongoClient để tái sử dụng
    private static MongoClient mongoClient;
    private MongoCollection<Document> collection;

    // Hàm riêng để quản lý kết nối, chỉ kết nối một lần
    private void connectToMongo() throws ServletException {
        if (mongoClient == null) {
            // Thông tin kết nối của bạn
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
        // Gọi hàm kết nối khi Servlet được khởi tạo
        connectToMongo();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // Đảm bảo hỗ trợ tiếng Việt
        try {
            String name = req.getParameter("name");
            String studentId = req.getParameter("studentId"); // Mã sinh viên
            int age;
            try {
                age = Integer.parseInt(req.getParameter("age"));
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tuổi phải là số!");
                return;
            }

            // Thêm dữ liệu vào MongoDB
            Document student = new Document("name", name)
                    .append("studentId", studentId)
                    .append("age", age);

            collection.insertOne(student);

            // Chuyển hướng đến trang danh sách
            resp.sendRedirect(req.getContextPath() + "/listStudents");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lưu dữ liệu: " + e.getMessage());
        }
    }

    @Override
    public void destroy() {
        // Đóng kết nối khi ứng dụng dừng
        if (mongoClient != null) {
            mongoClient.close();
        }
    }
}
