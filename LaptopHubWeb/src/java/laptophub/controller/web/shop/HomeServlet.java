/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.web.shop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import laptophub.dal.CategoryDAO;
import laptophub.dal.ProductDAO;
import laptophub.model.Category;
import laptophub.model.Product;

/**
 *
 * @author admin
 */
public class HomeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "list"; // Default action to list products
            }

            switch (action) {
                case "list":
                    homePage(request, response);
                    break;
                case "Laptop":
                case "Tablet":
                case "PC":
                case "Screen":
                    categoryPage(request, response, action);
                    break;
                default:
                    homePage(request, response);
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void homePage(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ProductDAO prdDAO = new ProductDAO();
        CategoryDAO cateDAO = new CategoryDAO();

        ArrayList<Product> prdList = prdDAO.getTop10NewProduct();
        ArrayList<Category> cateList = cateDAO.getCategory();

        request.setAttribute("top10ProductList", prdList);
        request.setAttribute("categoryList", cateList);
//        out.print("In ra " + prdList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    private void categoryPage(HttpServletRequest request, HttpServletResponse response, String category)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products = new ArrayList<>();

        int categoryId = 0;
        String page = "categoryPage.jsp";

        switch (category) {
            case "Laptop":
                categoryId = 1;
                break;
            case "Tablet":
                categoryId = 2;
                break;
            case "PC":
                categoryId = 3;
                break;
            case "Screen":
                categoryId = 4;
                break;
        }

        try {
            products = productDAO.getProductsByCriteria("categoryId", categoryId);
            request.setAttribute("products", products);
            request.setAttribute("category", category);
            RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
