package com.example.model;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnection {
    private static final String CONNECTION_STRING = "mongodb://localhost:27017";
    private static final String DATABASE_NAME = "student_db";

    private static MongoClient mongoClient = null;

    static {
        try {
            mongoClient = MongoClients.create(CONNECTION_STRING);
            System.out.println("✅ Kết nối MongoDB thành công!");
        } catch (Exception e) {
            System.err.println("❌ Lỗi kết nối MongoDB: " + e.getMessage());
        }
    }

    public static MongoDatabase getDatabase() {
        return mongoClient.getDatabase(DATABASE_NAME);
    }
}
