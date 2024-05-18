package com.dao.Implements;

import com.dao.interfaces.ProjetDao;
import com.models.Projet;

import java.util.List;

public class ProjetDaoImpl implements ProjetDao {
    @Override
    public List<Projet> getAllProjects() {
        return List.of();
    }

    @Override
    public Projet getProjectById(int idP) {
        return null;
    }

    @Override
    public void saveProject(Projet projet) {

    }

    @Override
    public void updateProject(Projet projet) {

    }

    @Override
    public void deleteProject(int idP) {

    }
}
