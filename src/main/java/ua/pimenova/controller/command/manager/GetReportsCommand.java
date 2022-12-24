package ua.pimenova.controller.command.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.Order;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.OrderService;
import ua.pimenova.model.service.ReceiverService;
import ua.pimenova.model.service.UserService;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GetReportsCommand implements ICommand {
    private final OrderService orderService;
    private final UserService userService;
    private final ReceiverService receiverService;

    public GetReportsCommand(OrderService orderService, UserService userService, ReceiverService receiverService) {
        this.orderService = orderService;
        this.userService = userService;
        this.receiverService = receiverService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchParameter = request.getParameter("searchParameter");
        if(searchParameter == null || searchParameter.equals("")) {
            return Pages.REPORTS;
        }
        List<Order> orders = null;
        switch (searchParameter) {
            case "sender":
                orders = searchBySender();
                break;
            case "city_from":
                orders = searchByCityFrom(request);
                break;
            case "city_to":
                orders = searchByCityTo();
                break;
            case "date":
                orders = searchByDate(request);
                break;
        }
        request.setAttribute("list", orders);
        return Pages.REPORTS;
    }

    private List<Order> searchByDate(HttpServletRequest request) {
        String parameter = request.getParameter("calendar");
        List<Order> orders = new ArrayList<>();
        if(parameter == null || parameter.equals("")) {
            return orders;
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(parameter);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            orders = orderService.getAllOrdersByDate(date);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return orders;
    }

    private List<Order> searchByCityTo() {
        return null;
    }

    private List<Order> searchByCityFrom(HttpServletRequest request) {
        String parameter = request.getParameter("search");
        List<Order> orders = new ArrayList<>();
        if(parameter == null || parameter.equals("")) {
            return orders;
        }
        try {
            orders = orderService.getAllOrdersByCityFrom(parameter);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return orders;
    }

    private List<Order> searchBySender() {
        return null;
    }
}
