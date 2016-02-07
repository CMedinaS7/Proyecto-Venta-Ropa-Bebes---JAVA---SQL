/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.*;
import Beans.personal;


public class moduloPersonal extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
 
        //Instancio los paquestes del DAO
        modificar modify=new modificar();
        insertar insert=new insertar();
 
        //Capturo el valor de las cajas de texto en variables
        String codigo=request.getParameter("txtcodigo");
        String apellidos=request.getParameter("txtapellidos");
        String nombres=request.getParameter("txtnombres");
        String dni=request.getParameter("txtdni");
        String telefono=request.getParameter("txttelefono");
        String direccion=request.getParameter("txtdireccion");
        String email=request.getParameter("txtemail");
        String cargo=request.getParameter("cbocargo");
        String estado=request.getParameter("estado");
        String movil=request.getParameter("movil");
        
        //Capturo los nombres de los botones en variables
        String modifica=request.getParameter("modificar");
        String grabar=request.getParameter("grabar");
 
 
      System.out.println(estado);
        String s="0";
        
        if("on".equals(estado)){
        s="1";
        }else{s="0";}

        
        //Realizo el procedimiento para grabar en la BD
        if (grabar != null) {//Pregunto si ha presionado el boton grabar
         if(apellidos!=null && nombres!=null && dni!=null ){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=insert.insertpersonal(nombres, apellidos, dni, telefono, direccion, email, cargo);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){if(movil!=null){out.println("Personal Ingresado Correctamente!!!");}else{response.sendRedirect("intranet/personal.jsp?resp=0");}}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{if(movil!=null){out.println("Error al Ingresar Personal!!!");}else{response.sendRedirect("intranet/personal1.jsp?resp=falso");}}//De lo contrario envio la variable msg con el valor falso
        }else{if(movil!=null){out.println("Error al Ingresar Personal!!!");}else{response.sendRedirect("intranet/personal1.jsp?msg=nulo");}}
        }

        //Realizo el procedimiento para modificar el personal
       if (modifica != null) {
       if (codigo != null && apellidos != null) {
           if(nombres!=null && dni!=null && telefono!=null ){
            boolean resultado=modify.modificaPersonal(codigo, apellidos, nombres, dni, telefono, direccion, cargo, email,s);
        if (resultado){if(movil!=null){out.println("Personal Modificado Correctamente!!!");}else{response.sendRedirect("intranet/personal.jsp?resp=1");}}
        else{if(movil!=null){out.println("Error al Modificar Personal!!!");}else{response.sendRedirect("intranet/personal1.jsp?resp=2");}}
        }else{if(movil!=null){out.println("Error al Modificar Personal!!!");}else{response.sendRedirect("intranet/personal1.jsp?resp=nulo");}}

       }
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
