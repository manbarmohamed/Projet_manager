package com.dao.Implements;

import com.dao.interfaces.ProjetDao;
import com.datebaseconector.DataBaseManager;
import com.models.Projet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjetDaoImpl implements ProjetDao {

    private String GET_ALL_PROJET_SQL = "SELECT * FROM projets";
    private String GET_PROJET_BY_ID_SQL = "select * from projets where projet_Id = ?";
    private String SAVE_PROJET_SQL = "INSERT INTO projets (projet_Name, projet_Description, startDate, endDate, budget) VALUES (?,?,?,?,?)";
    private String DELETE_PROJET_SQL = "delete from projets where projet_Id = ?";
    private String UPDATE_PROJET_SQL = "UPDATE projets SET projet_Name=?,projet_Description=?,startDate=?,endDate=?,budget=? where projet_Id = ?";
    private String COUNT_PROJET_SQL = "select count(*) from projets";
    @Override
    public List<Projet> getAllProjects() throws SQLException {
        List<Projet> projets = new ArrayList<Projet>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_ALL_PROJET_SQL);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Projet projet = new Projet();
            projet.setProjetId(rs.getInt("projet_Id"));
            projet.setProjetName(rs.getString("projet_Name"));
            projet.setProjetDescription(rs.getString("projet_Description"));
            projet.setStartDate(rs.getString("startDate"));
            projet.setEndDate(rs.getString("endDate"));
            projet.setBudget(rs.getDouble("budget"));
            projets.add(projet);
        }
        return projets;
    }

    @Override
    public Projet getAllProject() throws SQLException {
        Projet projet = new Projet();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_ALL_PROJET_SQL);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {

            projet.setProjetId(rs.getInt("projet_Id"));
            projet.setProjetName(rs.getString("projet_Name"));
            projet.setProjetDescription(rs.getString("projet_Description"));
            projet.setStartDate(rs.getString("startDate"));
            projet.setEndDate(rs.getString("endDate"));
            projet.setBudget(rs.getDouble("budget"));
        }
        return projet;
    }

    @Override
    public List<Projet> getProjectById(int idP) throws SQLException {
        List<Projet> projets = new ArrayList<>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_PROJET_BY_ID_SQL);
        ps.setInt(1, idP);
        ResultSet rs = ps.executeQuery();
        Projet projet = new Projet();
        while (rs.next()) {
            projet.setProjetId(rs.getInt("projet_Id"));
            projet.setProjetName(rs.getString("projet_Name"));
            projet.setProjetDescription(rs.getString("projet_Description"));
            projet.setStartDate(rs.getString("startDate"));
            projet.setEndDate(rs.getString("endDate"));
            projet.setBudget(rs.getDouble("budget"));
            projets.add(projet);
        }
        return projets;
    }

    @Override
    public void saveProject(Projet projet) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(SAVE_PROJET_SQL);
        ps.setString(1, projet.getProjetName());
        ps.setString(2, projet.getProjetDescription());
        ps.setString(3, projet.getStartDate());
        ps.setString(4, projet.getEndDate());
        ps.setDouble(5, projet.getBudget());
        ps.executeUpdate();

    }

    @Override
    public void updateProject(Projet projet) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(UPDATE_PROJET_SQL);
        ps.setString(1, projet.getProjetName());
        ps.setString(2, projet.getProjetDescription());
        ps.setString(3, projet.getStartDate());
        ps.setString(4, projet.getEndDate());
        ps.setDouble(5, projet.getBudget());
        ps.setInt(6, projet.getProjetId());
        ps.executeUpdate();

    }

    @Override
    public void deleteProject(int idP) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(DELETE_PROJET_SQL);
        ps.setInt(1, idP);
        ps.executeUpdate();
    }

    @Override
    public int totalProjects() throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(COUNT_PROJET_SQL);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }
}
