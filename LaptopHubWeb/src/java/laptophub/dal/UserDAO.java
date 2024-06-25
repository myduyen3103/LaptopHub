/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.util.ArrayList;
import java.util.List;
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

    public List<User> getAllUSer() {
        List<User> userList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "Select*from [dbo].[User]";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String userName = rs.getString(1);
                int userId = rs.getInt(2);
                String fullName = rs.getString(3);
                String password = rs.getString(4);
                int roleID = rs.getInt(5);
                String image = rs.getString(6);
                String birthday = rs.getString(7);
                String address = rs.getString(8);
                String phone = rs.getString(9);
                Boolean status = rs.getBoolean(10);
                User user = new User(userName, userId, fullName, password, roleID, image, birthday, address, phone,
                        status);
                userList.add(user);

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }

    public User checkLogin(User user) {
        User temp = null;
        for (User u : new UserDAO().getAllUSer()) {
            if (u.getUserName().equalsIgnoreCase(user.getUserName())
                    && u.getPassword().equalsIgnoreCase(user.getPassword())) {
                temp = user;
                break;
            }
        }
        return temp;
    }

    public boolean checkUsernameExists(String userName) throws SQLException {
        Connection jdbcConnection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            try {
                jdbcConnection = dbConnection.openConnection();
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
                jdbcConnection = dbConnection.openConnection();
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
