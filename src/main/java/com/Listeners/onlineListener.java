package com.Listeners;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebListener
public class onlineListener implements HttpSessionListener, HttpSessionAttributeListener {

    private static final Logger logger = Logger.getLogger(Logger.class);

    public onlineListener() {
        logger.info("onlineListener class is instantiated!");
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        onlineUserCounter.raise();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        onlineUserCounter.reduce();
        logger.debug("A user logged out");
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
        System.out.println("Added an attribute "+sbe);
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
        System.out.println("Removed an attribute "+sbe);
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
