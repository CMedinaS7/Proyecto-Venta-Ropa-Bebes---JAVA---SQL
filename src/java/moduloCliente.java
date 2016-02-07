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
import Beans.cliente;
/**
 *
 * 
 */

public class moduloCliente extends HttpServlet {
   
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
        String telefono1=request.getParameter("txttelefono1");
        String direccion=request.getParameter("txtdireccion");
        String direccion1=request.getParameter("txtdireccion1");
        String email=request.getParameter("txtemail");
        String email1=request.getParameter("txtemail1");
        String usuario=request.getParameter("txtusuario");
        String clave=request.getParameter("txtclave");
        String clave1=request.getParameter("txtclave1");
        String rz=request.getParameter("txtrz");
        String repre=request.getParameter("txtrepre");
        String ruc=request.getParameter("txtruc");
        String estado=request.getParameter("estado");
        String sexo=request.getParameter("cbosexo");
        
        String movil=request.getParameter("movil");

        String filtro=request.getParameter("txtfiltro");

        String grabarN=request.getParameter("grabarN");
        String grabarJ=request.getParameter("grabarJ");
        
        String modificarN=request.getParameter("modificarN");
        String modificarJ=request.getParameter("modificarJ");

        //Imprimo las variables en entorno NetBeans
        System.out.println(codigo);
        System.out.println(rz);
        System.out.println(repre);
        System.out.println(ruc);
        System.out.println(telefono);
        System.out.println(direccion);
        System.out.println(email);
        System.out.println(usuario);
        System.out.println(clave);
        
        String s="0";
        
        if("on".equals(estado)){
        s="1";
        }else{s="0";}
        
             
        //GRABAR
        
        if("natural".equals(filtro)){
        if(apellidos!=null && nombres!=null && dni!=null && email!=null && clave!=null){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=insert.insertclienteNatural(direccion, email, telefono, email, clave, apellidos, nombres, dni, sexo);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){response.sendRedirect("web/felicidades.jsp?s=0");}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{response.sendRedirect("web/index.jsp?resp=falso");}//De lo contrario envio la variable msg con el valor falso
        }else{response.sendRedirect("web/index.jsp?msg=nulo");}
        }else if("juridico".equals(filtro)){
        if(repre!=null && rz!=null && ruc!=null && email1!=null && clave1!=null){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=insert.insertclienteJuridico(direccion1, email1, telefono1, email1, clave1, ruc, rz, repre);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){response.sendRedirect("web/felicidades.jsp?s=0");}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{response.sendRedirect("web/index.jsp?resp=falso");}//De lo contrario envio la variable msg con el valor falso
        }else{response.sendRedirect("web/index.jsp?msg=nulo");}
        }
        
        if (grabarN != null) {//Pregunto si ha presionado el boton grabar
         if(apellidos!=null && nombres!=null && dni!=null && usuario!=null && clave!=null){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=insert.insertclienteNatural(direccion, email, telefono, usuario, clave, apellidos, nombres, dni, sexo);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){
            if(movil!=null){out.println("Cliente Natural Ingresado Correctamente");}else{
            response.sendRedirect("intranet/clientesN.jsp?resp=0");
                    }
                    }//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{
                
                if(movil!=null){out.println("Error al Ingresar Cliente Natural");}else{
                response.sendRedirect("intranet/clientesN.jsp?resp=falso");
                }
                }//De lo contrario envio la variable msg con el valor falso
        }else{
             
             if(movil!=null){out.println("Error al Ingresar Cliente Natural");}else{response.sendRedirect("intranet/clientesN.jsp?msg=nulo");}}
        }
        
        if (grabarJ != null) {//Pregunto si ha presionado el boton grabar
         if(repre!=null && rz!=null && ruc!=null && usuario!=null && clave!=null){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=insert.insertclienteJuridico(direccion, email, telefono, usuario, clave, ruc, rz, repre);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){
          if(movil!=null){out.println("Cliente Juridico Ingresado Correctamente");}else{response.sendRedirect("intranet/clientesJ.jsp?resp=0");}}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{
            
            if(movil!=null){out.println("Error al Ingresar Cliente Juridico");}else{response.sendRedirect("intranet/clientesJ.jsp?resp=falso");}}//De lo contrario envio la variable msg con el valor falso
        }else{if(movil!=null){out.println("Error al Ingresar Cliente Juridico");}else{response.sendRedirect("intranet/clientesJ.jsp?msg=nulo");}}
        }
        
        //MODIFICAR
        if (modificarJ != null) {//Pregunto si ha presionado el boton modificar
         if(repre!=null && rz!=null && ruc!=null && usuario!=null && clave!=null){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=modify.modificaClienteJuridico(codigo, direccion, email, telefono, usuario, clave, rz, repre, ruc, s);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){if(movil!=null){out.println("Cliente Juridico Modificado Correctamente");}else{response.sendRedirect("intranet/clientesJ.jsp?resp=1");}}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{if(movil!=null){out.println("Error al Modificar Cliente Juridico");}else{response.sendRedirect("intranet/clientesJ.jsp?resp=falso");}}//De lo contrario envio la variable msg con el valor falso
        }else{if(movil!=null){out.println("Error al Modificar Cliente Juridico");}else{response.sendRedirect("intranet/clientesJ.jsp?msg=nulo");}}
        }
        
        if (modificarN != null) {//Pregunto si ha presionado el boton modificar
         if(apellidos!=null && nombres!=null && dni!=null && usuario!=null && clave!=null){//Verifico que los campos obligatorios se hayan llenado
        boolean resultado=modify.modificaClienteNatural(codigo, direccion, email, telefono, usuario, clave, apellidos, nombres, dni, sexo, s);//Llamo al proceso insertar personal dandole los parametros (variables) y lo guardo en la variable resultado
        if (resultado){if(movil!=null){out.println("Cliente Natural Modificado Correctamente");}else{response.sendRedirect("intranet/clientesN.jsp?resp=1");}}//Pregunto si el resultado es positivo entonces envio la variable msg con el valor ok
        else{if(movil!=null){out.println("Error al Modificar Cliente Juridico");}else{response.sendRedirect("intranet/clientesN.jsp?resp=falso");}}//De lo contrario envio la variable msg con el valor falso
        }else{if(movil!=null){out.println("Error al Modificar Cliente Juridico");}else{response.sendRedirect("intranet/clientesN.jsp?msg=nulo");}}
        }
        
//
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet moduloCliente</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet moduloCliente at " + request.getContextPath () + "</h1>");
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
