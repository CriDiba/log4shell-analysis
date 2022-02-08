package com.app;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final Logger logger = LogManager.getLogger("LoginServlet");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("uname");
        String password = req.getParameter("password");

        logger.info("User " + userName + " tried to log in");

        if (userName.equals("admin") && password.equals("password")) {
            RequestDispatcher view = req.getRequestDispatcher("dashboard.jsp");
            view.forward(req, resp);
        } else {
            req.setAttribute("errors", true);
            RequestDispatcher view = req.getRequestDispatcher("index.jsp");
            view.forward(req, resp);
        }
    }
}