package com.controllers.tache;

import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.TacheDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowTacheServlet", value = "/ShowTacheServlet")
public class ShowTacheServlet extends HttpServlet {
    private TacheDao tacheDao = new TacheDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idpT = Integer.parseInt(request.getParameter("idpT"));

        int todo;
        int inProgress;
        int done;
        try {
            todo = tacheDao.getNombreTachesTodo("TODO",idpT);
            inProgress = tacheDao.getNombreTachesInProgress("INPROGRESS",idpT);
            done = tacheDao.getNombreTachesDone("DONE",idpT);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("todo", todo);
        request.setAttribute("inProgress", inProgress);
        request.setAttribute("done", done);

        try {
            int tacheDone = tacheDao.getNombreTachesDone("DONE",idpT);
            int totalTache = tacheDao.countTotalTask();
            request.setAttribute("totalDone", tacheDone);
            request.setAttribute("totalTache", totalTache);
            request.setAttribute("totalTodo", tacheDao.getNombreTachesTodo("TODO",idpT));
            System.out.println(tacheDao.getAllTasks());
            request.setAttribute("listoftask", tacheDao.getAllTasks());
            request.setAttribute("taskdone", tacheDao.getTachesDone("DONE",idpT));
            request.setAttribute("tasktodo", tacheDao.getTachesTodo("TODO",idpT));
            request.setAttribute("taskinpro", tacheDao.getTachesInprogress("INPROGRESS",idpT));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/showTache.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}