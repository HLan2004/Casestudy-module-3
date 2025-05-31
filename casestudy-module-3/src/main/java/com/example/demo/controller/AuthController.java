package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.serivce.AuthService;
import com.example.demo.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "authController", urlPatterns ={ "/" ,"/auth/*"})
public class AuthController extends BaseController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();

        if (path == null || path.equals("/")) {
            renderView("/view/auth/SignIn.jsp", req, resp);
            return;
        }


        switch (path) {
            case "/signIn":
                renderView("/view/auth/SignIn.jsp", req, resp);
                break;
            case "/signUp":
                renderView("/view/auth/SignUp.jsp", req, resp);
                break;
            case "/logout":

                HttpSession session = req.getSession(false);
                if (session != null) {
                    session.invalidate();
                }

                resp.sendRedirect("/auth/signIn");
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String path = req.getPathInfo();

        if (path == null || path.equals("/")) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }


        switch (path) {
            case "/signIn":

                User user = AuthService.signIn(req, resp);
                if (user != null) {

                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);


                    String role = user.getRole();
                    if ("ADMIN".equalsIgnoreCase(role)) {

                        resp.sendRedirect("/admin/blog/list");
                    } else {

                        resp.sendRedirect("/blogs");
                    }
                } else {

                    req.setAttribute("error", "Invalid email or password");
                    renderView("/view/auth/SignIn.jsp", req, resp);
                }
                break;

            case "/signUp":

                if (AuthService.signUp(req, resp)) {

                    resp.sendRedirect("/auth/signIn");
                } else {

                    req.setAttribute("error", "Sign up failed");
                    renderView("/view/auth/SignUp.jsp", req, resp);
                }
                break;

            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    public void destroy() {
        DBConnection.closeConnection();
    }
}
