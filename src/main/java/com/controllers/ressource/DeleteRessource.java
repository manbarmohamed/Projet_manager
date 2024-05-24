package com.controllers.ressource;

import com.dao.Implements.RessourceDaoImpl;
import com.dao.interfaces.RessourceDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteRessource", value = "/DeleteRessource")
public class DeleteRessource extends HttpServlet {
    RessourceDao ressourceDao = new RessourceDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idRes"));
        int idt = Integer.parseInt(request.getParameter("idT"));

        try {
            System.out.println("del id ==>><  "+id);
            ressourceDao.deleteResource(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("showR?idT="+idt);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("showR");
    }
}