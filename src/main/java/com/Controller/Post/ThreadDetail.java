package com.Controller.Post;

import com.DAO.PostDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "listThread", value = "/listThread")
public class ThreadDetail extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * list all threads per post
         */
        String postId = request.getParameter("id");
        PostDao postDao = new PostDao();
        ResultSet queryPostById = postDao.queryPost(postId);
        List<com.Entity.Thread> listThreadsPerPost = postDao.queryThreadPerPost(postId);
        try {
            if (queryPostById.next() && (!listThreadsPerPost.isEmpty())){
                request.setAttribute("listPost", queryPostById);
                request.setAttribute("post_Id", postId);
                request.setAttribute("listThreadsPerPost", listThreadsPerPost);
                logger.info("---- List Threads Per Posts -------");
                request.getRequestDispatcher("User/q/threadContext.jsp").forward(request, response);
            }else{
                logger.warn("---- unable to list thread ----", new Throwable());
                request.getRequestDispatcher("/UserServlet").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
