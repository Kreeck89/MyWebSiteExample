package service;

import dataSql.Database;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {

    private static final String URL_INSERT = "INSERT INTO web.users(name, surname, email, password, phone, image) VALUES (?,?,?,?,?,?)";
    private static final String URL_USER = "SELECT * FROM web.users WHERE email = ?";

    public User getUser(String email) {
        User user = new User();
        try (Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(URL_USER)) {
            connection.setAutoCommit(false);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setPhone(resultSet.getString("phone"));
                user.setImage(resultSet.getString("image"));
                user.setRole(resultSet.getString("role"));
            }
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public void registerUser(User user) {
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(URL_INSERT)) {
            connection.setAutoCommit(false);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getImage());
            preparedStatement.execute();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
