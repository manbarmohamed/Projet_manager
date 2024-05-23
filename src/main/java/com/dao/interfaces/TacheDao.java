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
    int countTotalTask() throws SQLException;
    int getNombreTachesParStatut(String statut ,int idP) throws SQLException;
    int getNombreTachesTodo(String statut ,int idP) throws SQLException;
    int getNombreTachesInProgress(String statut ,int idP) throws SQLException;
    int getNombreTachesDone(String statut ,int idP) throws SQLException;
    boolean updateTacheStatut(int tacheId, String statut) throws SQLException;
    List<Tache> getRecebtTaches() throws SQLException;
    List<Tache> getTachesByStatus(String status , int idP) throws SQLException;
    List<Tache> getTachesDone(String status , int idP) throws SQLException;
    List<Tache> getTachesTodo(String status , int idP) throws SQLException;
    List<Tache> getTachesInprogress(String status , int idP) throws SQLException;

}
