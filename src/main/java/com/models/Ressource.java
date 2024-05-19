package com.models;

public class Ressource {

    private int ressourceId;
    private String ressourceName;
    private ResourceType type;
    private int quantity;
    private String supplierInfo;
    private int tacheId;

    public Ressource() {
    }

    public Ressource(String ressourceName, ResourceType type, int quantity, String supplierInfo) {
        this.ressourceName = ressourceName;
        this.type = type;
        this.quantity = quantity;
        this.supplierInfo = supplierInfo;
    }

    public Ressource(String ressourceName, ResourceType type, int quantity, String supplierInfo, int tacheId) {
        this.ressourceName = ressourceName;
        this.type = type;
        this.quantity = quantity;
        this.supplierInfo = supplierInfo;
        this.tacheId = tacheId;
    }

    public Ressource(int ressourceId, String ressourceName, ResourceType type, int quantity, String supplierInfo, int tacheId) {
        this.ressourceId = ressourceId;
        this.ressourceName = ressourceName;
        this.type = type;
        this.quantity = quantity;
        this.supplierInfo = supplierInfo;
        this.tacheId = tacheId;
    }

    public int getRessourceId() {
        return ressourceId;
    }

    public void setRessourceId(int ressourceId) {
        this.ressourceId = ressourceId;
    }

    public String getRessourceName() {
        return ressourceName;
    }

    public void setRessourceName(String ressourceName) {
        this.ressourceName = ressourceName;
    }

    public ResourceType getType() {
        return type;
    }

    public void setType(ResourceType type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSupplierInfo() {
        return supplierInfo;
    }

    public void setSupplierInfo(String supplierInfo) {
        this.supplierInfo = supplierInfo;
    }

    public int getTacheId() {
        return tacheId;
    }

    public void setTacheId(int tacheId) {
        this.tacheId = tacheId;
    }

    @Override
    public String toString() {
        return "Ressource{" +
                "ressourceId=" + ressourceId +
                ", ressourceName='" + ressourceName + '\'' +
                ", type=" + type +
                ", quantity=" + quantity +
                ", supplierInfo='" + supplierInfo + '\'' +
                ", tacheId=" + tacheId +
                '}';
    }
}
