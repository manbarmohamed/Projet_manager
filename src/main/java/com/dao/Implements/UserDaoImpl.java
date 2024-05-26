package com.dao.Implements;

import com.dao.interfaces.UserDao;
import com.datebaseconector.DataBaseManager;
import com.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

    private String GET_USER = "SELECT * FROM user WHERE user_name = ? AND password = ?";

    @Override
    public User authenticateUser(String email, String password) throws SQLException {
        Connection con = new DataBaseManager().getConnection();
        PreparedStatement ps = con.prepareStatement(GET_USER);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            User user = new User();
            user.setUserName(rs.getString("user_name"));
            user.setPassword(rs.getString("password"));
            return user;
        }
        return null;

    }
}
