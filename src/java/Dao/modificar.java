/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;
/**
 *
 *
 */
public class modificar{

    Connection cn;
   
       public boolean modificaPersonal(String codigo,String apellidos, String nombres,String dni, 
       String telefono, String direccion, String cargo, String email,String estado){
       boolean resultado=false;

    try{
        int filas=0;
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_modificar_per(?,?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, codigo);
        cstmt.setString(2, nombres);
        cstmt.setString(3, apellidos);
        cstmt.setString(4, dni);
        cstmt.setString(5, telefono);
        cstmt.setString(6, direccion);
        cstmt.setString(7, email);
        cstmt.setString(8, cargo);
        cstmt.setString(9, estado);
        

            filas=cstmt.executeUpdate();
            if(filas>=1){
            resultado= true;
            cstmt.close();
            }

    }catch(SQLException ex){  System.out.print("Error en el procedimiento Modificar Personal ");}
        finally{
        return resultado;
        }
}

public boolean modificaClienteNatural (String codigo,String direccion,String email,String telefono,String usuario,String clave,String apellidos,String nombres, String dni, String sexo,String estado  ){
        boolean resultado=false;

    try{
        int filas=0;
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_modificar_cn(?,?,?,?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, codigo);
        cstmt.setString(2, direccion);
        cstmt.setString(3, email);
        cstmt.setString(4, telefono);
        cstmt.setString(5, usuario);
        cstmt.setString(6, clave);
        cstmt.setString(7, apellidos);
        cstmt.setString(8, nombres);
        cstmt.setString(9, dni);
        cstmt.setString(10, sexo);
        cstmt.setString(11, estado);
            filas=cstmt.executeUpdate();
            if(filas>=1){
            resultado= true;
            cstmt.close();
            }

    }catch(SQLException ex){  System.out.print("Error en el procedimiento Modificar Cliente Natural");}
        finally{
        return resultado;
        }
}


public boolean pagareservaa (String codigo){
        boolean resultado=false;

    try{
        int filas=0;
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_pagar_reserva(?)}");
        cstmt.setString(1, codigo);
            filas=cstmt.executeUpdate();
            if(filas>=1){
            resultado= true;
            cstmt.close();
            }

    }catch(SQLException ex){  System.out.print("Error en el procedimiento Pagar Reserva");}
        finally{
        return resultado;
        }
}

public boolean pagareservaa1 (String codigo){
        boolean resultado=false;

    try{
        int filas=0;
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_pagar_reserva1(?)}");
        cstmt.setString(1, codigo);
            filas=cstmt.executeUpdate();
            if(filas>=1){
            resultado= true;
            cstmt.close();
            }

    }catch(SQLException ex){  System.out.print("Error en el procedimiento Pagar Reserva");}
        finally{
        return resultado;
        }
}

public boolean modificaClienteJuridico (String codigo,String direccion,String email,String telefono,String usuario,String clave,String rz, String repre, String ruc, String estado ){
        boolean resultado=false;

    try{
        int filas=0;
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_modificar_cj(?,?,?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, codigo);
        cstmt.setString(2, direccion);
        cstmt.setString(3, email);
        cstmt.setString(4, telefono);
        cstmt.setString(5, usuario);
        cstmt.setString(6, clave);
        cstmt.setString(7, rz);
        cstmt.setString(8, repre);
        cstmt.setString(9, ruc);
        cstmt.setString(10, estado);
            filas=cstmt.executeUpdate();
            if(filas>=1){
            resultado= true;
            cstmt.close();
            }

    }catch(SQLException ex){  System.out.print("Error en el procedimiento Modificar Cliente Juridico");}
        finally{
        return resultado;
        }
}

    public boolean modificaProducto(String codigo,String subcat,String des,String marca,String talla,String color,String precio,String stock,String foto,String foto1,String foto2,String tag){
        boolean resultado=false;
   try{
        int filas=0;
        conexion con=new conexion();
        cn=con.getAccesoBD();
        CallableStatement cstmt;
        cstmt=cn.prepareCall("{call sp_modificar_pro(?,?,?,?,?,?,?,?,?,?,?,?)}");
        cstmt.setString(1, codigo);
        cstmt.setString(2, subcat);
        cstmt.setString(3, des);
        cstmt.setString(4, marca);
        cstmt.setString(5, talla);
        cstmt.setString(6, color);
        cstmt.setString(7, precio);
        cstmt.setString(8, stock);
        cstmt.setString(9, foto);
        cstmt.setString(10, foto1);
        cstmt.setString(11, foto2);
        cstmt.setString(12, tag);

        filas=cstmt.executeUpdate();
            if(filas>=1){
            resultado= true;
            cstmt.close();
            }

    }catch(SQLException ex){  System.out.print("Error en el procedimiento Modificar Producto" + ex);}
        finally{
        return resultado;
        }
        }
}


    