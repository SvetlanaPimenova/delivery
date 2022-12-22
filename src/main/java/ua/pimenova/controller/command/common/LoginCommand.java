package ua.pimenova.controller.command.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.User;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.UserService;

import java.io.IOException;

public class LoginCommand implements ICommand {

    private final UserService userService;

    public LoginCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String login = request.getParameter("emaillogin");
        String password = request.getParameter("passlogin");
        String forward = Pages.PAGE_INDEX;
        User user;
        try {
            user = userService.getUserByEmailAndPassword(login, password);
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
        if (user != null) {
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            HttpSession newSession = request.getSession(true);
            if(user.getRole() == User.Role.USER) {
                forward = Pages.USER_PROFILE;
            }
            if(user.getRole() == User.Role.MANAGER) {
                forward = Pages.MANAGER_PROFILE;
            }
            newSession.setAttribute("user", user);
            newSession.setAttribute("userRole", user.getRole());
        } else {
            String errorMessage = "Either username or password is wrong.";
            request.setAttribute("errorMessage", errorMessage);
            return Pages.PAGE_ERROR;
        }
        return forward;
    }
}
