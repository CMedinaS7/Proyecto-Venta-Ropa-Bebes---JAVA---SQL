/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;
import java.sql.*;
import Beans.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * 
 */
public class insertar {
   
  public boolean insertclienteNatural(String direccion,String email,String telefono,String usuario,String clave,String apellidos,String nombres,String dni,String sexo){
    boolean resultado=false;
    Connection cn=null;
    try{
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_insertar_cn(?,?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, direccion);
        cstmt.setString(2, email);
        cstmt.setString(3, telefono);
        cstmt.setString(4, usuario);
        cstmt.setString(5, clave);
        cstmt.setString(6, apellidos);
        cstmt.setString(7, nombres);
        cstmt.setString(8, dni);
        cstmt.setString(9, sexo);
        int fila=cstmt.executeUpdate();
        if(fila>=1){
            resultado=true;
        }
        cstmt.close();
    }catch(SQLException ex){System.out.println("Error al Insertar cliente Natural");}
    finally{
        try{
            cn.close();
        }catch(SQLException ex1){System.out.println("No existio Conexion");}
    }
    return resultado;
    }

   public boolean insertclienteJuridico(String direccion,String email,String telefono,String usuario,String clave,String ruc,String rz,String repre){
    boolean resultado=false;
    Connection cn=null;
    try{
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_insertar_cj(?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, direccion);
        cstmt.setString(2, email);
        cstmt.setString(3, telefono);
        cstmt.setString(4, usuario);
        cstmt.setString(5, clave);
        cstmt.setString(6, ruc);
        cstmt.setString(7, rz);
        cstmt.setString(8, repre);
        int fila=cstmt.executeUpdate();
        if(fila>=1){
            resultado=true;
        }
        cstmt.close();
    }catch(SQLException ex){System.out.println("Error al Insertar cliente Juridico");}
    finally{
        try{
            cn.close();
        }catch(SQLException ex1){System.out.println("No existio Conexion");}
    }
    return resultado;
    }


   public boolean insertpersonal(String nombres,String apellidos,String dni,String telefono,String direccion,String email,String cargo){
    boolean resultado=false;
    Connection cn=null;
    try{
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_insertar_per(?,?,?,?,?,?,?)}");
        cstmt.setString(1, nombres);
        cstmt.setString(2, apellidos);
        cstmt.setString(3, dni);
        cstmt.setString(4, telefono);
        cstmt.setString(5, direccion);
        cstmt.setString(6, email);
        cstmt.setString(7, cargo);
        int fila=cstmt.executeUpdate();
        if(fila>=1){
            resultado=true;
        }
        cstmt.close();
    }catch(SQLException ex){System.out.println("Error al Insertar personal");}
    finally{
        try{
            cn.close();
        }catch(SQLException ex1){System.out.println("No existio Conexion");}
    }
    return resultado;

    }

   public boolean insertproducto(String subcat,String des,String marca,String talla,String color,String precio,String stock,String foto,String foto1,String foto2,String tags){
    boolean resultado=false;
    Connection cn=null;
    try{
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_insertar_pro(?,?,?,?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, subcat);
        cstmt.setString(2, des);
        cstmt.setString(3, marca);
        cstmt.setString(4, talla);
        cstmt.setString(5, color);
        cstmt.setString(6, precio);
        cstmt.setString(7, stock);
        cstmt.setString(8, foto);
        cstmt.setString(9, foto1);
        cstmt.setString(10, foto2);
        cstmt.setString(11, tags);
        int fila=cstmt.executeUpdate();
        if(fila>=1){
            resultado=true;
        }
        cstmt.close();
    }catch(SQLException ex){System.out.println("Error al Insertar producto");}
    finally{
        try{
            cn.close();
        }catch(SQLException ex1){System.out.println("No existio Conexion");}
    }
    return resultado;
    }

public static synchronized boolean insertarDetalleVenta(DetalleVenta varDetalle, Connection cn) {
        CallableStatement cstmt = null;
        boolean resultado=false;    try {
            cstmt=cn.prepareCall("{call sp_insertar_det(?,?,?,?)}");
            cstmt.setString(1, varDetalle.getCodigov());
            cstmt.setString(2, varDetalle.getCodigop());
            cstmt.setString(3, varDetalle.getCantidad());
            cstmt.setString(4, varDetalle.getProducto().getPrecio());
            int fila=cstmt.executeUpdate();
        if(fila>=1){
            resultado=true;
        }

    }catch(SQLException ex){System.out.println("Error al Insertar Detalle Comprobante " + ex);}
    finally{
       
    }
    return resultado;
    }

    public static synchronized boolean insertarVenta(Venta varventa, ArrayList<DetalleVenta> detalle) {

        Connection cn = null;
        CallableStatement cstmt = null;
        boolean resultado = false;
        try {
            cn = conexion.getAccesoBD();
            cstmt=cn.prepareCall("{call sp_insertar_com(?,?,?,?,?)}");
            cstmt.registerOutParameter(1, Types.VARCHAR);
            cstmt.setString(2, varventa.getSubtotal());
            cstmt.setString(3, varventa.getPersonal());
            cstmt.setString(4, varventa.getCliente());
            cstmt.setString(5, varventa.getTipo());
            int fila=cstmt.executeUpdate();
        if(fila>=1){
            resultado=true;
        }
   
            //Codigo que se genero producto de la insercion ---> codigoVenta
            varventa.setCodigo(cstmt.getString(1));
            System.out.println(varventa.getCodigo() + "asdasdasdasdadadasd");
                      
            if (resultado) {
                for (DetalleVenta det : detalle) {
                    //Establecemos al detalle el codigo genero producto de la venta
                    det.setCodigov(varventa.getCodigo());
                    //Insertamos el detalle y le pasamos la conexion
                    resultado = insertarDetalleVenta(det, cn);
                    //Si nos devuelve false salimos del for
                    if (!resultado) {
                        break;
                    }
                }
                if (resultado) {
                    //Confirmamos la transaccion
                    cn.commit();
                } else {
                    //Negamos la transaccion
                    conexion.deshacerCambios(cn);
                }
            } else {
                //Negamos la transaccion
                conexion.deshacerCambios(cn);
            }

        } catch (SQLException e) {
            System.out.println(e);

        } catch (Exception e) {
            System.out.println(e);
        }
        return resultado;
    }
}