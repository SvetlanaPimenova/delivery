package ua.pimenova.controller.command.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.pimenova.controller.command.ICommand;
import ua.pimenova.model.database.entity.Order;
import ua.pimenova.model.util.ReportBuilder;

import java.io.IOException;
import java.util.List;

public class PdfBuilderCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchParameter = request.getParameter("searchParameter");
        String parameter = request.getParameter("parameter");
        List<Order> list = (List<Order>) request.getAttribute("list");
        ReportBuilder reportBuilder = new ReportBuilder();
        switch (searchParameter) {
            case "sender":
                break;
            case "city_from":
                break;
            case "city_to":
                break;
            case "date":
                reportBuilder.reportByDatePdf(response, list, parameter);
        }
        return null;
    }
}
