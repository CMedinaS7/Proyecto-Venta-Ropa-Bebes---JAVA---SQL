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
import Beans.*;

/**
 *
 * @author Carlos J Medina
 */
public class BuscaMovil extends HttpServlet {

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
       
        String tipo=request.getParameter("tipo");
        String codigo=request.getParameter("filtro");
        
        busquedas buscar=new busquedas();
        Producto pro = null;
        cliente cli = null;
        if (codigo != null){
        
            if(tipo.equals("producto")){
                    pro = buscar.obtenerProducto(codigo);
                    try{
                    if (pro.getCodigo() != null) {
                        out.println("Producto Encontrado");
                        //response.sendRedirect("productos1.jsp?resp=correcto&codigo=" + pro.getCodigo() + "&descripcion=" + pro.getDescripcion() + "&talla=" + pro.getTalla() + "&color=" + pro.getColor() + "&precio=" + pro.getPrecio() + "&stock=" + pro.getStock() + "&foto=" + pro.getFoto());
                    }
                    else
                    {
                        out.println("Producto No Encontrado");
                        //response.sendRedirect("productos1.jsp?resp=falso");
                    }
                    }catch(NullPointerException e){
                    out.println("Producto No Encontrado");
                        //response.sendRedirect("productos1.jsp?resp=nulo");
                    }
                    }
            if(tipo.equals("clienteN")){
                    cli = buscar.obtenerClienteNaturalDNI(codigo);
                    try{
                    if (cli.getCodigo() != null) {
                        out.println("Cliente Natural Encontrado");
                        //response.sendRedirect("clientes1.jsp?resp=correcto&codigo=" + cli.getCodigo() + "&nombres=" + cli.getNombres() + "&apellidos=" + cli.getApellidos() + "&dni=" + cli.getDni() + "&telefono=" + cli.getTelefono() + "&direccion=" + cli.getDireccion() + "&email=" + cli.getEmail());
                    }
                    else
                    {
                        out.println("Cliente Natural no Encontrado");
                        //response.sendRedirect("clientes1.jsp?resp=falso");
                    }
                    }catch(NullPointerException e){
                    out.println("Cliente Natural no Encontrado");
                        //response.sendRedirect("clientes1.jsp?resp=nulo");
                    }
                    }
            
            if(tipo.equals("clienteJ")){
                    cli = buscar.obtenerClienteJuridicoRUC(codigo);
                    try{
                    if (cli.getCodigo() != null) {
                        out.println("Cliente Juridico Encontrado");
                        //response.sendRedirect("clientes1.jsp?resp=correcto&codigo=" + cli.getCodigo() + "&rz=" + cli.getRz() + "&repre=" + cli.getRubro() + "&ruc=" + cli.getRuc() + "&telefono=" + cli.getTelefono() + "&direccion=" + cli.getDireccion() + "&email=" + cli.getEmail());
                    }
                    else
                    {
                        out.println("Cliente Juridico Encontrado");
                        //response.sendRedirect("clientes1.jsp?resp=falso");
                    }
                    }catch(NullPointerException e){
                   out.println("Cliente Juridico no Encontrado");
                        // response.sendRedirect("clientes1.jsp?resp=nulo");
                    }
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
