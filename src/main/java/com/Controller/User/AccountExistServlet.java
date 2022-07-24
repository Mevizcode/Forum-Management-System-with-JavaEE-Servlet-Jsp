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

@WebServlet(name = "AccountExistServlet", value = "/AccountExistServlet")
public class AccountExistServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    public void init(){
        logger.info("...........................Checking is username exist.......................");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //prevent browser cache
        response.setContentType("text/plain");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires", 0);

        //get parameter
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        UserDao userDao = new UserDao();
        ResultSet checkName = userDao.checkUsernameExist(username);
        try {
            if(checkName.next()){
                out.println("Username already taken, Please choose a valid username!");
                logger.info(username+" Account Exist, Username invalid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
