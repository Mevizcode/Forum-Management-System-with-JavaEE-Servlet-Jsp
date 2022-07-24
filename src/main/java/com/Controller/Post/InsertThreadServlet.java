package com.Controller.Post;

import com.DAO.PostDao;
import com.Entity.Thread;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "threadServlet", value = "/threadServlet")
public class InsertThreadServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * here we are inserting a new comment/answer/reply to a question
         * then display it to the user
         */
        PostDao postDao = new PostDao();
        //get thread parameters
        String content = request.getParameter("area");
        String username = request.getParameter("username");
        String postId = request.getParameter("this_post_ID");
        System.out.println("postId =  "+postId);
        //Integer convertId = Integer.valueOf(postId);
        Thread thread = new Thread(content);
        boolean result = postDao.insertThreadAnswer(username, thread, postId); //insert post answer into thread
        if(result){
            request.setAttribute("postId", postId);
            logger.info(username+ " -------Submit an answer to Question Id:: "+postId+" forwarding to ans.jsp");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/listThread");
            requestDispatcher.forward(request, response);
        }else{
            logger.warn(username+ " -----unable to submit answer to Question Id:: "+postId+" redirecting to index.jsp", new Throwable());
            request.getRequestDispatcher("/UserServlet");
        }
    }
}
