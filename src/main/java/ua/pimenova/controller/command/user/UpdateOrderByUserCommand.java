package ua.pimenova.controller.command.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.ExtraOptions;
import ua.pimenova.model.database.entity.Freight;
import ua.pimenova.model.database.entity.Order;
import ua.pimenova.model.database.entity.Receiver;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.FreightService;
import ua.pimenova.model.service.OrderService;
import ua.pimenova.model.service.ReceiverService;
import ua.pimenova.model.util.Calculator;


import java.io.IOException;

public class UpdateOrderByUserCommand implements ICommand {

    private final OrderService orderService;
    private final FreightService freightService;
    private final ReceiverService receiverService;

    private boolean isUpdated;

    public UpdateOrderByUserCommand(OrderService orderService, FreightService freightService, ReceiverService receiverService) {
        this.orderService = orderService;
        this.freightService = freightService;
        this.receiverService = receiverService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("order_id"));
        try {
            Order order = orderService.getByID(id);
            if(order != null) {
                Freight freight = order.getFreight();
                Freight newFreight = setNewFreight(request, freight);
                freightService.update(newFreight);
                Receiver receiver = order.getReceiver();
                Receiver newReceiver = setNewReceiver(request, receiver);
                receiverService.update(newReceiver);
                order = setNewOrder(request, order, newFreight, newReceiver);
                isUpdated = orderService.update(order);
            }
            request.setAttribute("isUpdated", isUpdated);
            request.setAttribute("currentOrder", order);
            return Pages.UPDATE_ORDER_PAGE;
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
    }

    private Freight setNewFreight(HttpServletRequest request, Freight freight) {
        freight.setType(Freight.FreightType.valueOf(request.getParameter("freighttype").toUpperCase()));
        freight.setWeight(Double.parseDouble(request.getParameter("weight")));
        freight.setLength(Double.parseDouble(request.getParameter("length")));
        freight.setWidth(Double.parseDouble(request.getParameter("width")));
        freight.setHeight(Double.parseDouble(request.getParameter("height")));
        freight.setEstimatedCost(Integer.parseInt(request.getParameter("cost")));
        return freight;
    }

    private Receiver setNewReceiver(HttpServletRequest request, Receiver receiver) {
        receiver.setCity(request.getParameter("cityto"));
        receiver.setFirstname(request.getParameter("rfname"));
        receiver.setLastname(request.getParameter("rlname"));
        receiver.setPhone(request.getParameter("rphone"));
        receiver.setStreet(request.getParameter("rstreet"));
        receiver.setPostal_code(request.getParameter("rpcode"));
        return receiver;
    }

    private Order setNewOrder(HttpServletRequest request, Order order, Freight freight, Receiver receiver) {
        order.setFreight(freight);
        order.setReceiver(receiver);
        order.setTotalCost(updateTotalCost(order, receiver, freight));
        order.setDeliveryType(ExtraOptions.DeliveryType.valueOf(request.getParameter("deliverytype").toUpperCase()));
        return order;
    }

    private int updateTotalCost(Order order, Receiver receiver, Freight freight) {
        return Calculator.getTotalCost(order.getCityFrom(), receiver.getCity(), freight.getType(),
                order.getDeliveryType(), freight.getWeight());
    }
}
