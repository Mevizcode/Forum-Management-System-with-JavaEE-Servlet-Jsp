package com.Controller.User;

import com.DAO.UserDao;
import com.Entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "UpdateProfile", value = "/UpdateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    private static final SimpleDateFormat birthdayFormatter = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        response.setCharacterEncoding("utf8");
        user.setId(request.getParameter("Id"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setFirstName(request.getParameter("firstname"));
        user.setLastName(request.getParameter("lastname"));
        user.setGender(request.getParameter("gender"));
        try {
            java.util.Date  utilDate = birthdayFormatter.parse(request.getParameter("birthday"));
            Date sqlDate = new Date(utilDate.getTime());
            user.setBirthday(sqlDate);
        } catch (ParseException e) {
            e.printStackTrace();
            logger.error(e);
        }
        user.setAge(Long.parseLong(request.getParameter("age")));
        user.setAddress(request.getParameter("address"));
        user.setMobile(request.getParameter("mobile"));
        user.setPassword(request.getParameter("password"));

        UserDao userDao = new UserDao();
        boolean test = userDao.updateUser(user);
        if(test){
            System.out.println(user.getUsername()+" Is updated successfully!");
            logger.info(user.getUsername()+" is updated successfully!");
        }else {
            System.out.println("Fail to update (user) = "+user.getUsername());
            logger.warn("Fail to update (user) = "+user.getUsername(), new Throwable());
        }
        request.setAttribute("username",user.getUsername());
        request.getRequestDispatcher("/userProfileServlet").forward(request, response);
    }
}
