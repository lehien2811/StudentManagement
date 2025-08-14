package com.example.model;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class MongoDBTest {
    public static void main(String[] args) {
        String uri = "mongodb+srv://lehien:lehien123@cluster0.ok1pkwh.mongodb.net/student_db?retryWrites=true&w=majority&appName=Cluster0";
        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("student_db");
            System.out.println("Connected to database: " + database.getName());
            MongoCollection<Document> collection = database.getCollection("students");
            Document student = new Document("name", "John Doe")
                             .append("age", 20)
                             .append("grade", "A")
                             .append("testTime", System.currentTimeMillis());
            collection.insertOne(student);
            System.out.println("Student inserted: " + student.toJson());
        } catch (Exception e) {
            System.err.println("Error: ");
            e.printStackTrace();
        }
    }
}