package com.controllers.ressource;

import com.dao.Implements.RessourceDaoImpl;
import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.RessourceDao;
import com.dao.interfaces.TacheDao;
import com.models.ResourceType;
import com.models.Ressource;
import com.models.Tache;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddRessource", value = "/AddRessource")
public class AddRessource extends HttpServlet {
        private TacheDao tacheDao = new TacheDaoImpl();
        private RessourceDao ressourceDao = new RessourceDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("tache", tacheDao.getAllTasks());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ressourceViewer/addRes.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ressource_name = request.getParameter("nameR");
        String type = request.getParameter("type");
        Integer quantite = Integer.valueOf(request.getParameter("quantity"));
        String fournisseur = request.getParameter("supName");
        Integer tache_Id = Integer.parseInt(request.getParameter("tacheId"));
        ResourceType resType = ResourceType.valueOf(type);
        try {
            ressourceDao.saveResource(new Ressource(ressource_name, resType, quantite,fournisseur, tache_Id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("showR?idT="+tache_Id);
    }
}