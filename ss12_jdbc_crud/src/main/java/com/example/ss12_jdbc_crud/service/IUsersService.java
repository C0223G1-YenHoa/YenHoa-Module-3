package com.example.ss12_jdbc_crud.service;

import com.example.ss12_jdbc_crud.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUsersService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    void deleteUser(int id) throws SQLException;

    void updateUser(User user) throws SQLException;
}
