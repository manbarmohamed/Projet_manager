package com.controllers.projet;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.Implements.RessourceDaoImpl;
import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.ProjetDao;
import com.dao.interfaces.RessourceDao;
import com.dao.interfaces.TacheDao;
import com.models.Projet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowProjetServlet", value = "/ShowProjetServlet")
public class ShowProjetServlet extends HttpServlet {
    private ProjetDao projetDao = new ProjetDaoImpl();
    private TacheDao tacheDao = new TacheDaoImpl();
    private RessourceDao ressourceDao = new RessourceDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("totalTache", tacheDao.countTotalTask());
            request.setAttribute("totalProjet", projetDao.totalProjects());
            //request.setAttribute("totalDone", tacheDao.getNombreTachesDone());
            request.setAttribute("totalRessource",ressourceDao.getResourceCount());
            request.setAttribute("recentTaches", tacheDao.getRecebtTaches());
            System.out.println(projetDao.getAllProject());
            request.setAttribute("listOfProjet", projetDao.getAllProjects());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/projetViewer/showProjet.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDao projetDao = new ProjetDaoImpl();
        int projetId = Integer.parseInt(request.getParameter("idP"));

        String nameProjet = request.getParameter("Name");
        String descriptionProjet = request.getParameter("Desc");
        String startDate = request.getParameter("Date");
        String endDate = request.getParameter("DateE");
        Double budget = Double.parseDouble(request.getParameter("budget"));
        try {
            projetDao.updateProject(new Projet(projetId,nameProjet,descriptionProjet,startDate,endDate,budget));

            System.out.println("NameProjet: ===" + nameProjet + "=====descriptionProjet: " + descriptionProjet);

            //this.getServletContext().getRequestDispatcher("/WEB-INF/projetViewer/showProjet.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}