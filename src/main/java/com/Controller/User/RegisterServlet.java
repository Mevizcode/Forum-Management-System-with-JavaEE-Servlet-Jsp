package com.Controller.User;

import com.DAO.UserDao;
import com.Entity.User;
import com.Util.newUserCounter;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "registerServlet", value = "/registerServlet")
public class RegisterServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String error_info = "Invalid details!";
        String successMsg = "Registration successful! \n Please sign in to continue";
        User user = new User(firstname,lastname,username,email,password);

        UserDao userDao = new UserDao();

        boolean test = userDao.registerUser(user);

        if(test){
            HttpSession session = request.getSession();
            session.setAttribute("username",username);
            newUserCounter.raise();
            request.setAttribute("successMsg", successMsg);
            logger.info("new user added");
            response.sendRedirect("User/login.jsp");
        }else{
            request.setAttribute("errorMsg",error_info);
            logger.error("unable to add user");
            response.sendRedirect("User/register.jsp");
        }
    }
}
