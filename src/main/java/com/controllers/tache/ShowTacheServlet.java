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
        try {
            int todoCount = tacheDao.countTaskDone();
            int totalCount = tacheDao.countTotalTask();
            request.setAttribute("completedCount", todoCount);
            request.setAttribute("totalCount", totalCount);
            System.out.println(tacheDao.getAllTasks());
            request.setAttribute("listoftask", tacheDao.getAllTasks());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/showTache.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}