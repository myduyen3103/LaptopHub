package laptophub.controller.admin.management.product;

import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.dal.ProductDAO;
import laptophub.model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import laptophub.dal.CategoryDAO;
import laptophub.dal.SupplierDAO;
import laptophub.model.ImageProduct;
import laptophub.utils.DateTimeUtils;
import laptophub.utils.ImageHandler;

/**
 *
 * @author myduyen
 */
@MultipartConfig
public class ProductManagement extends HttpServlet {

    ImageHandler imageHandler = new ImageHandler();
    DateTimeUtils dateUtils = new DateTimeUtils();
    CategoryDAO cat = new CategoryDAO();
    SupplierDAO sup = new SupplierDAO();
    ProductDAO prodDao = new ProductDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManagement at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listProduct(request, response);
                    break;
                case "LOAD":
                    loadProduct(request, response);
                    break;
                case "UPDATE":
                    break;
                case "DETAILS":
                    break;
                case "DELETE":
                    break;
                default:
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ProductManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            ArrayList<ImageProduct> imgList = new ArrayList<>();
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String category = request.getParameter("category"); //id
            int categoryId = cat.getCategoryByName(category).getCategoryId();
            String supplier = request.getParameter("supplier"); //id
            int supplierId = sup.getSupplierByName(supplier).getSupplierId();
            int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean isDiscount = "Có".equals(request.getParameter("isDiscount"));
            float discount = Float.parseFloat(request.getParameter("discount"));
            boolean statusProduct = "Đang kinh doanh".equals(request.getParameter("status"));
            Date releaseDate = dateUtils.converseDateNow(dateUtils.getDateNow());
            Product p = new Product(supplierId, categoryId, productName, quantity, unitPrice, isDiscount, description, releaseDate, discount, statusProduct);
            prodDao.addProduct(p);

            Collection<Part> parts = request.getParts();
            imgList = imageHandler.productImageUploadHandle(parts);
            for (ImageProduct img : imgList) {
                prodDao.insertImageProduct(img);
            }
        } catch (ServletException | IOException e) {
            response.getWriter().write("Error: " + e.getMessage());
        } catch (ParseException ex) {
            Logger.getLogger(ProductManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Product> productList = prodDao.getAllProduct();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("dashboard/product.jsp").forward(request, response);
    }

    public void loadProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product p = prodDao.getProductById(productId);
        p.setImageList(prodDao.getImageProduct(productId));
        
        request.setAttribute("THE_PRODUCT", p);
//        out.print(p);
//        out.print(p.getDescription());

        request.getRequestDispatcher("dashboard/update-product-form.jsp").forward(request, response);
    
    }
    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        
    }

}
