package com.controllers.ressource;

import com.dao.Implements.RessourceDaoImpl;
import com.dao.interfaces.RessourceDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowRessource", value = "/ShowRessource")
public class ShowRessource extends HttpServlet {
    RessourceDao res = new RessourceDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int idTache = Integer.parseInt(request.getParameter("idT"));
        try {
            request.setAttribute("resList", res.getAllResourcesByTacheId(idTache));
            this.getServletContext().getRequestDispatcher("/WEB-INF/ressourceViewer/showRessource.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}