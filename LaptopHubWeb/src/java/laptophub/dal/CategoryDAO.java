/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.Category;
import laptophub.utils.DBConnection;

/**
 *
 * @author admin
 */
public class CategoryDAO {
    private final DBConnection db;

    public CategoryDAO() {
        db = new DBConnection();
    }
    
    public ArrayList<Category> getCategory(){
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT [categoryId] ,[categoryName] ,[description] ,[imageCat]" +
                     " FROM [Category]";
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.opeanConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getNString("categoryName");
                String description = rs.getNString("description");
                String imageCat = rs.getNString("imageCat");
                
                Category c = new Category(categoryId, categoryName, description, imageCat);
                categoryList.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryList;
    }
}
