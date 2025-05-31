package com.example.demo.controller;

import com.example.demo.model.Blog;
import com.example.demo.model.User;
import com.example.demo.serivce.BlogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogController", urlPatterns = {
        "/blogs", "/blog/detail", "/blog/create",
        "/my-blogs", "/blog/delete", "/admin/blogs", "/blog/edit"
})
public class BlogController extends BaseController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/blogs":
                String keyword = request.getParameter("keyword");
                List<Blog> publicBlogs;

                if (keyword != null && !keyword.trim().isEmpty()) {
                    publicBlogs = BlogService.searchBlogsByTitle(keyword.trim());
                } else {
                    publicBlogs = BlogService.getPublicBlogs();
                }

                request.setAttribute("blogs", publicBlogs);
                renderView("/view/blog/BlogList.jsp", request, response);
                break;

            case "/blog/detail":
                int id = Integer.parseInt(request.getParameter("id"));
                Blog blog = BlogService.getBlogDetail(id);
                request.setAttribute("blog", blog);
                renderView("/view/blog/BlogDetail.jsp", request, response);
                break;

            case "/my-blogs":
                HttpSession session = request.getSession(false);
                User currentUser = (User) session.getAttribute("user");
                List<Blog> myBlogs = BlogService.getUserBlogs(currentUser.getEmail());
                request.setAttribute("myBlogs", myBlogs);
                renderView("/view/blog/MyBlog.jsp", request, response);
                break;

            case "/blog/create":
                HttpSession createSession = request.getSession(false);
                if (createSession == null || createSession.getAttribute("user") == null) {
                    response.sendRedirect("auth/signIn");
                    return;
                }
                renderView("/view/blog/CreateBlog.jsp", request, response);
                break;

            case "/blog/edit":
                int blogId = Integer.parseInt(request.getParameter("id"));
                Blog blogToEdit = BlogService.getBlogDetail(blogId);
                request.setAttribute("blog", blogToEdit);
                renderView("/view/blog/EditBlog.jsp", request, response);
                break;

            case "/blog/delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                BlogService.deleteBlog(deleteId);
                response.sendRedirect("my-blogs");
                break;

            case "/admin/blogs":
                List<Blog> allBlogs = BlogService.getAllBlogs();
                request.setAttribute("allBlogs", allBlogs);
                renderView("/view/blog/AdminBlogList.jsp", request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/blog/create".equals(path)) {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("user") == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Please log in to create a blog");
                return;
            }

            User user = (User) session.getAttribute("user");

            Blog blog = new Blog();
            blog.setTitle(request.getParameter("title"));
            blog.setContent(request.getParameter("content"));
            blog.setCategory(request.getParameter("category"));
            blog.setAuthor(user.getEmail());

            boolean result = BlogService.createBlog(blog);
            if (result) {
                request.setAttribute("message", "Blog posted successfully!");
            } else {
                request.setAttribute("error", "Failed to post the blog!");
            }
            renderView("/view/blog/CreateBlog.jsp", request, response);

        } else if ("/blog/edit".equals(path)) {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/auth/signIn");
                return;
            }

            User user = (User) session.getAttribute("user");

            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String category = request.getParameter("category");

            Blog blog = new Blog();
            blog.setId(id);
            blog.setTitle(title);
            blog.setContent(content);
            blog.setCategory(category);
            blog.setAuthor(user.getEmail());

            boolean updated = BlogService.updateBlog(blog);
            if (updated) {
                response.sendRedirect(request.getContextPath() + "/my-blogs");
            } else {
                request.setAttribute("error", "Failed to update the blog!");
                request.setAttribute("blog", blog);
                renderView("/view/blog/EditBlog.jsp", request, response);
            }
        }
    }

}
