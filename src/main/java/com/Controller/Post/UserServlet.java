package com.Controller.Post;

import com.DAO.PostDao;
import com.Entity.Posts;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDao postDao = new PostDao();
        List<Posts> postsList = postDao.queryAllPost();
        List<Posts> listPostByTitle = postDao.queryPostsByTitle();
        int totalPosts = postsList.size();
        if((!postsList.isEmpty()) && (!listPostByTitle.isEmpty())){
            request.setAttribute("totalPosts", totalPosts);
            request.setAttribute("listPostByTitle",listPostByTitle);
            request.getServletContext().setAttribute("postsList", postsList);
            System.out.println("posts listed");
            request.getRequestDispatcher("User/index.jsp").forward(request, response);
        }else{
            System.out.println("No posts found");
            request.setAttribute("errorMsg", "No posts found");
            response.sendRedirect("User/index.jsp");
        }
    }
}
