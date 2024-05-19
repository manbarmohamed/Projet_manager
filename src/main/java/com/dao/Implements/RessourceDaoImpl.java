package com.dao.Implements;

import com.dao.interfaces.RessourceDao;
import com.datebaseconector.DataBaseManager;
import com.models.ResourceType;
import com.models.Ressource;
import com.mysql.cj.jdbc.ConnectionImpl;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RessourceDaoImpl implements RessourceDao {
    private String GET_ALL_RES_SQL = "SELECT * FROM ressources";
    private String GET_RES_BY_ID_SQL = "select * from ressources where ressource_Id=?";
    private String GET_RES_BY_TACHE_ID_SQL = "select * from ressources where tache_Id=?";
    private String SAVE_RES_SQL = "INSERT INTO `ressources`(`ressource_name`, `type`, `quantite`, `fournisseur`, `tache_Id`) VALUES (?,?,?,?,?)";
    private String DELETE_RES_SQL = "delete from ressources where ressource_Id=?";
    private String UPDATE_RES_SQL = "UPDATE `ressources` SET `ressource_name`=?,`type`=?,`quantite`=?,`fournisseur`=? WHERE ressource_Id=?";

    @Override
    public List<Ressource> getAllResources() throws SQLException {
        List<Ressource> res = new ArrayList<Ressource>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_ALL_RES_SQL);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Ressource ressource = new Ressource();
            ressource.setRessourceId(rs.getInt("ressource_Id"));
            ressource.setRessourceName(rs.getString("ressource_name"));
            ressource.setType(ResourceType.valueOf(rs.getString("type")));
            ressource.setQuantity(rs.getInt("quantite"));
            ressource.setSupplierInfo(rs.getString("fournisseur"));
            ressource.setTacheId(rs.getInt("tache_Id"));
            res.add(ressource);

        }
        return res;
    }

    @Override
    public List<Ressource> getAllResourcesByTacheId(int tacheId) throws SQLException {
        List<Ressource> res = new ArrayList<>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_RES_BY_TACHE_ID_SQL);
        ps.setInt(1,tacheId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            Ressource ressource = new Ressource();
            ressource.setRessourceId(rs.getInt("ressource_Id"));
            ressource.setRessourceName(rs.getString("ressource_name"));
            ressource.setType(ResourceType.valueOf(rs.getString("type")));
            ressource.setQuantity(rs.getInt("quantite"));
            ressource.setSupplierInfo(rs.getString("fournisseur"));
            ressource.setTacheId(rs.getInt("tache_Id"));
            res.add(ressource);

        }

        return res;
    }

    @Override
    public List<Ressource>  getResourceById(int id) throws SQLException {
        List<Ressource> res = new ArrayList<>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_RES_BY_ID_SQL);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            Ressource ressource = new Ressource();
            ressource.setRessourceId(rs.getInt("ressource_Id"));
            ressource.setRessourceName(rs.getString("ressource_name"));
            ressource.setType(ResourceType.valueOf(rs.getString("type")));
            ressource.setQuantity(rs.getInt("quantite"));
            ressource.setSupplierInfo(rs.getString("fournisseur"));
            ressource.setTacheId(rs.getInt("tache_Id"));
            res.add(ressource);

        }

        return res;
    }

    @Override
    public void saveResource(Ressource ressource) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(SAVE_RES_SQL);
        ps.setString(1,ressource.getRessourceName());
        ps.setString(2,ressource.getType().name());
        ps.setInt(3,ressource.getQuantity());
        ps.setString(4, ressource.getSupplierInfo());
        ps.setInt(5,ressource.getTacheId());
        ps.executeUpdate();


    }

    @Override
    public void updateResource(Ressource ressource) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(UPDATE_RES_SQL);
        ps.setString(1,ressource.getRessourceName());
        ps.setString(2,ressource.getType().name());
        ps.setInt(3,ressource.getQuantity());
        ps.setString(4, ressource.getSupplierInfo());
        ps.setInt(5,ressource.getRessourceId());
        ps.executeUpdate();

    }

    @Override
    public void deleteResource(int idR) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(DELETE_RES_SQL);
        ps.setInt(1,idR);
        ps.executeUpdate();
    }
}
