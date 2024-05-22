package com.controllers.tache;

import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.TacheDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShartTaskServlet", value = "/ShartTaskServlet")
public class ShartTaskServlet extends HttpServlet {
    private TacheDao tacheDao = new TacheDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int todo;
        int inProgress;
        int done;
        try {
            todo = tacheDao.getNombreTachesTodo();
            inProgress = tacheDao.getNombreTachesInProgress();
            done = tacheDao.getNombreTachesDone();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("todo", todo);
        request.setAttribute("inProgress", inProgress);
        request.setAttribute("done", done);

        request.getRequestDispatcher("/WEB-INF/tacheViewer/tacheStatut.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}