package com.dao.interfaces;

import javax.annotation.Resource;
import java.util.List;

public interface RessourceDao {
    List<Resource> getAllResources();
    List<Resource> getAllResourcesByTacheId(int tacheId);
    Resource getResourceById(int id);
    void saveResource(Resource resource);
    void updateResource(Resource resource);
    void deleteResource(int idR);

}
