package com.Listeners;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebListener
public class MyServletRequestListener implements ServletRequestListener {

    public MyServletRequestListener() {
    }

    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
        ServletRequest servletRequest = servletRequestEvent.getServletRequest();
        System.out.println("ServletRequest destroyed. Remote IP="+servletRequest.getRemoteAddr());
    }

    public void requestInitialized(ServletRequestEvent sre) {
        ServletRequest servletRequest = sre.getServletRequest();
        System.out.println("ServletRequest initialized. Remote IP="+servletRequest.getRemoteAddr());
    }


}
