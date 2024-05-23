package com.dao.Implements;

import com.dao.interfaces.TacheDao;
import com.datebaseconector.DataBaseManager;
import com.models.Tache;
import com.models.TacheStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TacheDaoImpl implements TacheDao {

    private String GET_ALL_TACHES = "SELECT * FROM taches";
    private String GET_TACH_BY_ID = "SELECT * FROM taches WHERE tache_Id = ?";
    private String DELETE_TACH_BY_ID = "DELETE FROM taches WHERE tache_Id = ?";
    private String UPDATE_TACH_BY_ID = "UPDATE taches SET tache_Description=?,startDate=?,endDate=?,status=?,projet_Id=? WHERE tache_Id=?";
    private String GET_TACH_BY_PROJET_ID = "SELECT * FROM taches WHERE projet_Id = ?";
    private String SAVE_TACH = "INSERT INTO taches (tache_Description, startDate, endDate, status, projet_Id) VALUES (?,?,?,?,?)";
    private String COUNT_ALL_TACHES = "SELECT COUNT(*) FROM taches";
    private String GET_RECENT_TACHE =" select * from taches order by tache_Id desc limit 4";
    @Override
    public List<Tache> getTasksByProjectId(int projectId) throws SQLException {
        List<Tache> taches = new ArrayList<Tache>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_TACH_BY_PROJET_ID);
        ps.setInt(1, projectId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Tache tache = new Tache();
            tache.setTacheId(rs.getInt("tache_Id"));
            tache.setTacheDescription(rs.getString("tache_Description"));
            tache.setStartDate(rs.getString("startDate"));
            tache.setEndDate(rs.getString("endDate"));
            tache.setStatus(TacheStatus.valueOf(rs.getString("status")));
            tache.setProjectId(rs.getInt("projet_Id"));
            taches.add(tache);

        }
        return taches;
    }

    @Override
    public List<Tache> getAllTasks() throws SQLException {
        List<Tache> taches = new ArrayList<Tache>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_ALL_TACHES);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Tache tache = new Tache();
            tache.setTacheId(rs.getInt("tache_Id"));
            tache.setTacheDescription(rs.getString("tache_Description"));
            tache.setStartDate(rs.getString("startDate"));
            tache.setEndDate(rs.getString("endDate"));
            tache.setStatus(TacheStatus.valueOf(rs.getString("status")));
            tache.setProjectId(rs.getInt("projet_Id"));
            taches.add(tache);
        }
        return taches;
    }

    @Override
    public void saveTask(Tache task) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(SAVE_TACH);
        ps.setString(1, task.getTacheDescription());
        ps.setString(2, task.getStartDate());
        ps.setString(3, task.getEndDate());
        ps.setString(4, task.getStatus().name());
        ps.setInt(5, task.getProjectId());
        ps.executeUpdate();

    }

    @Override
    public void updateTask(Tache task) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(UPDATE_TACH_BY_ID);
        ps.setString(1, task.getTacheDescription());
        ps.setString(2, task.getStartDate());
        ps.setString(3, task.getEndDate());
        ps.setString(4, task.getStatus().name());
        ps.setInt(5, task.getProjectId());
        ps.setInt(6, task.getTacheId());
        ps.executeUpdate();
    }

    @Override
    public void deleteTask(int idtask) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(DELETE_TACH_BY_ID);
        ps.setInt(1, idtask);
        ps.executeUpdate();
    }

    @Override
    public List<Tache> getTaskById(int id) throws SQLException {
        List<Tache> tacheList = new ArrayList<>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_TACH_BY_ID);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Tache tache = new Tache();
            tache.setTacheId(rs.getInt("tache_Id"));
            tache.setTacheDescription(rs.getString("tache_Description"));
            tache.setStartDate(rs.getString("startDate"));
            tache.setEndDate(rs.getString("endDate"));
            tache.setStatus(TacheStatus.valueOf(rs.getString("status")));
            tache.setProjectId(rs.getInt("projet_Id"));
            tacheList.add(tache);

        }
        return tacheList;
    }



    @Override
    public int countTotalTask() throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(COUNT_ALL_TACHES);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    @Override
    public int getNombreTachesParStatut(String statut ,int idP) throws SQLException {
        String query = "SELECT COUNT(*) FROM taches WHERE status = ? and projet_Id=?";
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, statut);
            statement.setInt(2, idP);
            ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
        return 0;
    }

    @Override
    public int getNombreTachesTodo(String statut ,int idP) throws SQLException {
        return getNombreTachesParStatut(statut , idP);
    }

    @Override
    public int getNombreTachesInProgress(String statut ,int idP) throws SQLException {
        return getNombreTachesParStatut(statut , idP);
    }

    @Override
    public int getNombreTachesDone(String statut ,int idP) throws SQLException {
        return getNombreTachesParStatut(statut, idP);
    }

    @Override
    public boolean updateTacheStatut(int tacheId, String statut) throws SQLException {
        String query = "UPDATE taches SET statut = ? WHERE id = ?";
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, statut);
            statement.setInt(2, tacheId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

    }

    @Override
    public List<Tache> getRecebtTaches() throws SQLException {
        List<Tache> taches = new ArrayList<Tache>();
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_RECENT_TACHE);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Tache tache = new Tache();
            tache.setTacheId(rs.getInt("tache_Id"));
            tache.setTacheDescription(rs.getString("tache_Description"));
            tache.setStartDate(rs.getString("startDate"));
            tache.setEndDate(rs.getString("endDate"));
            tache.setStatus(TacheStatus.valueOf(rs.getString("status")));
            tache.setProjectId(rs.getInt("projet_Id"));
            taches.add(tache);
        }
        return taches;
    }

    @Override
    public List<Tache> getTachesByStatus(String status , int idP) throws SQLException {
        List<Tache> taches = new ArrayList<Tache>();
        Connection con = new DataBaseManager().getConnection();
        String query = "SELECT * FROM taches WHERE status = ? and projet_Id=? ";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, status);
        ps.setInt(2, idP);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Tache tache = new Tache();
            tache.setTacheId(rs.getInt("tache_Id"));
            tache.setTacheDescription(rs.getString("tache_Description"));
            tache.setStartDate(rs.getString("startDate"));
            tache.setEndDate(rs.getString("endDate"));
            tache.setStatus(TacheStatus.valueOf(rs.getString("status")));
            tache.setProjectId(rs.getInt("projet_Id"));
            taches.add(tache);
        }
        return taches;
    }

    @Override
    public List<Tache> getTachesDone(String status , int idP) throws SQLException {
        return getTachesByStatus(status,idP);
    }

    @Override
    public List<Tache> getTachesTodo(String status , int idP) throws SQLException {
        return getTachesByStatus(status,idP);
    }

    @Override
    public List<Tache> getTachesInprogress( String status , int idP) throws SQLException {
        return getTachesByStatus(status,idP);
    }
}
