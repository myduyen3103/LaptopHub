/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.Supplier;
import laptophub.model.User;
import laptophub.utils.DBConnection;

/**
 *
 * @author admin
 */
public class SupplierDAO {
     private final DBConnection dbConnection;

    public SupplierDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<Supplier> getAllSupplier() {
        List<Supplier> supplierList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Supplier]";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                
                int userId = rs.getInt(1);
                String companyName = rs.getString(2);
                String homePage = rs.getString(3);
                
                String country = rs.getNString(4);
                String logoImg = rs.getString(5);
                Supplier supplier = new Supplier(userId, companyName, homePage, country, logoImg);
                supplierList.add(supplier);

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return supplierList;
    }
}
