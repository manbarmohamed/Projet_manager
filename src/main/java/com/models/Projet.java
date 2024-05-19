package com.models;

public class Projet {
    private int projetId;
    private String projetName;
    private String projetDescription;
    private String startDate;
    private String endDate;
    private double budget;

    public Projet(String projetName,String projetDescription, String startDate, String endDate, double budget) {
        this.projetDescription = projetDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.budget = budget;
        this.projetName = projetName;
    }

    public Projet(int projetId, String projetName, String projetDescription, String startDate, String endDate, double budget) {
        this.projetId = projetId;
        this.projetName = projetName;
        this.projetDescription = projetDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.budget = budget;
    }

    public Projet() {
    }

    public int getProjetId() {
        return projetId;
    }

    public void setProjetId(int projetId) {
        this.projetId = projetId;
    }

    public String getProjetName() {
        return projetName;
    }

    public void setProjetName(String projetName) {
        this.projetName = projetName;
    }

    public String getProjetDescription() {
        return projetDescription;
    }

    public void setProjetDescription(String projetDescription) {
        this.projetDescription = projetDescription;
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

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    @Override
    public String toString() {
        return "Projet{" +
                "projetId=" + projetId +
                ", projetName='" + projetName + '\'' +
                ", projetDescription='" + projetDescription + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", budget=" + budget +
                '}';
    }
}
