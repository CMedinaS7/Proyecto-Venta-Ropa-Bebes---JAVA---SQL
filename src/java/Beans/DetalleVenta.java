package Beans;


public class DetalleVenta {

    private Venta venta;
    private Producto producto;
    private String codigov;
    private String codigop;
    private String cantidad;
    private String total;
    private String precio;
    

    public DetalleVenta() {
    }

    public DetalleVenta(String codigov, String codigop, String cantidad, String precio) {
        this.codigov = codigov;
        this.codigop = codigop;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    /**
     * @return the venta
     */
    public Venta getVenta() {
        return venta;
    }

    /**
     * @param venta the venta to set
     */
    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    /**
     * @return the producto
     */
    public Producto getProducto() {
        return producto;
    }

    /**
     * @param producto the producto to set
     */
    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    /**
     * @return the codigov
     */
    public String getCodigov() {
        return codigov;
    }

    /**
     * @param codigov the codigov to set
     */
    public void setCodigov(String codigov) {
        this.codigov = codigov;
    }

    /**
     * @return the codigop
     */
    public String getCodigop() {
        return codigop;
    }

    /**
     * @param codigop the codigop to set
     */
    public void setCodigop(String codigop) {
        this.codigop = codigop;
    }

    /**
     * @return the cantidad
     */
    public String getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the total
     */
    public String getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(String total) {
        this.total = total;
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
    
}