/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package movil;

import Beans.usuario;
import Dao.busquedas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos J Medina
 */
public class validar extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
        
        String usuario=null;
        String clave=null;
        usuario user;
        busquedas buscando=new busquedas();
        if (request.getParameter("txtusuario")!=null) {
            usuario=request.getParameter("txtusuario");
        }
        if (request.getParameter("txtclave")!=null) {
            clave=request.getParameter("txtclave");
        }
        user=buscando.logeo(usuario, clave);
        if (user!=null) {
            HttpSession sesion=request.getSession();
            sesion.setAttribute("nombres", user.getNombres());
            sesion.setAttribute("apellidos", user.getApellidos());
            sesion.setAttribute("foto",user.getFoto());
            sesion.setAttribute("telefono",user.getTelefono());
            sesion.setAttribute("cargo",user.getCargo());
            response.sendRedirect("intranet/principal.jsp");
        }
        else {
            response.sendRedirect("intranet/login.jsp");

        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
}
