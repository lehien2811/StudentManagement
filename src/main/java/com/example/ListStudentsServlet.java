package com.example.model;

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

    private void connectToMongo() throws ServletException {
        if (mongoClient == null) {
            try {
                mongoClient = MongoClients.create("mongodb://localhost:27017");
            } catch (Exception e) {
                throw new ServletException("Không thể kết nối MongoDB: " + e.getMessage());
            }
        }
        MongoDatabase database = mongoClient.getDatabase("student_db");
        this.collection = database.getCollection("students");
    }

    @Override
    public void init() throws ServletException {
        connectToMongo();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Document> studentList = new ArrayList<>();
        for (Document doc : collection.find()) {
            studentList.add(doc);
        }

        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("/listStudents.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        if (mongoClient != null) {
            mongoClient.close();
        }
    }
}
