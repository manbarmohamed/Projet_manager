package com.dao.interfaces;

import com.models.Projet;

import java.util.List;

public interface ProjetDao {

    List<Projet> getAllProjects();
    Projet getProjectById(int idP);
    void saveProject(Projet projet);
    void updateProject(Projet projet);
    void deleteProject(int idP);

}
