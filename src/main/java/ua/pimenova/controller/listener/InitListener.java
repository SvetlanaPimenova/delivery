package ua.pimenova.controller.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class InitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        initCommandFactory();
    }

    private void initCommandFactory() {

        // initialize commands container
        // just load class to JVM
        try {
            Class.forName("ua.pimenova.controller.command.CommandFactory");
        } catch (ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
