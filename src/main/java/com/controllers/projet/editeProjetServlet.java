package com.controllers.projet;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.interfaces.ProjetDao;
import com.models.Projet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "editeProjetServlet", value = "/editeProjetServlet")
public class editeProjetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDao projetDao = new ProjetDaoImpl();
        Integer projetId = Integer.parseInt(request.getParameter("idP"));
        try {
            request.setAttribute("projets", projetDao.getProjectById(projetId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/editeProjet.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDao projetDao = new ProjetDaoImpl();
        Integer projetId = Integer.parseInt(request.getParameter("idP"));

        String nameProjet = request.getParameter("Name");
        String descriptionProjet = request.getParameter("Desc");
        String startDate = request.getParameter("Date");
        String endDate = request.getParameter("DateE");
        Double budget = Double.parseDouble(request.getParameter("budget"));
        try {
            projetDao.updateProject(new Projet(nameProjet,descriptionProjet,startDate,endDate,budget));
            request.setAttribute("projets", projetDao.getProjectById(projetId));
            System.out.println(projetDao.getProjectById(projetId));
            System.out.println("NameProjet: " + nameProjet + "descriptionProjet: " + descriptionProjet);

            this.getServletContext().getRequestDispatcher("/WEB-INF/showProjet.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        //this.getServletContext().getRequestDispatcher("/WEB-INF/showProjet.jsp").forward(request, response);
    }
}