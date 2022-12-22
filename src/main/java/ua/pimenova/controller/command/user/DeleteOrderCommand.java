package ua.pimenova.controller.command.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.Order;
import ua.pimenova.model.database.entity.User;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.OrderService;
import ua.pimenova.model.service.UserService;

import java.io.IOException;

public class DeleteOrderCommand implements ICommand {
    private final OrderService orderService;

    public DeleteOrderCommand(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("order_id"));
        try {
            Order order = orderService.getByID(id);
            if(order != null) {
                if(order.getExecutionStatus() == Order.ExecutionStatus.IN_PROCESSING) {
                    orderService.delete(order);
                    return Pages.ORDERS_LIST_PAGE;
                }
            }
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
        String errorMessage = "You cannot delete a shipment if it has already been formed.";
        request.setAttribute("errorMessage", errorMessage);
        return Pages.PAGE_ERROR;
    }
}
