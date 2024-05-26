package com.exportPdf;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.models.ResourceType;
import com.models.Ressource;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;

public class PDFExporter {

    public ByteArrayInputStream export(List<Ressource> Ress) throws DocumentException {
        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PdfWriter writer = PdfWriter.getInstance(document, outputStream);
        document.open();

        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setSize(12);

        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);
        table.addCell("Ressource ID");
        table.addCell("Ressource Name");
        table.addCell("Type");
        table.addCell("Quantity");
        table.addCell("Supplier Name");
        table.addCell("Tache Id");

        for (Ressource res : Ress) {
            table.addCell(String.valueOf(res.getRessourceId()));
            table.addCell(res.getRessourceName());
            table.addCell(String.valueOf(res.getType()));
            table.addCell(String.valueOf(res.getQuantity()));
            table.addCell(res.getSupplierInfo());
            table.addCell(String.valueOf(res.getTacheId()));

        }

        document.add(new Paragraph("List of Ressource", font));
        document.add(table);
        document.close();

        return new ByteArrayInputStream(outputStream.toByteArray());
    }
}
