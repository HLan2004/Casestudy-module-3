package com.example.demo.serivce;

import com.example.demo.model.Blog;
import com.example.demo.model.User;
import com.example.demo.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    public static List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String sql =
                "SELECT " +
                        "  b.id, " +
                        "  b.title, " +
                        "  b.content, " +
                        "  u.username AS author, " +
                        "  b.created_at, " +
                        "  b.category " +
                        "FROM blogs b " +
                        "JOIN users u ON b.author_id = u.id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(rs.getTimestamp("created_at").toString());
                b.setCategory(rs.getString("category"));
                blogs.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public static boolean deleteBlog(int id) {
        String sql = "DELETE FROM blogs WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, phoneNumber, email, address, role FROM users";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPhoneNumber(rs.getString("phoneNumber"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static boolean deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
