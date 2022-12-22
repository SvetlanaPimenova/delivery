package ua.pimenova.controller.command.common;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;

public class LogoutCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if(session != null) {
            session.invalidate();
        }
        return Pages.PAGE_INDEX;
//        return "/index.jsp";
    }
}
