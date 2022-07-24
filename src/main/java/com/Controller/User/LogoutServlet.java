package com.Controller.User;

import com.DAO.UserDao;
import com.Entity.User;
import com.Entity.UserLog;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

@WebServlet(name = "logoutServlet", value = "/logoutServlet")
public class LogoutServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if ((request.getSession(false)) != null && (request.getSession().getAttribute("username") != null)) {
            String username = (String) request.getSession().getAttribute("username");
            User user = new User();
            user.setUsername(username);

            request.getSession().invalidate();
            logger.info("logged out!");

            UserLog userLog = new UserLog();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
            String logoutTime = simpleDateFormat.format(new Date(System.currentTimeMillis()));
            userLog.setLogoutTime(logoutTime);

            UserDao userDao = new UserDao();
            boolean result = userDao.setLogoutTime(user, userLog);
            boolean updateActive = userDao.updateActiveStatus(userLog);

            if (result) {
                ResultSet rs = userDao.getUserLogDetails(username);
                try {
                    if (rs.next()) {
                        //get user login and logout time from resultSet
                        String login = rs.getString("login_time");
                        String logout = rs.getString("logout_time");

                        //parse to date
                        Date loginTime = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z").parse(login);
                        Date logout_Time = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z").parse(logout);

                        //get difference between login & logout time in milliseconds
                        long activeTime = Math.abs(loginTime.getTime() - logout_Time.getTime());

                        //convert to hour:minute:seconds
                        String userActiveTime = String.format("%02d:%02d:%02d",
                                TimeUnit.MILLISECONDS.toHours(activeTime) % 24,
                                TimeUnit.MILLISECONDS.toMinutes(activeTime) % 60,
                                TimeUnit.MILLISECONDS.toSeconds(activeTime) % 60);

                        //update active_time
                        userLog.setActive_time(String.valueOf(userActiveTime));
                        boolean test = userDao.setActiveTime(user, userLog);
                        if (test) {
                            System.out.println("active time set!");
                        } else {
                            System.out.println("active time not set");
                        }

                    }
                } catch (SQLException | ParseException e) {
                    e.printStackTrace();
                }
            }
        }
        response.sendRedirect("User/login.jsp");
    }
}
