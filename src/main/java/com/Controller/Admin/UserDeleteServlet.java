package com.Controller.Admin;

import com.DAO.UserDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDeleteServlet", value = "/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("id");
        UserDao userDao = new UserDao();
        boolean test = userDao.deleteUser(userID);

        if (test){
            logger.info(userID + " has been deleted!");
            //request.setAttribute("deleteUserCount");
            request.getRequestDispatcher("/userListServlet").forward(request,response);
        }else{
            logger.info("Fail to delete "+ userID +"! Please try again");
            request.getRequestDispatcher("/userListServlet").forward(request,response);
        }
    }
}
