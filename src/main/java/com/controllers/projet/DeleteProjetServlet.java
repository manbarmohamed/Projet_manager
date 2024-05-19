package com.controllers.projet;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.interfaces.ProjetDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteProjetServlet", value = "/DeleteProjetServlet")
public class DeleteProjetServlet extends HttpServlet {
    ProjetDao projetDao = new ProjetDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer projetId = Integer.parseInt(request.getParameter("idP"));
        try {
            projetDao.deleteProject(projetId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/projetViewer/showProjet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.getServletContext().getRequestDispatcher("/WEB-INF/projetViewer/showProjet.jsp").forward(request, response);
    }
}