package com.example.ss12_jdbc_crud.repository.impl;

import com.example.ss12_jdbc_crud.model.User;
import com.example.ss12_jdbc_crud.repository.IUserRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "call display_all()";
    private static final String DELETE_USERS_SQL = "call delete_user(?)";
    private static final String UPDATE_USERS_SQL = "call update_user(?,?,?,?)";


    @Override
    public void insertUser(User user) throws SQLException {
    Connection connection=BaseRepository.getConnection();
    connection.setAutoCommit(false);
    PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERS_SQL);
    preparedStatement.setString(1,user.getName());
    preparedStatement.setString(2, user.getEmail());
    preparedStatement.setString(3,user.getCountry());
    preparedStatement.executeUpdate();
    connection.rollback();
    connection.commit();
    }

    @Override
    public User selectUser(int id) {
        Connection connection1= BaseRepository.getConnection();
        String name=null;
        String email=null;
        String country=null;
        int idSelect = 0;
        try {
            PreparedStatement preparedStatement= connection1.prepareStatement(SELECT_USER_BY_ID);
            ResultSet resultSet= preparedStatement.getResultSet();
            preparedStatement.setInt(1,id);
            preparedStatement.executeQuery();
            while(resultSet.next()){
                    idSelect = resultSet.getInt("id");
                    name=resultSet.getString("name");
                    email=resultSet.getString("email");
                    country=resultSet.getString("country");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection1.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return new User(idSelect,name,email,country);
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> listUsers=new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
//            Statement statement= connection.createStatement();
//            ResultSet resultSet= statement.executeQuery(SELECT_ALL_USERS);
            CallableStatement callableStatement= connection.prepareCall(SELECT_ALL_USERS);
            ResultSet resultSet= callableStatement.executeQuery();
            while(resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                listUsers.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listUsers;
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        Connection connection=BaseRepository.getConnection();
//        PreparedStatement preparedStatement=connection.prepareStatement(DELETE_USERS_SQL);
        CallableStatement callableStatement= connection.prepareCall(DELETE_USERS_SQL);
        callableStatement.setInt(1,id);
        callableStatement.executeUpdate();
    }

    @Override
    public void updateUser(User user) throws SQLException {
        Connection connection=BaseRepository.getConnection();
//        PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_USERS_SQL);
        CallableStatement callableStatement= connection.prepareCall(UPDATE_USERS_SQL);
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3,user.getCountry());
        callableStatement.setInt(4,user.getId());
        callableStatement.executeUpdate();
    }
    
}
