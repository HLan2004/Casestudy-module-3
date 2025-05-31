package com.example.demo.controller;

import com.example.demo.model.Blog;
import com.example.demo.model.User;

import com.example.demo.serivce.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminController", urlPatterns = {"/admin/*"})
public class AdminController extends BaseController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("/auth/signIn");
            return;
        }
        User currentUser = (User) session.getAttribute("user");
        if (!"ADMIN".equalsIgnoreCase(currentUser.getRole())) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied: ADMIN only.");
            return;
        }

        String path = req.getPathInfo();
        if (path == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        switch (path) {
            case "/blog/list":
                List<Blog> blogs = AdminService.getAllBlogs();
                req.setAttribute("blogs", blogs);
                renderView("/view/admin/AdminBlogList.jsp", req, resp);
                break;
            case "/user/list":
                List<User> users = AdminService.getAllUsers();
                req.setAttribute("users", users);
                renderView("/view/admin/AdminUserList.jsp", req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws  IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("/auth/signIn");
            return;
        }
        User currentUser = (User) session.getAttribute("user");
        if (!"ADMIN".equalsIgnoreCase(currentUser.getRole())) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied: ADMIN only.");
            return;
        }

        String path = req.getPathInfo();
        if (path == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        switch (path) {
            case "/blog/delete":
                String blogIdStr = req.getParameter("id");
                if (blogIdStr != null) {
                    try {
                        int blogId = Integer.parseInt(blogIdStr);
                        AdminService.deleteBlog(blogId);
                    } catch (NumberFormatException ignored) { }
                }
                resp.sendRedirect("/admin/blog/list");
                break;
            case "/user/delete":
                String userIdStr = req.getParameter("id");
                if (userIdStr != null) {
                    try {
                        int userId = Integer.parseInt(userIdStr);
                        AdminService.deleteUser(userId);
                    } catch (NumberFormatException ignored) { }
                }
                resp.sendRedirect("/admin/user/list");
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
}
