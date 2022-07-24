package com.Filters;

import com.Entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
//value = "/com.Controller/*"

@WebFilter(filterName = "loginFilter", value = "/com.Controller/*")
public class loginFilter implements Filter {
    private static final Logger logger = Logger.getLogger(Logger.class);

    public loginFilter(){
        logger.info("login filter is constructed");
    }
    public void init(FilterConfig config) throws ServletException {
        logger.info("login filter is instantiated");
    }

    public void destroy() {
        logger.info("login filter is destroyed");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req= (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String username = null;

        if(session.isNew()){
            chain.doFilter(request, response);
            logger.info("login filter is chained");
            resp.sendRedirect("login.jsp");
        }else{
            if(session.getAttribute("username") == null){

                logger.info("second condition login filter is chained");
                resp.sendRedirect("login.jsp");
            }else if(username.equals("admin")){
                logger.info(session.getAttribute("username")+" Login Successfully");
                resp.sendRedirect("admin/admin.jsp");
            }else {
                logger.info(session.getAttribute("username")+" Login Successfully");
                resp.sendRedirect("index.jsp");
            }
        }
        chain.doFilter(request, response);
    }
}
