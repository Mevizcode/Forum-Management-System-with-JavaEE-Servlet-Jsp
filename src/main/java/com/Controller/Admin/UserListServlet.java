package com.Controller.Admin;

import com.DAO.UserDao;
import com.Entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userListServlet", value = "/userListServlet")
public class UserListServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        try{
            int pageNum = 1;
            String pageIndex = request.getParameter("pageIndex");
                if (pageIndex != null){
                    pageNum = Integer.parseInt(pageIndex);
                }
            //obtain the number of total users;
            List<User> userList = userDao.queryAllUser();
            int totalUsers = userList.size();
            int usersPerPage = 5;
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pageNum - 1) * usersPerPage; //To make sure the first record start from 0
            int endIndex = beginIndex + usersPerPage;
            List<User> users = userDao.listUsersByPage(beginIndex, usersPerPage);

            if ((!userList.isEmpty()) && (totalUsers != 0)){
                System.out.println(userList.size()+" user(s) found in the database");
                request.setAttribute("users", users);
                request.setAttribute("userList", userList);
                request.setAttribute("pageIndex", pageNum);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("beginIndex",beginIndex);
                request.setAttribute("endIndex", endIndex);
                RequestDispatcher rd = request.getRequestDispatcher("admin/userList.jsp");
                rd.forward(request, response);
            }else{
                System.out.println("No User(s) found in the database");
                logger.info("No User(s) found in the database");
                request.setAttribute("users",users);
                request.setAttribute("userList",userList);
                RequestDispatcher rd =  request.getRequestDispatcher("admin/userList.jsp");
                rd.forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
        }
    }
}
