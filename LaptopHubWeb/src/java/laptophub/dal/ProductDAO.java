/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.util.ArrayList;
import laptophub.model.Product;
import laptophub.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.ImageProduct;

/**
 *
 * @author admin
 */
public class ProductDAO {
    private final DBConnection db;

    public ProductDAO() {
        db = new DBConnection();
    }
    
    public ArrayList<Product> getTop10NewProduct(){
        ArrayList<Product> prdList = new ArrayList<>();
        String sql = "SELECT TOP (10) [productId],[supplierId],[categoryId],[productName],[quantityPerUnit],[unitPrice],[unitInStock], " +
                                      "[quantitySold],[starRating],[isDiscount],[description],[releaseDate],[discount],[status] " +
                                      " FROM [Product] ORDER BY releaseDate DESC";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.opeanConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                int productId = rs.getInt("productId");
                int supplierId = rs.getInt("supplierId");
                int categoryId = rs.getInt("categoryId");
                String productName = rs.getNString("productName");
                int quantityPerUnit = rs.getInt("quantityPerUnit");
                int unitPrice = rs.getInt("unitPrice");
                int unitInStock = rs.getInt("unitInStock");
                int quantitySold = rs.getInt("quantitySold");
                int starRating = rs.getInt("starRating");
                boolean isDiscount = rs.getBoolean("isDiscount");
                String description = rs.getNString("description");
                Date releaseDate = rs.getDate("releaseDate");
                float discount = rs.getFloat("discount");
                boolean status = rs.getBoolean("status");
                ArrayList<ImageProduct> imageList = getImageProduct(productId);
                
                Product p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, quantitySold, starRating, isDiscount, description, releaseDate, discount, status, imageList);
                prdList.add(p);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prdList;
    }
    
    public ArrayList<ImageProduct> getImageProduct(int prdId){
        ArrayList<ImageProduct> imgList = new ArrayList<>();
        String sql = "SELECT [imageId], [productId] ,[imageUrl] ,[description] " +
                     "  FROM [ImageProduct] " +
                     "  WHERE productId = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.opeanConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prdId);
            rs = ps.executeQuery();
            
            while(rs.next()){
                int imageId = rs.getInt("imageId");
                int productId = rs.getInt("productId");
                String imageUrl = rs.getNString("imageUrl");
                String description = rs.getNString("description");
                
                ImageProduct img = new ImageProduct(imageId, productId, imageUrl, description);
                imgList.add(img);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imgList;
    }
}
