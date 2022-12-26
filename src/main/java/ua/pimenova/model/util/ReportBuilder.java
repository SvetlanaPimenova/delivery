package ua.pimenova.model.util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.http.HttpServletResponse;
import ua.pimenova.model.database.entity.Order;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.stream.Stream;

public class ReportBuilder {
    public void reportByDatePdf(HttpServletResponse response, List<Order> list, String parameter) {
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            PdfWriter.getInstance(document, baos);
            document.open();

            Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
            Font main = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL);

            Paragraph title = new Paragraph("Dispatch report for " + parameter, titleFont);
            Chapter chapter = new Chapter(title, 1);
            chapter.setNumberDepth(0);

            Section section = chapter.addSection(title, 0);

            PdfPTable table = new PdfPTable(11);
            table.setSpacingBefore(25);
            table.setSpacingAfter(25);

            addTableHeader(table);
            addRows(list, parameter, main, table);
            section.add(table);
            document.add(chapter);
            document.close();

            openInBrowser(response, baos);
        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }
    }

    private void openInBrowser(HttpServletResponse response, ByteArrayOutputStream baos) {
        // setting some response headers
        response.setHeader("Expires", "0");
        response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        response.setHeader("Pragma", "public");
        // setting the content type
        response.setContentType("application/pdf");
        // the content length
        response.setContentLength(baos.size());
        // write ByteArrayOutputStream to the ServletOutputStream
        OutputStream os = null;
        try {
            os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addRows(List<Order> list, String parameter, Font font, PdfPTable table) {
        int i = 1;
        for(Order order : list) {
            table.addCell(new Phrase(String.valueOf(i), font));
            table.addCell(new Phrase(parameter, font));
            table.addCell(new Phrase(order.getCityFrom(), font));
            table.addCell(new Phrase(order.getReceiver().getCity(), font));
            table.addCell(new Phrase(order.getFreight().toString(), font));
            table.addCell(new Phrase(String.valueOf(order.getTotalCost()), font));
            table.addCell(new Phrase(order.getDeliveryType().toString(), font));
            table.addCell(new Phrase(order.getSender().toString(), font));
            table.addCell(new Phrase(order.getReceiver().toString(), font));
            table.addCell(new Phrase(order.getPaymentStatus().toString(), font));
            table.addCell(new Phrase(order.getExecutionStatus().toString(), font));
            i++;
        }
    }

    private void addTableHeader(PdfPTable table) {
        Stream.of("№", "Shipment date", "From", "To", "Freight info", "Total cost, UAH",
                        "Delivery type", "Sender", "Receiver", "Payment status", "Execution status")
                .forEach(columnTitle -> {
                    PdfPCell header = new PdfPCell();
                    header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                    header.setPhrase(new Phrase(columnTitle));
                    header.setHorizontalAlignment(Element.ALIGN_CENTER);
                    header.setVerticalAlignment(Element.ALIGN_CENTER);
                    table.addCell(header);
                });
    }
}
