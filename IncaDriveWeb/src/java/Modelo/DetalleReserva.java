/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author piero
 */
public class DetalleReserva {
    private int idDetalleReserva;
    private int idReserva;
    private int idAutos;
    private int cantidad;
    private Double precio;

    public DetalleReserva() {
    }

    public DetalleReserva(int idDetalleReserva, int idReserva, int idAutos, int cantidad, Double precio) {
        this.idDetalleReserva = idDetalleReserva;
        this.idReserva = idReserva;
        this.idAutos = idAutos;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getIdDetalleReserva() {
        return idDetalleReserva;
    }

    public void setIdDetalleReserva(int idDetalleReserva) {
        this.idDetalleReserva = idDetalleReserva;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdAutos() {
        return idAutos;
    }

    public void setIdAutos(int idAutos) {
        this.idAutos = idAutos;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }
}
