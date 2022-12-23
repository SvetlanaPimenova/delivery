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

public class SignupCommand implements ICommand {
    private final UserService userService;

    public SignupCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = getUser(request);
        try {
            if(userService.getByPhone(user.getPhone()) != null) {
                String errorPhone = "This phone number is already in use.";
                request.setAttribute("errorPhone", errorPhone);
                return Pages.SIGNUP_PAGE;
            }
            if(userService.getByEmail(user.getEmail()) != null) {
                String errorEmail = "This e-mail is already in use.";
                request.setAttribute("errorEmail", errorEmail);
                return Pages.SIGNUP_PAGE;
            }
            userService.create(user);
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
        HttpSession oldSession = request.getSession(false);
        if(oldSession != null) {
            oldSession.invalidate();
        }
        HttpSession newSession = request.getSession(true);
        newSession.setAttribute("user", user);
        newSession.setAttribute("userRole", user.getRole());
        return Pages.USER_PROFILE;
    }

    private User getUser(HttpServletRequest request) {
        String firstName = request.getParameter("firstname").strip();
        String lastName = request.getParameter("lastname").strip();
        String email = request.getParameter("email").strip();
        String phone = request.getParameter("phone").strip();
        String city = request.getParameter("city").strip();
        String street = request.getParameter("street").strip();
        String postalCode = request.getParameter("postalcode").strip();
        String password = request.getParameter("password");
        return new User(0, password, firstName, lastName, phone, email, 0, User.Role.USER,
                city, street, postalCode);
    }
}
