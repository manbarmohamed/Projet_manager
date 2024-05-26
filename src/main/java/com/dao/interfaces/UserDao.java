package com.dao.interfaces;

import com.models.User;

import java.sql.SQLException;

public interface UserDao {
    User authenticateUser(String email, String password) throws SQLException;

}
