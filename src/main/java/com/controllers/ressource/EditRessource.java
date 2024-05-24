package com.controllers.ressource;

import com.dao.Implements.RessourceDaoImpl;
import com.dao.interfaces.RessourceDao;
import com.models.ResourceType;
import com.models.Ressource;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EditRessource", value = "/EditRessource")
public class EditRessource extends HttpServlet {
    RessourceDao ressourceDao = new RessourceDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int idRes = Integer.parseInt(request.getParameter("idRes"));
        try {
            request.setAttribute("resList", ressourceDao.getResourceById(idRes));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ressourceViewer/editeRes.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idres = Integer.parseInt(request.getParameter("idres"));
        String ressource_name = request.getParameter("nameR");
        String type = request.getParameter("type");
        Integer quantite = Integer.valueOf(request.getParameter("quantity"));
        String fournisseur = request.getParameter("supName");
        Integer tache_Id = Integer.parseInt(request.getParameter("tacheId"));
        ResourceType resType = ResourceType.valueOf(type);
        try {
            ressourceDao.updateResource(new Ressource(idres,ressource_name, resType, quantite,fournisseur, tache_Id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("showR?idT="+tache_Id);
    }
}