package com.controllers.projet;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.interfaces.ProjetDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowProjetById", value = "/ShowProjetById")
public class ShowProjetById extends HttpServlet {
    ProjetDao projetDao = new ProjetDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("idp");

        if (idParam != null && !idParam.isEmpty()) {

        try {
            int pId = Integer.parseInt(request.getParameter("idp"));

            System.out.println("====>>>"+projetDao.getProjectById(pId));
            request.setAttribute("projetbyid",projetDao.getProjectById(pId));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            response.sendRedirect("/ProjetManager_war_exploded");

            //this.getServletContext().getRequestDispatcher("/WEB-INF/projetViewer/showProjet.jsp").forward(request, response);
}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}