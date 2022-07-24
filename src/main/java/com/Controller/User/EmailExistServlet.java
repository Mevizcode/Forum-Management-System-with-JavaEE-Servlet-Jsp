package com.Controller.User;

import com.DAO.UserDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "EmailExistServlet", value = "/EmailExistServlet")
public class EmailExistServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //prevent browser cache
        response.setContentType("text/xml");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires", 0);

        //server-side validation
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        UserDao userDao = new UserDao();
        ResultSet rs = userDao.checkEmailExist(email);

        //test
        try {
            if(rs.next()){
                out.println("Email already in use! Please input a valid email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
