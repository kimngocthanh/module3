package com.example.ss12_bai_tap.repository;

import com.example.ss12_bai_tap.model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UsersRepository implements IUsersRepository {
    public static String SELECT = "call select_users();";
    public static String INSERT = "INSERT into users(name,email,country) VALUES (?,?,?)";
    public static String UPDATE = "call update_users(?, ?, ?, ?);";
    public static String DELETE = "call delete_users(?);";
    public static String SEARCH = "SELECT * FROM users WHERE country like ? ;";
    public static String SORT = "SELECT * FROM users ORDER BY name ;";

    @Override
    public Map<Integer, Users> display() {
        Map<Integer, Users> usersMap = new HashMap<>();
        Connection connection = BaseRepository.getConnection();
        Users users;
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users = new Users(id, name, email, country);
                usersMap.put(id, users);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usersMap;
    }

    @Override
    public void add(Users users) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, users.getName());
            preparedStatement.setString(2, users.getEmail());
            preparedStatement.setString(3, users.getCountry());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(int id, Users users) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE);
            callableStatement.setString(1, users.getName());
            callableStatement.setString(2, users.getEmail());
            callableStatement.setString(3, users.getCountry());
            callableStatement.setInt(4, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Users> search(String country) {
        List<Users> usersList = new ArrayList<>();
        Users users;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+country+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                users = new Users(id,name,email,country);
                usersList.add(users);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usersList;
    }

    @Override
    public List<Users> sort() {
        List<Users> usersList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Users users;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SORT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users = new Users(id, name, email, country);
                usersList.add(users);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usersList;
    }
}
