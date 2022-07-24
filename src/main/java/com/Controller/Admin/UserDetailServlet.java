package com.Controller.Admin;

import com.DAO.UserDao;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "UserDetailServlet", value = "/UserDetailServlet")
public class UserDetailServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Logger.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDao userDao = new UserDao();

        ResultSet rs = userDao.queryUserByUsername(id);
        try{
            if(rs.next()){
                request.setAttribute("userDetails", rs);
                RequestDispatcher rd =   request.getRequestDispatcher("admin/userDetail.jsp");
                rd.forward(request, response);
            }else{
                logger.error("unable to show user " +id);
                request.getRequestDispatcher("/userListServlet").forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
