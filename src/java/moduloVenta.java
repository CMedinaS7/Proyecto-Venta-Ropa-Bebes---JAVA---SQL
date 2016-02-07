/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Beans.DetalleVenta;
import Beans.Producto;
import Beans.Venta;
import Dao.busquedas;
import Dao.insertar;
import Dao.modificar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos J Medina
 */
public class moduloVenta extends HttpServlet {

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
        
            
        
    insertar insert=new insertar();
    busquedas buscar=new busquedas();
    
    
    String accion = request.getParameter("accion");
    String prod = request.getParameter("prod");
    String cant = request.getParameter("cant");
    String subtotal=request.getParameter("sb");

    
       if (accion.equals("AnadirCarrito")) {
           
        HttpSession sesion = request.getSession();
        ArrayList<DetalleVenta> carrito;
        //Si no existe la sesion creamos al carrito de cmoras
        if (sesion.getAttribute("carrito") == null) {
            carrito = new ArrayList<DetalleVenta>();
        } else {
            carrito = (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
        }

        //Obtenemos el producto que deseamos añadir al carrito
        Producto p = buscar.obtenerProducto(request.getParameter("txtcodigo"));
        
        //Creamos un detalle para el carrtio
        DetalleVenta d = new DetalleVenta();
        //Obtenemos los valores de la caja de texto
        d.setCodigop(request.getParameter("txtcodigo"));
        d.setProducto(p);
        d.setCantidad(request.getParameter("txtcantidad"));
        //Calculamos el descuento, si es sub detalle es mayor a 50 se le hace
        //un descuento del 5% aca es donde se encuentra la logica del negocio
       
        //Sirva para saber si tenemos agregado el producto al carrito de compras
        int indice = -1;
        //recorremos todo el carrito de compras
        for (int i = 0; i < carrito.size(); i++) {
            DetalleVenta det = carrito.get(i);
            if (det.getCodigop() == p.getCodigo()) {
                //Si el producto ya esta en el carrito, obtengo el indice dentro
                //del arreglo para actualizar al carrito de compras
                indice = i;
                break;
            }
        }
        if (indice == -1) {
            //Si es -1 es porque voy a registrar
            carrito.add(d);
        } else {
            //Si es otro valor es porque el producto esta en el carrito
            //y vamos actualizar la 
            carrito.set(indice, d);
        }
        //Actualizamos la sesion del carrito de compras
        sesion.setAttribute("carrito", carrito);
        //Redireccionamos al formulario de culminar la venta
        response.sendRedirect("web/carrito.jsp");
           
        } 
       
       
       
       
       
       
       
       
       
       
       
       
       else if (accion.equals("RegistrarVenta")) {
            
            
        HttpSession sesion = request.getSession();
        Venta v=new Venta();
        v.setCliente(request.getParameter("cliente"));
        v.setPersonal("Pe001");
        v.setTipo("TC001");
        v.setSubtotal(subtotal);;
        ArrayList<DetalleVenta> detalle  = (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
        boolean rpta=insert.insertarVenta(v, detalle);
        if (rpta) {
            response.sendRedirect("web/felicidades.jsp?s=1");
        } else {
            response.sendRedirect("mensaje.jsp?men=No se registro la venta");
        }  
        
        
        } 
       
       
       
       
       else if (accion.equals("EliminarProducto")){
        
        HttpSession sesion = request.getSession();
        ArrayList<DetalleVenta> carrito;
        //Si no existe la sesion creamos al carrito de cmoras
        carrito = (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
       
        int indice = -1;
        //recorremos todo el carrito de compras
        for (int i = 0; i < carrito.size(); i++) {
            DetalleVenta det = carrito.get(i);
            if (det.getCodigop().equals(prod)) {
                //Si el producto ya esta en el carrito, obtengo el indice dentro
                //del arreglo para actualizar al carrito de compras
                indice = i;
                break;
            }
        }
        if (indice == -1) {
        } else {
            carrito.remove(indice);
        }
        //Actualizamos la sesion del carrito de compras
        sesion.setAttribute("carrito", carrito);
        //Redireccionamos al formulario de culminar la venta
        response.sendRedirect("web/carrito.jsp");
        
        } 
       
       
       
       else if (accion.equals("ActualizarProducto")){
        
        HttpSession sesion = request.getSession();
        ArrayList<DetalleVenta> carrito;
        carrito = (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
        int indice = -1;
        //recorremos todo el carrito de compras
        for (int i = 0; i < carrito.size(); i++) {
            DetalleVenta det = carrito.get(i);
            if (det.getCodigop().equals(prod)) {
                //Si el producto ya esta en el carrito, obtengo el indice dentro
                //del arreglo para actualizar al carrito de compras
                indice = i;
                break;
            }
        }
        if (indice == -1) {
        } else {
            //Obtenemos el producto que deseamos añadir al carrito
        Producto p = buscar.obtenerProducto(prod);
        
        DetalleVenta d = new DetalleVenta();
        d.setCodigop(prod);
        d.setProducto(p);
        d.setCantidad(cant);
        carrito.set(indice, d);
        }
        //Actualizamos la sesion del carrito de compras
        sesion.setAttribute("carrito", carrito);
        //Redireccionamos al formulario de culminar la venta
        response.sendRedirect("web/carrito.jsp");
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
