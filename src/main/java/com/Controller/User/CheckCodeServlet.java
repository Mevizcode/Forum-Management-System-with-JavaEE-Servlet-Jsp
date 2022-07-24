package com.Controller.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CheckCodeServlet", value = "/CheckCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String verifyCaptcha = request.getParameter("checkCode");
        String captcha = request.getSession().getAttribute("captcha_security").toString();
        if (verifyCaptcha.equals(captcha)){
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter pw = response.getWriter();
            pw.println("Code_Valid!");
        }else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter pw = response.getWriter();
            pw.println("Code_invalid");
        }
    }
}
