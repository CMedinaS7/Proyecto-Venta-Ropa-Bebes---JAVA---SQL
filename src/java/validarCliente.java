/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.busquedas;
import Beans.cliente;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class validarCliente extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String email=null;
        String clave=null;
        cliente user;
        busquedas buscando=new busquedas();
        String compra=request.getParameter("compra");
        
        if (request.getParameter("email")!=null) {
            email=request.getParameter("email");
        }
        if (request.getParameter("clave")!=null) {
            clave=request.getParameter("clave");
        }
        user=buscando.logeoCliente(email, clave);
        if (user!=null) {
            HttpSession sesion=request.getSession();
            sesion.setAttribute("Cnombres", user.getNombres());
            sesion.setAttribute("Cdireccion",user.getDireccion());
            sesion.setAttribute("Ctelefono",user.getTelefono());
            sesion.setAttribute("Cemail",user.getEmail());
            sesion.setAttribute("Cliente",user.getCodigo());
            
            if(compra!=null){
                response.sendRedirect("web/comprar2.jsp");
            }else{
                response.sendRedirect("web/index.jsp");
            }
        }
        else {
              if(compra!=null){
                    response.sendRedirect("web/comprar1.jsp?e=1");
              }else{
                    response.sendRedirect("web/index.jsp?e=1");
              }

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
