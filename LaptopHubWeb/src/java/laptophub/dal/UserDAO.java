/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.User;
import laptophub.utils.DBConnection;
/**
 *
 * @author admin
 */
public class UserDAO {
    private final DBConnection dbConnection;

    public UserDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public boolean checkUsernameExists(String userName) throws SQLException {
        Connection jdbcConnection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            try {
                jdbcConnection = dbConnection.opeanConnection();
            } catch (Exception ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

            String sql = "SELECT COUNT(*) FROM [User] WHERE userName = ?";
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, userName);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }

            return false;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (jdbcConnection != null) {
                jdbcConnection.close();
            }
        }
    }

    public boolean insertUser(User user) throws SQLException {
        Connection jdbcConnection = null;
        PreparedStatement statement = null;

        try {
            try {
                jdbcConnection = dbConnection.opeanConnection();
            } catch (Exception ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

            String sql = "INSERT INTO [User] (userName, fullName, password, roleId, image, birthday, address, phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getFullName());
            statement.setString(3, user.getPassword());
            statement.setInt(4, user.getRoleId());
            statement.setString(5, user.getImage());
            statement.setDate(6, new java.sql.Date(user.getBirthday().getTime()));
            statement.setString(7, user.getAddress());
            statement.setString(8, user.getPhone());
            statement.setBoolean(9, user.isStatus());

            return statement.executeUpdate() > 0;
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (jdbcConnection != null) {
                jdbcConnection.close();
            }
        }
    }
}
