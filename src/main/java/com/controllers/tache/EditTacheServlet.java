package com.controllers.tache;

import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.TacheDao;
import com.models.Tache;
import com.models.TacheStatus;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EditTacheServlet", value = "/EditTacheServlet")
public class EditTacheServlet extends HttpServlet {
    TacheDao tacheDao = new TacheDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tacheId = Integer.parseInt(request.getParameter("idT"));
        try {
            System.out.println("select tache: ==>> "+tacheDao.getTaskById(tacheId));
            request.setAttribute("listoftask", tacheDao.getTaskById(tacheId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/editTache.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("3333333333333333333333333333333333333333333333333");
        int tacheId = Integer.parseInt(request.getParameter("tacheId"));
        String description = request.getParameter("description");

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String statusp = request.getParameter("status");
        int projet_Id = Integer.parseInt(request.getParameter("projetId"));

        TacheStatus status = TacheStatus.valueOf(statusp);
        try {

            tacheDao.updateTask(new Tache(tacheId,description, startDate, endDate, status,projet_Id));
            //this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/showTache.jsp").forward(request, response);
            response.sendRedirect("showT");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}