package Dao;

import java.sql.*;
import java.util.Vector;
import Beans.*;
import java.util.ArrayList;

public class busquedas {
    Connection con;
    CallableStatement cstmt;
    ResultSet rs;

    //Metodo utilizado para obtener todos los productos de nuestra base de datos
  
      public cliente obtenerClienteJuridicoRUC(String codigo) {
            try {
            cliente   p = new cliente();
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            CallableStatement Cstmt;
            Cstmt = con.prepareCall("{CALL sp_buscar_cj(?)}");
            Cstmt.setString(1, codigo);
            ResultSet rs;
            rs = Cstmt.executeQuery();
            rs.next();
                p.setCodigo(rs.getString(1));
                p.setRz(rs.getString(2));
                p.setRuc(rs.getString(3));
                p.setDireccion(rs.getString(4));
                p.setEmail(rs.getString(5));
                p.setTelefono(rs.getString(6));
            
            return p;
        } catch (SQLException ex) {
            System.out.println("Error en procedimiento almacenado Buscar Cliente Juridico");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }
      
      
      public cliente obtenerClienteNaturalDNI(String codigo) {
            try {
            cliente   p = new cliente();
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            CallableStatement Cstmt;
            Cstmt = con.prepareCall("{CALL sp_buscar_cn(?)}");
            Cstmt.setString(1, codigo);
            ResultSet rs;
            rs = Cstmt.executeQuery();
            rs.next();
                p.setCodigo(rs.getString(1));
                p.setDireccion(rs.getString(2));
                p.setEmail(rs.getString(3));
                p.setTelefono(rs.getString(4));
                p.setApellidos(rs.getString(5));
                p.setDni(rs.getString(6));
            
            return p;
        } catch (SQLException ex) {
            System.out.println("Error en procedimiento almacenado Buscar Cliente Natural");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }
      
    public personal obtenerPersonalDNI(String codigo) {
            try {
            personal   p = new personal();
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            CallableStatement Cstmt;
            Cstmt = con.prepareCall("{CALL sp_buscar_pe(?)}");
            Cstmt.setString(1, codigo);
            ResultSet rs;
            rs = Cstmt.executeQuery();
            rs.next();
                p.setCodigo(rs.getString(1));
                p.setApellidos(rs.getString(2));
                p.setDni(rs.getString(3));
                p.setTelefono(rs.getString(4));
                p.setDireccion(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setIdcargo(rs.getString(7));
            
            return p;
        } catch (SQLException ex) {
            System.out.println("Error en procedimiento almacenado Buscar Personal");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }
    
    //Metodo utilizado para obtener todos los productos de nuestra base de datos
    
    public Producto obtenerProducto(String codigo) {
            try {
            Producto   p = new Producto();
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            CallableStatement Cstmt;
            Cstmt = con.prepareCall("{CALL sp_buscar_pro(?)}");
            Cstmt.setString(1, codigo);
            ResultSet rs;
            rs = Cstmt.executeQuery();
            rs.next();
                p.setCodigo(rs.getString(1));
                p.setMarca(rs.getString(2));
                p.setPrecio(rs.getString(3));
                p.setColor(rs.getString(4));
                p.setFoto(rs.getString(5));
                p.setSubcat(rs.getString(7));
                p.setDescripcion(rs.getString(8));
                p.setStock(rs.getString(9));
            
            return p;
        } catch (SQLException ex) {
            System.out.println("Error en procedimiento almacenado Buscar Producto");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }

      
    
        public cliente logeoCliente(String email, String clave) {
        try {
            cliente user = new cliente();
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            cstmt = con.prepareCall("{call sp_validar_cli(?,?)}");
            cstmt.setString(1, email);
            cstmt.setString(2, clave);
            rs = cstmt.executeQuery();
            rs.next();
            user.setCodigo(rs.getString(1));
            user.setNombres(rs.getString(2));
            user.setDni(rs.getString(3));
            user.setDireccion(rs.getString(4));
            user.setEmail(rs.getString(5));
            user.setTelefono(rs.getString(6));
            return user;
        } catch (SQLException ex) {
            System.out.println("Error en procedimiento almacenado Iniciar Secion para cliente");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }
        
        public usuario logeo(String usuario, String clave) {
        try {
            usuario user = new usuario();
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            cstmt = con.prepareCall("{call sp_validar_per(?,?)}");
            cstmt.setString(1, usuario);
            cstmt.setString(2, clave);
            rs = cstmt.executeQuery();
            rs.next();
            user.setApellidos(rs.getString(1));
            user.setNombres(rs.getString(2));
            user.setDni(rs.getString(3));
            user.setTelefono(rs.getString(4));
            user.setCargo(rs.getString(5));
            user.setFoto(rs.getString(6));
            return user;
        } catch (SQLException ex) {
            System.out.println("Error en procedimiento almacenado Iniciar Secion para intranet");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }

       
  public Vector llenarVectorCategoria() {
        Vector aux=new Vector();
        try {
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            cstmt = con.prepareCall("{call sp_mostrarcat}");
            ResultSet rs;
            rs = cstmt.executeQuery();
            while(rs.next()){
                String[] datos=new String[2];
                datos[0]=rs.getString(1);
                datos[1]=rs.getString(2);
                aux.add(datos);
            }
            cstmt.close();
            con.close();
            return aux;
        } catch (SQLException ex) {
            System.out.println("Error");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }
        
        
  public Vector llenarVectorMarca() {
        Vector aux=new Vector();
        try {
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            cstmt = con.prepareCall("{call sp_mostrarmarca}");
            ResultSet rs;
            rs = cstmt.executeQuery();
            while(rs.next()){
                String[] datos=new String[2];
                datos[0]=rs.getString(1);
                datos[1]=rs.getString(2);
                aux.add(datos);
            }
            cstmt.close();
            con.close();
            return aux;
        } catch (SQLException ex) {
            System.out.println("Error");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }

  
  public Vector llenarVectorScat(String codigo) {
        Vector aux=new Vector();
        try {
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            cstmt = con.prepareCall("{call sp_mostrarscat(?)}");
            cstmt.setString(1, codigo);
            ResultSet rs;
            rs = cstmt.executeQuery();
            while(rs.next()){
                String[] datos=new String[2];
                datos[0]=rs.getString(1);
                datos[1]=rs.getString(2);
                aux.add(datos);
            }
            cstmt.close();
            con.close();
            return aux;
        } catch (SQLException ex) {
            System.out.println("Error");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }

  public Vector llenarVectorCargo() {
        Vector aux=new Vector();
        try {
            conexion cn = new conexion();
            con = cn.getAccesoBD();
            cstmt = con.prepareCall("{call sp_mostrarcargo}");
            ResultSet rs;
            rs = cstmt.executeQuery();
            while(rs.next()){
                String[] datos=new String[2];
                datos[0]=rs.getString(1);
                datos[1]=rs.getString(2);
                aux.add(datos);
            }
            cstmt.close();
            con.close();
            return aux;
        } catch (SQLException ex) {
            System.out.println("Error");
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
            }
        }
    }

    }