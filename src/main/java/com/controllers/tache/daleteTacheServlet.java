package com.controllers.tache;

import com.dao.Implements.TacheDaoImpl;
import com.dao.interfaces.TacheDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "daleteTacheServlet", value = "/daleteTacheServlet")
public class daleteTacheServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TacheDao tacheDao = new TacheDaoImpl();
        int idT = Integer.parseInt(request.getParameter("idT"));
        int idpT  = Integer.parseInt(request.getParameter("idpT"));
        try {
            tacheDao.deleteTask(idT);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("showT?idpT="+idpT);
        //this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/showTache.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/tacheViewer/showTache.jsp").forward(request, response);

    }
}