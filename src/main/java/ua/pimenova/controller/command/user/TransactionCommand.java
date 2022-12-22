package ua.pimenova.controller.command.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.Freight;
import ua.pimenova.model.database.entity.Order;
import ua.pimenova.model.database.entity.Receiver;
import ua.pimenova.model.database.entity.User;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.OrderService;
import ua.pimenova.model.service.UserService;

import java.io.IOException;

public class TransactionCommand implements ICommand {
    private final OrderService orderService;
    private final UserService userService;
    private boolean isUpdated;

    public TransactionCommand(OrderService orderService, UserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        int id = Integer.parseInt(request.getParameter("order_id"));
        try {
            Order order = orderService.getByID(id);
            if(order != null) {
                int totalCost = order.getTotalCost();
                int currentAccount = user.getAccount();
                if(currentAccount >= totalCost) {
                    user.setAccount(currentAccount - totalCost);
                    if(userService.update(user)) {
                        order.setPaymentStatus(Order.PaymentStatus.PAID);
                        order.setExecutionStatus(Order.ExecutionStatus.FORMED);
                        isUpdated = orderService.update(order);
                    }
                    request.setAttribute("isUpdated", isUpdated);
                    request.setAttribute("currentOrder", order);
                    return Pages.UPDATE_ORDER_PAGE;
                } else {
                    String errorMessage = "Your account does not have enough funds for debiting. Please top up your account!";
                    request.setAttribute("errorMessage", errorMessage);
                }
            }
            return Pages.PAGE_ERROR;
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
    }
}
