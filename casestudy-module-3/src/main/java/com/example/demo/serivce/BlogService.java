package com.example.demo.serivce;

import com.example.demo.model.Blog;
import com.example.demo.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogService {

    public static List<Blog> getPublicBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT b.id, b.title, b.content, b.category, b.created_at, u.username as author " +
                "FROM blogs b " +
                "JOIN users u ON b.author_id = u.id " +
                "WHERE b.status = TRUE " +
                "ORDER BY b.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setCategory(rs.getString("category"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(String.valueOf(rs.getTimestamp("created_at")));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static Blog getBlogDetail(int id) {
        String sql = "SELECT b.id, b.title, b.content, b.category, b.created_at, u.username as author " +
                "FROM blogs b " +
                "JOIN users u ON b.author_id = u.id " +
                "WHERE b.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setCategory(rs.getString("category"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(String.valueOf(rs.getTimestamp("created_at")));
                return b;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static boolean createBlog(Blog blog) {
        String sql = "INSERT INTO blogs(title, content, category, author_id, status, created_at) " +
                "SELECT ?, ?, ?, u.id, TRUE, NOW() FROM users u WHERE u.email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getContent());
            ps.setString(3, blog.getCategory());
            ps.setString(4, blog.getAuthor());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static List<Blog> getUserBlogs(String author) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT b.id, b.title, b.category, b.created_at, u.username as author " +
                "FROM blogs b " +
                "JOIN users u ON b.author_id = u.id " +
                "WHERE u.email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, author);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setCategory(rs.getString("category"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(String.valueOf(rs.getTimestamp("created_at")));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static boolean deleteBlog(int id) {
        String sql = "DELETE FROM blogs WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT b.id, b.title, b.content, b.category, b.created_at, u.username as author " +
                "FROM blogs b " +
                "JOIN users u ON b.author_id = u.id " +
                "ORDER BY b.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setCategory(rs.getString("category"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(String.valueOf(rs.getTimestamp("created_at")));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateBlog(Blog blog) {
        String sql = "UPDATE blogs b " +
                "JOIN users u ON b.author_id = u.id " +
                "SET b.title = ?, b.content = ?, b.category = ? " +
                "WHERE b.id = ? AND u.email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getContent());
            ps.setString(3, blog.getCategory());
            ps.setInt(4, blog.getId());
            ps.setString(5, blog.getAuthor());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Blog> searchBlogsByTitle(String keyword) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT b.id, b.title, b.content, b.category, b.created_at, u.username as author " +
                "FROM blogs b " +
                "JOIN users u ON b.author_id = u.id " +
                "WHERE b.status = TRUE AND b.title LIKE ? " +
                "ORDER BY b.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setCategory(rs.getString("category"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(String.valueOf(rs.getTimestamp("created_at")));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


}
