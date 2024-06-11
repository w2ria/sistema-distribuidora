package Modelo;

import java.sql.Date;

public class DetalleIngreso {

    private int idDetalleIngreso;
    private Ingreso idIngreso;
    private Producto idProducto;
    private int cantidad;
    private int stockActual;
    private double precio;
    private Date fechaVencimiento;

    public DetalleIngreso() {
    }

    public DetalleIngreso(int idDetalleIngreso, Ingreso idIngreso, Producto idProducto, int cantidad, int stockActual, double precio, Date fechaVencimiento) {
        this.idDetalleIngreso = idDetalleIngreso;
        this.idIngreso = idIngreso;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.stockActual = stockActual;
        this.precio = precio;
        this.fechaVencimiento = fechaVencimiento;
    }

    public int getIdDetalleIngreso() {
        return idDetalleIngreso;
    }

    public void setIdDetalleIngreso(int idDetalleIngreso) {
        this.idDetalleIngreso = idDetalleIngreso;
    }

    public Ingreso getIdIngreso() {
        return idIngreso;
    }

    public void setIdIngreso(Ingreso idIngreso) {
        this.idIngreso = idIngreso;
    }

    public Producto getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Producto idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getStockActual() {
        return stockActual;
    }

    public void setStockActual(int stockActual) {
        this.stockActual = stockActual;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

}
