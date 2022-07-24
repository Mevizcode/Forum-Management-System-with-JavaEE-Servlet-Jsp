package com.Controller.Admin;

import com.DAO.UserDao;
import com.Entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet(name = "AddUserServlet", value = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    private static final SimpleDateFormat birthdayFormatter = new SimpleDateFormat("yyyy-MM-dd");

    public void init(){
        logger.info("Trying to add a new User..........");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        request.setCharacterEncoding("utf8");
        user.setUsername(request.getParameter("username"));
        user.setFirstName(request.getParameter("firstname"));
        user.setLastName(request.getParameter("lastname"));
        user.setEmail(request.getParameter("email"));
        user.setGender(request.getParameter("gender"));
        try{
            java.util.Date utilDate = birthdayFormatter.parse(request.getParameter("birthday"));
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            user.setBirthday(sqlDate);
        }catch (Exception e){
            e.printStackTrace();
        }
        user.setAge(Long.parseLong(request.getParameter("age")));
        user.setMobile(request.getParameter("mobile"));
        user.setAddress(request.getParameter("address"));
        user.setPassword(request.getParameter("password"));

        UserDao userDao = new UserDao();

        boolean result = false;
        result = userDao.addUser(user);
        if(result){
            logger.info(user.getUsername()+ " Added Successfully at "+birthdayFormatter.format(System.currentTimeMillis()));
            logger.info("new user counter raised");
            RequestDispatcher rd = request.getRequestDispatcher("/userListServlet");
            rd.forward(request, response);
        }else{
            logger.warn("Unable to add new user!", new Throwable());
            RequestDispatcher rd = request.getRequestDispatcher("admin/addUser.jsp");
            rd.forward(request, response);
        }
    }
}
