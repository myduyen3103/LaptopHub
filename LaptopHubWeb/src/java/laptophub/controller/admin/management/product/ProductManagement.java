///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package laptophub.controller.admin.management.product;
//
//import java.io.PrintWriter;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import laptophub.dal.ProductDAO;
//import laptophub.model.Product;
//import org.apache.tomcat.util.http.fileupload.FileItem;
//import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
//import java.io.File;
//import java.io.IOException;
//import java.util.Iterator;
//import java.util.List;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//
//import org.apache.commons.fileupload.FileItemFactory;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
///**
// *
// * @author admin
// */
////@WebServlet(name = "DashBoardServlet", urlPatterns = {"/admin/product"})
//public class ProductManagement extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ProductManagement</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ProductManagement at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        out.print("ĐÃ TRUY CẬP VÀO ĐÂY");
//        out.print("\n");
//        try {
//            String theCommand = request.getParameter("command");
//            if (theCommand == null) {
//                theCommand = "LIST";
//            }
//            switch (theCommand) {
//                case "LIST":
//
//                    listProduct(request, response);
//                    break;
//                case "ADD":
//                    addProduct(request, response);
//                    break;
//                case "LOAD":
//                    break;
//                case "UPDATE":
//
//                    break;
//                case "DELETE":
//
//                    break;
//                default:
//
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(ProductManagement.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        String savePath = "C:" + File.separator + SAVE_DIR;
//        File fileSaveDir = new File(savePath);
//        if (!fileSaveDir.exists()) {
//            fileSaveDir.mkdir();
//        }
//        String firstName = request.getParameter("firstname");
//        String lastName = request.getParameter("lastname");
//        Part part = request.getPart("file");
//        String fileName = extractFileName(part);
//        part.write(savePath + File.separator + fileName);
//        /* 
//        //You need this loop if you submitted more than one file 
//        for (Part part : request.getParts()) {
//        String fileName = extractFileName(part);
//        part.write(savePath + File.separator + fileName);
//    }*/
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306    /UploadFile", "root", "root");
//            String query = "INSERT INTO customerDetail (first_name, last_name, file) values (?, ?, ?)";
//
//            PreparedStatement pst;
//            pst = con.prepareStatement(query);
//            pst.setString(1, firstName);
//            pst.setString(2, lastName);
//            String filePath = savePath + File.separator + fileName;
//            pst.setString(3, filePath);
//            pst.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
//    // file name of the upload file is included in content-disposition     header like this:
////form-data; name="dataFile"; filename="PHOTO.JPG"
//
//    private String extractFileName(Part part) {
//        String contentDisp = part.getHeader("content-disposition");
//        String[] items = contentDisp.split(";");
//        for (String s : items) {
//            if (s.trim().startsWith("filename")) {
//                return s.substring(s.indexOf("=") + 2, s.length() - 1);
//            }
//        }
//        return "";
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//    public void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        ProductDAO product = new ProductDAO();
//        List<Product> productList = product.getAllProduct();
//        request.setAttribute("productList", productList);
//        request.getRequestDispatcher("dashboard/product.jsp").forward(request, response);
//    }
//
//    public void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
////        String productName = request.getParameter("productName");
////        String description = request.getParameter("description");
////        String supplier = request.getParameter("supplier"); //id
////        int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
////        int quantity = Integer.parseInt(request.getParameter("quantity"));
////        String category = request.getParameter("category"); //id
//
//        out.print(request.getParameter("imageUrl"));
//        out.print("\n");
////        out.print(category);
////                out.print("\n");
////
////        out.print(supplier);
////                out.print("\n");
//
////        out.print(request.getParameter("imageUrl"));
//        out.print("in gì đó");
//    }
//
//}
