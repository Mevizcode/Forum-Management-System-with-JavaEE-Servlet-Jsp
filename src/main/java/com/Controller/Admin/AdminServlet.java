package com.Controller.Admin;

import com.DAO.PostDao;
import com.DAO.UserDao;
import com.Entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        PostDao postDao = new PostDao();
        List<User> userList = userDao.queryAllUser();
        List<User> rs_NewlyAdded = userDao.queryNewlyAddedUser();
        ResultSet countTotalPosts = postDao.countTotalPosts();
        ResultSet getUserByMaxActiveTime = userDao.queryMaxActiveTimePerUser();
        if((!userList.isEmpty()) && (!rs_NewlyAdded.isEmpty())) {
            request.getServletContext().setAttribute("countTotalUsers", userList);
            System.out.println("Admin Login!");
            request.setAttribute("newlyAdded", rs_NewlyAdded);
            request.setAttribute("setUserByMaxActiveTime", getUserByMaxActiveTime);
            request.setAttribute("countTotalPosts", countTotalPosts);
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
        }else{
            System.out.println("Cannot login");
        }
    }
}
