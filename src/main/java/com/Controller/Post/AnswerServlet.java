package com.Controller.Post;

import com.DAO.PostDao;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "answerServlet", value = "/answerServlet")
public class AnswerServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * In this Servlet, I'm querying the database by postID
         * Retrieve the post details and display it in ans.jsp
         */

        String postId = request.getParameter("postId");
        PostDao postDao = new PostDao();
        ResultSet myPost = postDao.queryPost(postId);
        try {
            if (myPost.next()) {
                request.setAttribute("myPost", myPost);
                request.setAttribute("postId", postId);
                logger.info(".........Query post by ID Successful, forwarding to ans.jsp..............");
                request.getRequestDispatcher("User/q/ans.jsp").forward(request, response);
            } else {
                logger.warn("......... Query post by ID failed, redirect to index.jsp ..............", new Throwable());
                response.sendRedirect("User/index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
