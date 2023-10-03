package com.example.users.service;

import com.example.users.model.User;
import com.example.users.reprository.IUserRepository;
import com.example.users.reprository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "tronmat1";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

    private final IUserRepository userRepo = new UserRepository();
    @Override
    public List<User> selectAllUsers() {
        return userRepo.selectAllUsers();
    }

    @Override
    public User selectUser(int id) {
        return userRepo.selectUser(id);
    }

    @Override
    public void insertUser(User user) {
        userRepo.insertUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepo.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepo.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepo.findByCountry(country);
    }

    @Override
    public User getUserByIdSp(int id) {
        return userRepo.getUserByIdSp(id);
    }

    @Override
    public void insertUserStoreSp(User user) {
        userRepo.insertUserStoreSp(user);
    }

    @Override
    public void addUserTransaction(User newUser, List<Integer> permissions) {
        userRepo.addUserTransaction(newUser,permissions);
    }

    @Override
    public List<User> displayListUserSp() {
        return userRepo.displayListUserSp();
    }

    @Override
    public boolean deleteUserSp(int id) {
        return userRepo.deleteUserSp(id);
    }

    @Override
    public boolean updateUserSp(User user) {
        return userRepo.updateUserSp(user);
    }
}