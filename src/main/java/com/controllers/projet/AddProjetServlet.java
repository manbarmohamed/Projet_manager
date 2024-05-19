package com.controllers.projet;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.interfaces.ProjetDao;
import com.models.Projet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddProjetServlet ", value = "/AddProjetServlet ")
public class AddProjetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/addProjet.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDao projetDao = new ProjetDaoImpl();
        String nameProjet = request.getParameter("pName");
        String descriptionProjet = request.getParameter("pDesc");
        String startDate = request.getParameter("sDate");
        String endDate = request.getParameter("eDate");
        Double budget = Double.parseDouble(request.getParameter("budget"));

        try {
            projetDao.saveProject(new Projet(nameProjet,descriptionProjet,startDate,endDate,budget));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/showProjet.jsp").forward(request, response);

    }
}