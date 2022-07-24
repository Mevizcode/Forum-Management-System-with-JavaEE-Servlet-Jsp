package com.Controller.User;

import com.DAO.UserDao;
import com.Entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User(username,password);
        UserDao userDao = new UserDao();
        boolean test = userDao.checkLogin(user,request);
        if(test){
            HttpSession session = request.getSession();
            session.setAttribute("loginSuccess", "Login Successful!");
            session.setAttribute("username",username);
            session.setAttribute("is_login", "is_login");
            if ((username != null) && (username.equals("admin"))) {
                System.out.println("admin redirected to /AdminServlet");
                request.getRequestDispatcher("/AdminServlet").forward(request, response);
            } else {
                logger.info("---- user forwarded to UserServlet-------");
                request.getRequestDispatcher("/UserServlet").forward(request, response);
            }
        } else{
            request.setAttribute("loginError", "invalid username/email or password! Please try again!");
            logger.error("cannot login");
            response.sendRedirect("User/login.jsp");
        }
    }
}
