package ua.pimenova.controller.command.common;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.controller.constants.Pages;
import ua.pimenova.model.database.entity.ExtraOptions;
import ua.pimenova.model.database.entity.Freight;
import ua.pimenova.model.util.Calculator;

public class CalculateCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        String cityFrom = req.getParameter("cityfrom");
        String cityTo = req.getParameter("cityto");
        Freight.FreightType freightType = Freight.FreightType.valueOf(req.getParameter("freighttype").toUpperCase());
        ExtraOptions.DeliveryType deliveryType = ExtraOptions.DeliveryType.valueOf(req.getParameter("deliverytype").toUpperCase());
        double weight = Double.parseDouble(req.getParameter("weight"));
        int totalCost = Calculator.getTotalCost(cityFrom, cityTo, freightType,
                deliveryType, weight);
        req.setAttribute("result", totalCost);
        return Pages.PAGE_INDEX;
    }
}
