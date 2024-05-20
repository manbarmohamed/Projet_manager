package com.dao.interfaces;

import com.models.Tache;

import java.sql.SQLException;
import java.util.List;

public interface TacheDao {
    List<Tache> getTasksByProjectId(int projectId) throws SQLException;
    List<Tache> getAllTasks() throws SQLException;
    void saveTask(Tache task) throws SQLException;
    void updateTask(Tache task) throws SQLException;
    void deleteTask(int idtask) throws SQLException;
    List<Tache> getTaskById(int id) throws SQLException;
    int countTaskDone() throws SQLException;
    int countTotalTask() throws SQLException;

}
