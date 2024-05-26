package com.exportPdf;

import com.dao.Implements.RessourceDaoImpl;
import com.dao.interfaces.RessourceDao;
import com.itextpdf.text.DocumentException;
import com.models.Ressource;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PDFServlet ", value = "/PDFServlet ")
public class PDFServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RessourceDao dao = new RessourceDaoImpl();
        ByteArrayInputStream bis;
        try {
            List<Ressource> Res = dao.getAllResources();
            PDFExporter exporter = new PDFExporter();
            bis = exporter.export(Res);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }


        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"Ressource.pdf\"");
        OutputStream os = response.getOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = bis.read(buffer)) > 0) {
            os.write(buffer, 0, len);
        }
        os.close();
        bis.close();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}