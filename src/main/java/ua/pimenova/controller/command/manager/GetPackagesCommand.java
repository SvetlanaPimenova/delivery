package ua.pimenova.controller.command.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.ExtraOptions;
import ua.pimenova.model.database.entity.Freight;
import ua.pimenova.model.database.entity.Order;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.OrderService;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class GetPackagesCommand implements ICommand {
    private final OrderService orderService;

    public GetPackagesCommand(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Order> orders;
        try {
            orders = orderService.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
            return Pages.PAGE_ERROR;
        }
        String sort = request.getParameter("sort");
        sortOrdersList(orders, sort);
        String deliveryFilter = request.getParameter("deliveryFilter");
        String freightFilter = request.getParameter("freightFilter");
        String paymentFilter = request.getParameter("paymentFilter");
        String executionFilter = request.getParameter("executionFilter");

        if (deliveryFilter == null && freightFilter == null && paymentFilter == null
                && executionFilter == null) {
            request.setAttribute("shipments", orders);
            return Pages.PACKAGES;
        } else {
            if (deliveryFilter != null) {
                orders = filterOrdersByDeliveryType(orders, deliveryFilter);
            }
            if(freightFilter != null) {
                orders = filterOrdersByFreightType(orders, freightFilter);
            }
            if(paymentFilter != null) {
                orders = filterOrdersByPaymentStatus(orders, paymentFilter);
            }
            if(executionFilter != null) {
                orders = filterOrdersByExecutionStatus(orders, executionFilter);
            }
        }
        request.setAttribute("shipments", orders);
        return Pages.PACKAGES;
    }

    private void sortOrdersList(List<Order> orders, String sort) {
        if (sort != null) {
            switch (sort) {
                case "cost_asc":
                    orders.sort(Comparator.comparingInt(Order::getTotalCost));
                    break;
                case "cost_desc":
                    orders.sort(Comparator.comparingInt(Order::getTotalCost).reversed());
                    break;
                case "date_asc":
                    orders.sort(Comparator.comparing(Order::getOrderDate));
                    break;
                case "date_desc":
                    orders.sort(Comparator.comparing(Order::getOrderDate).reversed());
                    break;
                case "default":
                    break;
            }
        }
    }

    private List<Order> filterOrdersByExecutionStatus(List<Order> orders, String executionFilter) {
        List<Order> filtered = orders;
        switch (executionFilter) {
            case "in_processing":
                filtered = orders.stream()
                        .filter(order -> order.getExecutionStatus() == Order.ExecutionStatus.IN_PROCESSING)
                        .collect(Collectors.toList());
                break;
            case "formed":
                filtered = orders.stream()
                        .filter(order -> order.getExecutionStatus() == Order.ExecutionStatus.FORMED)
                        .collect(Collectors.toList());
                break;
            case "sent":
                filtered = orders.stream()
                        .filter(order -> order.getExecutionStatus() == Order.ExecutionStatus.SENT)
                        .collect(Collectors.toList());
                break;
            case "arrived_at_destination":
                filtered = orders.stream()
                        .filter(order -> order.getExecutionStatus() == Order.ExecutionStatus.ARRIVED_AT_DESTINATION)
                        .collect(Collectors.toList());
                break;
            case "delivered":
                filtered = orders.stream()
                        .filter(order -> order.getExecutionStatus() == Order.ExecutionStatus.DELIVERED)
                        .collect(Collectors.toList());
                break;
            case "default":
                break;
        }
        return filtered;
    }

    private List<Order> filterOrdersByPaymentStatus(List<Order> orders, String paymentFilter) {
        List<Order> filtered = orders;
        switch (paymentFilter) {
            case "paid":
                filtered = orders.stream()
                        .filter(order -> order.getPaymentStatus() == Order.PaymentStatus.PAID)
                        .collect(Collectors.toList());
                break;
            case "unpaid":
                filtered = orders.stream()
                        .filter(order -> order.getPaymentStatus() == Order.PaymentStatus.UNPAID)
                        .collect(Collectors.toList());
                break;
            case "default":
                break;
        }
        return filtered;
    }

    private List<Order> filterOrdersByFreightType(List<Order> orders, String freightFilter) {
        List<Order> filtered = orders;
        switch (freightFilter) {
            case "goods":
                filtered = orders.stream()
                        .filter(order -> order.getFreight().getType() == Freight.FreightType.GOODS)
                        .collect(Collectors.toList());
                break;
            case "glass":
                filtered = orders.stream()
                        .filter(order -> order.getFreight().getType() == Freight.FreightType.GLASS)
                        .collect(Collectors.toList());
                break;
            case "compact":
                filtered = orders.stream()
                        .filter(order -> order.getFreight().getType() == Freight.FreightType.COMPACT)
                        .collect(Collectors.toList());
                break;
            case "default":
                break;
        }
        return filtered;
    }

    private List<Order> filterOrdersByDeliveryType(List<Order> orders, String deliveryFilter) {
        List<Order> filtered = orders;
        switch (deliveryFilter) {
            case "to_the_branch":
                filtered = orders.stream()
                        .filter(order -> order.getDeliveryType() == ExtraOptions.DeliveryType.TO_THE_BRANCH)
                        .collect(Collectors.toList());
                break;
            case "courier":
                filtered = orders.stream()
                        .filter(order -> order.getDeliveryType() == ExtraOptions.DeliveryType.COURIER)
                        .collect(Collectors.toList());
                break;
            case "default":
                break;
        }
        return filtered;
    }
}


