/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Dao.insertar;
import Dao.modificar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class moduloProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         //Instancio los paquestes del DAO
        modificar modify=new modificar();
        insertar insert=new insertar();

        //Capturo el valor de las cajas de texto en variables
        String codigo=request.getParameter("txtcodigo");
        String des=request.getParameter("txtdes");
        String marca=request.getParameter("cbomarca");
        String scat=request.getParameter("cboscat");
        String talla=request.getParameter("txttalla");
        String color=request.getParameter("txtcolor");
        String precio=request.getParameter("txtprecio");
        String stock=request.getParameter("txtstock");
        String foto="../web/productos/" + request.getParameter("foto");
        String foto1="../web/productos/" + request.getParameter("foto1");
        String foto2=foto +"b.jpg";
        String tag =request.getParameter("txttags");
        
        //Capturo los nombres de los botones en variables
        String busca=request.getParameter("buscar");
        String modifica=request.getParameter("modificar");
        String grabar=request.getParameter("grabar");
        
        String movil=request.getParameter("movil");
       
        //Imprimo las variables en entorno NetBeans
        System.out.println(codigo);
        System.out.println(talla);
        System.out.println(color);
        System.out.println(marca);
        System.out.println(precio);
        System.out.println(des);
        System.out.println(stock);
        System.out.println(foto);
        System.out.println(foto1);
        System.out.println(foto2);
        System.out.println(tag);

        
        //Realizo el procedimiento para grabar en la BD
        if (grabar != null) {//Pregunto si ha presionado el boton grabar
         if(marca!=null && scat!=null && des!=null ){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=insert.insertproducto(scat, des, marca, talla, color, precio, stock, foto, foto1, foto2, tag);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){if(movil!=null){out.println("Producto Ingresado Correctamente!!!");}else{response.sendRedirect("intranet/productos.jsp?resp=0");}}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{if(movil!=null){out.println("Error al Ingresar Producto!!!");}else{response.sendRedirect("intranet/productos.jsp?resp=falso");}}//De lo contrario envio la variable msg con el valor falso
        }else{if(movil!=null){out.println("Error al Ingresar Producto!!!");}else{response.sendRedirect("intranet/productos.jsp?msg=nulo");}}
        }
        
       //Realizo el procedimiento para modificar el personal
       if (modifica != null) {
       if (codigo != null && des != null) {
           if(stock!=null && foto!=null && foto1!=null ){
            boolean resultado=modify.modificaProducto(codigo, scat, des, marca, talla, color, precio, stock, foto, foto1, foto2, tag);
        if (resultado){if(movil!=null){out.println("Producto Modificado Correctamente!!!");}else{response.sendRedirect("intranet/productos.jsp?resp=1");}}
        else{if(movil!=null){out.println("Error al Modificar Producto!!!");}else{response.sendRedirect("intranet/productos.jsp?resp=2");}}
        }else{if(movil!=null){out.println("Error al Modificar Producto!!!");}else{response.sendRedirect("intranet/productos.jsp?resp=nulo");}}
       }
       }

        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet moduloProducto</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet moduloProducto at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
