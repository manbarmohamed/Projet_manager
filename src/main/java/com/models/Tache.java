package com.models;

import javax.annotation.Resource;
import java.util.List;

public class Tache {

    private int tacheId;
    private String tacheDescription;
    private String startDate;
    private String endDate;
    private TacheStatus status;
    private List<Resource> resources;
    private int projectId;

    public Tache() {
    }

    public Tache(String tacheDescription, String startDate, String endDate, TacheStatus status, List<Resource> resources, int projectId) {
        this.tacheDescription = tacheDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.resources = resources;
        this.projectId = projectId;
    }

    public Tache(String tacheDescription, String startDate, String endDate, TacheStatus status, int projectId) {
        this.tacheDescription = tacheDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.projectId = projectId;
    }

    public Tache(int tacheId, String tacheDescription, String startDate, String endDate, TacheStatus status, List<Resource> resources, int projectId) {
        this.tacheId = tacheId;
        this.tacheDescription = tacheDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.resources = resources;
        this.projectId = projectId;
    }

    public int getTacheId() {
        return tacheId;
    }

    public void setTacheId(int tacheId) {
        this.tacheId = tacheId;
    }

    public String getTacheDescription() {
        return tacheDescription;
    }

    public void setTacheDescription(String tacheDescription) {
        this.tacheDescription = tacheDescription;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public TacheStatus getStatus() {
        return status;
    }

    public void setStatus(TacheStatus status) {
        this.status = status;
    }

    public List<Resource> getResources() {
        return resources;
    }

    public void setResources(List<Resource> resources) {
        this.resources = resources;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return "Tache{" +
                "tacheId=" + tacheId +
                ", tacheDescription='" + tacheDescription + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", status=" + status +
                ", resources=" + resources +
                ", projectId=" + projectId +
                '}';
    }
}
