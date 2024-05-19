package com.controllers.projet;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.interfaces.ProjetDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowProjetServlet", value = "/ShowProjetServlet")
public class ShowProjetServlet extends HttpServlet {
    private ProjetDao projetDao = new ProjetDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println(projetDao.getAllProjects());
            request.setAttribute("listOfProjet", projetDao.getAllProjects());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/showProjet.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}