package com.Controller.Post;

import com.DAO.PostDao;
import com.Entity.Posts;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DisplayPostServlet", value = "/DisplayPostServlet")
public class DisplayPostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String getUsername = request.getParameter("username");
        PostDao postDao = new PostDao();
        List<Posts> getPost = postDao.queryLatestInsertPost(getUsername);

        if(!getPost.isEmpty()){
            request.setAttribute("getPost", getPost);
            System.out.println("Listing post to user");
            response.sendRedirect("User/q/displayPost.jsp");
            System.out.println("Post listed to User");
        }else{
            System.out.println("cannot list post to user");
            request.getRequestDispatcher("/UserServlet").forward(request, response);
        }
    }
}
