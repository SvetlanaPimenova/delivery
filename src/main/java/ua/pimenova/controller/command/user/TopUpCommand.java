package ua.pimenova.controller.command.user;

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

public class TopUpCommand implements ICommand {
    private final UserService userService;

    public TopUpCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return Pages.PAGE_ERROR;
        }
        int sum = Integer.parseInt(request.getParameter("account"));
        int account = user.getAccount() + sum;
        user.setAccount(account);
        try {
            userService.update(user);
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
        return Pages.ACCOUNT_PAGE;
    }
}
