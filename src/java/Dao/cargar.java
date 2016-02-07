/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;
import java.sql.*;
import java.util.Vector;
/**
 *
 * 
 */
public class cargar {
    Connection cn=null;
    ResultSet rs=null;

    public Vector devuelveCodigoScat(String categoria)
{
    Vector aux=new Vector();
    try
    {
    conexion con = new conexion();
    CallableStatement Cstmt;
    cn = con.getAccesoBD();
    Cstmt = cn.prepareCall("{call sp_mostrarscat(?)}");
    Cstmt.setString(1, categoria);
    rs = Cstmt.executeQuery();
    while (rs.next())
    {
      String[] datos=new String[2];
      datos[0]=rs.getString(1);
      datos[1]=rs.getString(2);
      aux.add(datos);
    }
    }
    catch(SQLException ex)
    {
            System.out.println("Error en procedimiento");
    }
    return aux;
}

public Vector devuelveCodigoMarca()
{
    Vector aux=new Vector();
    try
    {
    conexion con = new conexion();
    CallableStatement Cstmt;
    cn = con.getAccesoBD();
    Cstmt = cn.prepareCall("{call sp_mostrarmarca}");
    rs = Cstmt.executeQuery();
    while (rs.next())
    {
      String[] datos=new String[2];
      datos[0]=rs.getString(1);
      datos[1]=rs.getString(2);
      aux.add(datos);
    }
    }
    catch(SQLException ex)
    {
            System.out.println("Error en procedimiento");
    }
    return aux;
}

public Vector devuelveCodigoCargo()
{
    Vector aux=new Vector();
    try
    {
    conexion con = new conexion();
    CallableStatement Cstmt;
    cn = con.getAccesoBD();
    Cstmt = cn.prepareCall("{call sp_mostrarcargo}");
    rs = Cstmt.executeQuery();
    while (rs.next())
    {
      String[] datos=new String[2];
      datos[0]=rs.getString(1);
      datos[1]=rs.getString(2);
      aux.add(datos);
    }
    }
    catch(SQLException ex)
    {
            System.out.println("Error en consulta");
    }
    return aux;
}

public Vector devuelveCodigoCat()
{
    Vector aux=new Vector();
    try
    {
    conexion con = new conexion();
    CallableStatement Cstmt;
    cn = con.getAccesoBD();
    Cstmt = cn.prepareCall("{call sp_mostrarcat}");
    rs = Cstmt.executeQuery();
    while (rs.next())
    {
      String[] datos=new String[2];
      datos[0]=rs.getString(1);
      datos[1]=rs.getString(2);
      aux.add(datos);
    }
    }
    catch(SQLException ex)
    {
            System.out.println("Error en consulta");
    }
    return aux;
}
}
