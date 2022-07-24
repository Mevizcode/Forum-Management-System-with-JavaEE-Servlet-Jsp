package com.Filters;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "answerQuestionFilter", value = {"/ans.jsp", "/settings.jsp", "/userProfile.jsp"})
public class answerQuestionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req= (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String username = null;

        if(session.getAttribute("username")==null){
            resp.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Please Login to continue!');");
            pw.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.include(request, response);
        }
        chain.doFilter(request, response);
    }
}
