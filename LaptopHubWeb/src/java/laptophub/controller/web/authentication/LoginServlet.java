/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.web.authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import laptophub.dal.UserDAO;
import laptophub.model.User;
import laptophub.utils.CookieUtils;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String username = CookieUtils.get("cookuser", request);
       if(username!=null && username.equals("")){
           request.getRequestDispatcher("home.jsp").forward(request, response);
           return;
       }
       request.getRequestDispatcher("login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String userName = request.getParameter("username");
       String password = request.getParameter("password");
        UserDAO userDAO;
        User user =null;
        try {
            userDAO= new UserDAO();
            user = userDAO.checkLogin(new User(userName, password));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
      if(user!=null){
          if(request.getParameter("remember")!=null){
              String remember = request.getParameter("remember");
              CookieUtils.add("cookuser", remember, 15, response);
              CookieUtils.add("cookpass", remember, 15, response);
              CookieUtils.add("cookremember", remember, 15, response);
              
          }
          HttpSession session = request.getSession();
          
          session.setAttribute("sessuser", user.getUserName());
          session.setAttribute("message", "Login success");
           response.sendRedirect(request.getContextPath() + "/HomeServlet");
      }else{
          request.setAttribute("msg", "Authentication failure");
          request.getRequestDispatcher("login.jsp").forward(request, response);
      }  
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
