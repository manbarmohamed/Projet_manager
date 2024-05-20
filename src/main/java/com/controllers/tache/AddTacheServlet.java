
package com.controllers.tache;

import com.dao.Implements.ProjetDaoImpl;
import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.ProjetDao;
import com.dao.interfaces.TacheDao;
import com.models.Tache;
import com.models.TacheStatus;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddTacheServlet", value = "/AddTacheServlet")
public class AddTacheServlet extends HttpServlet {
    TacheDao tacheDao = new TacheDaoImpl();
    ProjetDao projetDao = new ProjetDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("projets", projetDao.getAllProjects());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/addTache.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String statusp = request.getParameter("status");
        Integer projet_Id = Integer.parseInt(request.getParameter("projetId"));

        TacheStatus status = TacheStatus.valueOf(statusp);
        try {

            tacheDao.saveTask(new Tache(description, startDate, endDate, status, projet_Id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}