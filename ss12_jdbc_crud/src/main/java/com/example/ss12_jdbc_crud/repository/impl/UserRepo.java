package com.example.ss12_jdbc_crud.repository.impl;

import com.example.ss12_jdbc_crud.model.User;
import com.example.ss12_jdbc_crud.repository.IUserRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";


    @Override
    public void insertUser(User user) throws SQLException {
    Connection connection=BaseRepository.getConnection();
    PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERS_SQL);
    preparedStatement.setString(1,user.getName());
    preparedStatement.setString(2, user.getEmail());
    preparedStatement.setString(3,user.getCountry());
    preparedStatement.executeUpdate();
    }

    @Override
    public User selectUser(int id) {
        Connection connection1= BaseRepository.getConnection();
        String name=null;
        String email=null;
        String country=null;
        try {
            Statement statement= connection1.createStatement();
            ResultSet resultSet= statement.executeQuery(SELECT_USER_BY_ID);
            while(resultSet.next()){
                int findId=resultSet.getInt("id");
               if(findId==id){
                    name=resultSet.getString("name");
                    email=resultSet.getString("email");
                    country=resultSet.getString("country");
                    break;
               }
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
        return new User(id,name,email,country);
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> listUsers=new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
            Statement statement= connection.createStatement();
            ResultSet resultSet= statement.executeQuery(SELECT_ALL_USERS);
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
        PreparedStatement preparedStatement=connection.prepareStatement(DELETE_USERS_SQL);
        preparedStatement.setInt(1,id);
        preparedStatement.executeUpdate();
    }

    @Override
    public void updateUser(int id,String name, String email, String country) throws SQLException {
        Connection connection=BaseRepository.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERS_SQL);
        preparedStatement.setString(1,setName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        preparedStatement.executeUpdate();
    }

}
