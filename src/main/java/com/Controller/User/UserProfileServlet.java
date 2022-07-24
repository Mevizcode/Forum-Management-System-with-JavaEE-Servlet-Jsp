package com.Controller.User;

import com.DAO.UserDao;
import com.Entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userProfileServlet", value = "/userProfileServlet")
public class UserProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        String userId = request.getParameter("Id");
        System.out.println("user ID::"+userId);
        String username = (String) request.getSession().getAttribute("username");
        List<User> listUserInfo = userDao.queryUserByName(username);
            if (!listUserInfo.isEmpty()) {
                request.getSession().setAttribute("listUserInfo", listUserInfo);
                RequestDispatcher rd = request.getRequestDispatcher("User/userProfile.jsp");
                rd.forward(request, response);
            }
    }
}
