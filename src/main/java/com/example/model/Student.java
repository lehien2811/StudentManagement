package com.example.model;

public class Student {
    private String name;
    private String studentId;
    private int age;
    private String address; // Thêm địa chỉ

    public Student(String name, String studentId, int age, String address) {
        this.name = name;
        this.studentId = studentId;
        this.age = age;
        this.address = address;
    }

    // Nếu bạn vẫn cần constructor cũ (không có address)
    public Student(String name, String studentId, int age) {
        this(name, studentId, age, "");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
