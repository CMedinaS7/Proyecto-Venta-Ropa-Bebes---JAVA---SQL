/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Util;
import java.util.Vector;
import Dao.cargar;
/**
 *
 * @author IES
 */
public class LlenarCombo1 
{
    public Vector llenarMarca()
    {
        cargar buscador=new cargar();
        Vector Aux=new Vector();
        if (buscador.devuelveCodigoMarca()!=null)
        {
         return Aux=buscador.devuelveCodigoMarca();
        }
        else
        {
            return null;
        }
    }

     public Vector llenarCargo()
    {
        cargar buscador=new cargar();
        Vector Aux=new Vector();
        if (buscador.devuelveCodigoCargo()!=null)
        {
         return Aux=buscador.devuelveCodigoCargo();
        }
        else
        {
            return null;
        }
    }
     
     public Vector llenarScat( String categoria)
    {
        cargar buscador=new cargar();
        Vector Aux=new Vector();
        if (buscador.devuelveCodigoCargo()!=null)
        {
         return Aux=buscador.devuelveCodigoScat(categoria);
        }
        else
        {
            return null;
        }
    }
     
      public Vector llenarcat()
    {
        cargar buscador=new cargar();
        Vector Aux=new Vector();
        if (buscador.devuelveCodigoCat()!=null)
        {
         return Aux=buscador.devuelveCodigoCat();
        }
        else
        {
            return null;
        }
    }

}