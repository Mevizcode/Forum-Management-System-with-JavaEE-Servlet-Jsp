package com.Controller.Post;

import com.DAO.PostDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "AskQuestionServlet", value = "/AskQuestionServlet")
public class PostQuestionServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * In this Servlet we are checking if user is active_status = 1,
         * then user is login forward user to question,jsp
         * else if user active_status = 0, user is not login send redirect to login.jsp
         * Please note ### User active_status ### is checked by the latest login record from the user log db
         **/
        HttpSession session = request.getSession();
        PostDao postDao = new PostDao();
        ResultSet rs = postDao.queryUserActiveStatus();
        try {
            if(rs.next()){
                session.setAttribute("userId", rs.getString("id"));
                request.setAttribute("username", rs.getString("username"));
                logger.info("------------- Querying user active status --------------");
                response.sendRedirect("User/q/question.jsp");
                logger.info("----------- User is Active! Redirecting to question.jsp -------------");
            }else{
                logger.warn("------User is Not Active! redirecting to login.jsp --------");
                response.sendRedirect("User/login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
