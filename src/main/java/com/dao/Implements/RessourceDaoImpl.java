package com.dao.Implements;

import com.dao.interfaces.RessourceDao;

import javax.annotation.Resource;
import java.util.List;

public class RessourceDaoImpl implements RessourceDao {
    @Override
    public List<Resource> getAllResources() {
        return List.of();
    }

    @Override
    public List<Resource> getAllResourcesByTacheId(int tacheId) {
        return List.of();
    }

    @Override
    public Resource getResourceById(int id) {
        return null;
    }

    @Override
    public void saveResource(Resource resource) {

    }

    @Override
    public void updateResource(Resource resource) {

    }

    @Override
    public void deleteResource(int idR) {

    }
}
