/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.util.ArrayList;
import java.util.List;
import laptophub.model.User;
import laptophub.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author admin
 */
public class UserDAO {
   public List<User> getAllUSer() {
       List<User> userList = new ArrayList<>();
       DBConnection db = DBConnection.getInstance();
       String sql ="Select*from [dbo].[User]";
        try {
           Connection con = db.openConnection();
           PreparedStatement statement = con.prepareStatement(sql);
           ResultSet rs = statement.executeQuery();
           
          
               while(rs.next()){
                   String userName =rs.getString(1);
                   int userId = rs.getInt(2);
                   String fullName = rs.getString(3);
                   String password = rs.getString(4);
                   int roleID=rs.getInt(5);
                   String image = rs.getString(6);
                   String birthday = rs.getString(7);
                   String address = rs.getString(8);
                   String phone = rs.getString(9);
                   Boolean status = rs.getBoolean(10);
                   User user = new User(userName, userId, fullName, password, roleID, image, birthday, address, phone, status);
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
  public User checkLogin(User user){
     User temp = null;
     for(User u: new UserDAO().getAllUSer()){
         if(u.getUserName().equalsIgnoreCase(user.getUserName())&&u.getPassword().equalsIgnoreCase(user.getPassword())){
             temp=user;
             break;
         }
     }
     return temp;
  }
       
   }

