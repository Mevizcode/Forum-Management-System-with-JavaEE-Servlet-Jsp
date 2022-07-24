package com.Controller.User;

import com.DAO.UserDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ResetPasswordHandler", value = "/ResetPasswordHandler")
public class ResetPasswordServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ResetPasswordServlet.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String getUserID = request.getParameter("userid");
        String newPassword = request.getParameter("password");
        System.out.println("User Id::" +getUserID);
        UserDao userDao = new UserDao();

        boolean result = userDao.updatePassword(newPassword,getUserID);
        if(result){
            logger.info("User password updated successfully, ID::"+getUserID);
            request.setAttribute("updated","Password changed successful!");
            response.sendRedirect("User/login.jsp");
        }else{
            logger.warn("Unable to update password", new Throwable());
            request.setAttribute("updateFail","unable to change password, please retry again!");
            response.sendRedirect("User/login.jsp");
        }
    }
}
