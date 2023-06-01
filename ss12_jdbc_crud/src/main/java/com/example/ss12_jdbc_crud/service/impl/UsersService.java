package com.example.ss12_jdbc_crud.service.impl;

import com.example.ss12_jdbc_crud.model.User;
import com.example.ss12_jdbc_crud.repository.IUserRepo;
import com.example.ss12_jdbc_crud.repository.impl.UserRepo;
import com.example.ss12_jdbc_crud.service.IUsersService;

import java.sql.SQLException;
import java.util.List;

public class UsersService implements IUsersService {
    private IUserRepo iUserRepo= new UserRepo();

    @Override
    public void insertUser(User user) throws SQLException {
        iUserRepo.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepo.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepo.selectAllUsers();
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        iUserRepo.deleteUser(id);
    }

    @Override
    public void updateUser(int id,String name, String email, String country) throws SQLException {
        iUserRepo.updateUser(name,email,country);
    }
}
