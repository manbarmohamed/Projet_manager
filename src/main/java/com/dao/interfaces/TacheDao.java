package com.dao.interfaces;

import com.models.Tache;

import java.util.List;

public interface TacheDao {
    List<Tache> getTasksByProjectId(int projectId);
    List<Tache> getAllTasks();
    void saveTask(Tache task);
    void updateTask(Tache task);
    void deleteTask(int idtask);
    Tache getTaskById(int id);


}
