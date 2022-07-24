package com.Controller.User;

import com.DAO.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "emailVerifyHandler", value = "/emailVerifyHandler")
public class ForgetPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //prevent browser caching
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires",0);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        UserDao userDao = new UserDao();
        String inputEmail = request.getParameter("email");
        ResultSet rs = userDao.checkEmailExist(inputEmail);
        try {
            if (rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("verifiedID", rs.getString("id"));
                response.sendRedirect("User/ResetPassword.jsp");
            }else{
                //response.getWriter().println("Invalid Email");
                response.sendRedirect("User/login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
