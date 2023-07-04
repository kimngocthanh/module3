package com.example.ss12_bai_tap.repository;

import com.example.ss12_bai_tap.model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UsersRepository implements IUsersRepository {
    public static String SELECT = "SELECT * From users";
    public static String INSERT = "INSERT into users(name,email,country) VALUES (?,?,?)";
    public static String UPDATE = "UPDATE users Set name=?, email=?, country=? WHERE id=?;";
    public static String DELETE = "DELETE from users WHERE id = ?";
    public static String SEARCH = "SELECT * FROM users\n" +
            "WHERE country like ? ;";

    @Override
    public Map<Integer, Users> display() {
        Map<Integer, Users> usersMap = new HashMap<>();
        Connection connection = BaseRepository.getConnection();
        Users users;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
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
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, users.getName());
            preparedStatement.setString(2, users.getEmail());
            preparedStatement.setString(3, users.getCountry());
            preparedStatement.setInt(4, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
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
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery(SEARCH);
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
}
