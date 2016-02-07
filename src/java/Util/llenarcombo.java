
package Util;
import java.util.Vector;
import Dao.cargar;

public class llenarcombo {
    cargar busca=new cargar();

    public Vector llenarmarca(){
        Vector aux=busca.devuelveCodigoCargo();
        return aux;
    }

     public Vector llenarcargo(){
        Vector aux=busca.devuelveCodigoCargo();
        return aux;
    }
     
     public Vector llenarscat(String cat ){
        Vector aux=busca.devuelveCodigoScat(cat);
        return aux;
    }
     
      public Vector llenarcat(){
        Vector aux=busca.devuelveCodigoCat();
        return aux;
    }
}
