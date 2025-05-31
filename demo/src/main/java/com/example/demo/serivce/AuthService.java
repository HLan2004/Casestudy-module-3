package com.example.demo.serivce;

import com.example.demo.model.User;
import com.example.demo.utils.DBConnection;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;

public class AuthService {

    public static boolean signUp(HttpServletRequest req, HttpServletResponse resp) {

        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (password == null || !password.equals(confirmPassword)) {
            return false;
        }

        String role = req.getParameter("role");
        if (role == null || !(role.equalsIgnoreCase("USER") || role.equalsIgnoreCase("ADMIN"))) {
            role = "USER";
        } else {
            role = role.toUpperCase();
        }

        String sql = "INSERT INTO users(username, password, phoneNumber, email, address, role) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, req.getParameter("username"));
            ps.setString(2, password);
            ps.setString(3, req.getParameter("phoneNumber"));
            ps.setString(4, req.getParameter("email"));
            ps.setString(5, req.getParameter("address"));
            ps.setString(6, role);

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLIntegrityConstraintViolationException ex) {
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static User signIn(HttpServletRequest req, HttpServletResponse resp) {


        String sql = "SELECT id, email, role FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, req.getParameter("email"));
            ps.setString(2, req.getParameter("password"));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                // Lấy thêm role và gán vào User
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
