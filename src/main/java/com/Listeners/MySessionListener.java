package com.Listeners;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebListener
public class MySessionListener implements  HttpSessionListener {

    public MySessionListener() {
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        System.out.println("Session Created::ID="+se.getSession().getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        System.out.println("Session is Destroyed::ID="+se.getSession().getId());
    }


}
