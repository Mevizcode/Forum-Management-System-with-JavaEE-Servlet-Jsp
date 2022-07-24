package com.Controller.Admin;

import com.DAO.UserDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "UserLogServlet", value = "/UserLogServlet")
public class UserLogServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        ResultSet rs = userDao.queryUserLoginTimes();
        request.setAttribute("userLogs",rs);

        ResultSet gender_rs = userDao.queryUserGenders();
        request.setAttribute("userLog_gender_rs",gender_rs);

        ResultSet totalLoginsPerDay = userDao.queryDailyLogin();
        request.setAttribute("dailyLogins",totalLoginsPerDay);

        ResultSet activeTimePerUser = userDao.queryUserByActiveTime();
        request.setAttribute("activeTimePerUser",activeTimePerUser);

        RequestDispatcher rd = request.getRequestDispatcher("admin/UserLogs.jsp");
        rd.forward(request, response);
    }
}
