package com.example;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/update")
public class UpdateApiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ObjectMapper mapper = new ObjectMapper();

        // Parse JSON từ body request
        Student student = mapper.readValue(request.getInputStream(), Student.class);

        // Kiểm tra dữ liệu bắt buộc
        if (student.getStudentId() == null || student.getName() == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

            Map<String, String> error = new HashMap<>();
            error.put("error", "Missing parameters");

            mapper.writeValue(response.getWriter(), error);
            return;
        }

        // Giả sử cập nhật thành công
        Map<String, Object> result = new HashMap<>();
        result.put("message", "Student updated successfully");
        result.put("student", student);

        mapper.writeValue(response.getWriter(), result);
    }
}
