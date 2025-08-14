package com.example.model;

import com.mongodb.client.MongoDatabase;

public class MongoDBTest {
    public static void main(String[] args) {
        MongoDatabase db = MongoDBConnection.getDatabase();
        System.out.println("Database name: " + db.getName());
    }
}
