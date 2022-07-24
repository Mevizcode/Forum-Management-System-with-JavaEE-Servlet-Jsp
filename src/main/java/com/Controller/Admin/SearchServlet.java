package com.Controller.Admin;

import com.DAO.UserDao;
import com.Entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchBar = request.getParameter("searchStr");
        UserDao userDao = new UserDao();
        List<User> SearchCount = userDao.searchUserCount(searchBar);

        try{
            int pageNum = 1;
            String pageIndex = request.getParameter("pageIndex");
            if(pageIndex != null){
                pageNum = Integer.parseInt(pageIndex);
            }
            //List<User> userList = userDao.queryAllUser();
            int usersPerPage = 10;
            int startIndex = (pageNum - 1) * usersPerPage;
            List<User> search =  userDao.searchUser(searchBar,startIndex,usersPerPage);
            int totalUsers = SearchCount.size();

            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;

            if ((!search.isEmpty()) && (totalUsers != 0)) {
                request.setAttribute("searchResult", search);
                request.setAttribute("pageIndex", pageNum);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("searchCount", SearchCount);
                RequestDispatcher rd = request.getRequestDispatcher("admin/searchResult.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("info", "No result found");
                System.out.println("Search Operation failed!");
                request.getRequestDispatcher("admin/searchResult.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
