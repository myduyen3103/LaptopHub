/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.web.authentication;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import laptophub.dal.UserDAO;
import laptophub.model.User;

/**
 *
 * @author admin
 */
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String userName = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String birthdayStr = request.getParameter("birthday");
        String address = request.getParameter("address");
        String phone = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String email = request.getParameter("email");
        int roleId = 1; 
        boolean status = true; 

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            if (userDAO.checkUsernameExists(userName)) {
                request.setAttribute("error", "Username already exists");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
                return;
            }

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthday = dateFormat.parse(birthdayStr);

            User newUser = new User();
            newUser.setUserName(userName);
            newUser.setFullName(fullName);
            newUser.setPassword(password);
            newUser.setRoleId(roleId);
            newUser.setImage("./image/avatar/default.jpg");
            newUser.setBirthday(birthday);
            newUser.setAddress(address);
            newUser.setPhone(phone);
            newUser.setStatus(status);

            userDAO.insertUser(newUser);

            response.sendRedirect("login.jsp");

        } catch (SQLException | java.text.ParseException e) {
            throw new ServletException(e);
        }
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

}
