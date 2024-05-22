package com.controllers.tache;

import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.TacheDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdateTacheStatutServlet", value = "/UpdateTacheStatutServlet")
public class UpdateTacheStatutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TacheDao tacheDao = new TacheDaoImpl();
        try {
            request.setAttribute("listoftask", tacheDao.getAllTasks());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/tacheStatus.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TacheDao tacheDao = new TacheDaoImpl();
        int tacheId = Integer.parseInt(request.getParameter("tacheId"));
        String statut = request.getParameter("statut");
        boolean success = false;
        try {
            success = tacheDao.updateTacheStatut(tacheId, statut);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.setContentType("application/json");
        response.getWriter().write("{\"success\": " + success + "}");


    }
}