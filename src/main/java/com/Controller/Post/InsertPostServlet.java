package com.Controller.Post;

import com.DAO.PostDao;
import com.Entity.Posts;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "questionServlet", value = "/questionServlet")
public class InsertPostServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * Here we are inserting a new post to the db
         * if successful forward user to DisplayPostServlet
         */

        //get parameters
        String postTitle = request.getParameter("title");
        String content = request.getParameter("area");
        String username = request.getParameter("username");
       // String trimHtmlTags = content.replaceAll("\\<.*?\\>", "");
        Posts posts = new Posts(postTitle,content);
        PostDao postDao = new PostDao();
        try {
            boolean result = postDao.insertNewPost(username, posts); //insert into new post into db
            if(result){
                logger.info("-----------New Question posted by "+username+" postTitle: "+postTitle+"----------");
                request.setAttribute("username", username);
                request.getRequestDispatcher("/DisplayPostServlet").forward(request,response);
               //response.sendRedirect("User/q/ans.jsp"); //User/q/ans.jsp
            }else{
                logger.warn("---------Unable to post this question---------", new Throwable());
                response.sendRedirect("/UserServlet");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
