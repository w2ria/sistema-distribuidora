/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author piero
 */
public class Reserva {
    private int idReserva;
    private int idCliente;
    private int idEmpleado;
    private int idPago;
    private String tipoComprobante;
    private String numComprobante;
    private String ubicacion;
    private Date fecha_inicio;
    private Date fecha_fin;
    private String hora_inicio;
    private String hora_fin;
    private double total;
    private int idEstadoReserva;

    public Reserva() {
    }

    public Reserva(int idReserva, int idCliente, int idEmpleado, int idPago, String tipoComprobante, String numComprobante, String ubicacion, Date fecha_inicio, Date fecha_fin, String hora_inicio, String hora_fin, double total, int idEstadoReserva) {
        this.idReserva = idReserva;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.idPago = idPago;
        this.tipoComprobante = tipoComprobante;
        this.numComprobante = numComprobante;
        this.ubicacion = ubicacion;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.hora_inicio = hora_inicio;
        this.hora_fin = hora_fin;
        this.total = total;
        this.idEstadoReserva = idEstadoReserva;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public String getTipoComprobante() {
        return tipoComprobante;
    }

    public void setTipoComprobante(String tipoComprobante) {
        this.tipoComprobante = tipoComprobante;
    }

    public String getNumComprobante() {
        return numComprobante;
    }

    public void setNumComprobante(String numComprobante) {
        this.numComprobante = numComprobante;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(String hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public String getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(String hora_fin) {
        this.hora_fin = hora_fin;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getIdEstadoReserva() {
        return idEstadoReserva;
    }

    public void setIdEstadoReserva(int idEstadoReserva) {
        this.idEstadoReserva = idEstadoReserva;
    }

    
    
    
    
}
