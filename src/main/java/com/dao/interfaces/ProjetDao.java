package com.dao.interfaces;

import com.models.Projet;

import java.sql.SQLException;
import java.util.List;

public interface ProjetDao {

    List<Projet> getAllProjects() throws SQLException;
    List<Projet>  getProjectById(int idP) throws SQLException;
    void saveProject(Projet projet) throws SQLException;
    void updateProject(Projet projet) throws SQLException;
    void deleteProject(int idP) throws SQLException;

}
