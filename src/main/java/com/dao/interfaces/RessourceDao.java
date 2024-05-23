package com.dao.interfaces;

import com.models.Ressource;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

public interface RessourceDao {
    List<Ressource> getAllResources() throws SQLException;
    List<Ressource> getAllResourcesByTacheId(int tacheId) throws SQLException;
    List<Ressource> getResourceById(int id) throws SQLException;
    void saveResource(Ressource ressource) throws SQLException;
    void updateResource(Ressource ressource) throws SQLException;
    void deleteResource(int idR) throws SQLException;
    int getResourceCount() throws SQLException;
}
