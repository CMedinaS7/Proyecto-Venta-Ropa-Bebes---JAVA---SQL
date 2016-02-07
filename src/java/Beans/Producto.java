/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

/**
 *
 * 
 */
public class Producto {
    private String codigo;
    private String subcat;
    private String descripcion;
    private String marca;
    private String talla;
    private String color;
    private String precio;
    private String stock;
    private String foto;
    private String foto1;
    private String foto2;
    private String tag;
    
      //Constructor de la clase sin parametros
    public Producto() {
    }
    //Constructor de la clase con parametros
    public Producto(String codigo,String subcat,String descripcion,String marca,String talla,String color,String precio,String stock,String foto,String foto1,String foto2,String tag) {
        this.codigo = codigo;
        this.subcat = subcat;
        this.descripcion = descripcion;
        this.marca = marca;
        this.talla = talla;
        this.color = color;
        this.precio = precio;
        this.stock = stock;
        this.foto = foto;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.tag = tag;
        
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the marca
     */
    public String getMarca() {
        return marca;
    }

    /**
     * @param marca the marca to set
     */
    public void setMarca(String marca) {
        this.marca = marca;
    }

    /**
     * @return the precio
     */
    public String getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(String precio) {
        this.precio = precio;
    }

    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the stock
     */
    public String getStock() {
        return stock;
    }

    /**
     * @param stock the stock to set
     */
    public void setStock(String stock) {
        this.stock = stock;
    }

    /**
     * @return the foto
     */
    public String getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(String foto) {
        this.foto = foto;
    }

    /**
     * @return the foto1
     */
    public String getFoto1() {
        return foto1;
    }

    /**
     * @param foto1 the foto1 to set
     */
    public void setFoto1(String foto1) {
        this.foto1 = foto1;
    }

    /**
     * @return the foto2
     */
    public String getFoto2() {
        return foto2;
    }

    /**
     * @param foto2 the foto2 to set
     */
    public void setFoto2(String foto2) {
        this.foto2 = foto2;
    }

    /**
     * @return the tag
     */
    public String getTag() {
        return tag;
    }

    /**
     * @param tag the tag to set
     */
    public void setTag(String tag) {
        this.tag = tag;
    }

    /**
     * @return the subcat
     */
    public String getSubcat() {
        return subcat;
    }

    /**
     * @param subcat the subcat to set
     */
    public void setSubcat(String subcat) {
        this.subcat = subcat;
    }

    /**
     * @return the talla
     */
    public String getTalla() {
        return talla;
    }

    /**
     * @param talla the talla to set
     */
    public void setTalla(String talla) {
        this.talla = talla;
    }
}
