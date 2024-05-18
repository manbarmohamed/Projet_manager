package com.dao.Implements;

import com.dao.interfaces.TacheDao;
import com.models.Tache;

import java.util.List;

public class TacheDaoImpl implements TacheDao {
    @Override
    public List<Tache> getTasksByProjectId(int projectId) {
        return List.of();
    }

    @Override
    public List<Tache> getAllTasks() {
        return List.of();
    }

    @Override
    public void saveTask(Tache task) {

    }

    @Override
    public void updateTask(Tache task) {

    }

    @Override
    public void deleteTask(int idtask) {

    }

    @Override
    public Tache getTaskById(int id) {
        return null;
    }
}
