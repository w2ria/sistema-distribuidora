package Modelo;

import java.sql.Date;
import java.sql.Time;

public class Devolucion {

    private int idDevolucion;
    private Date fecha;
    private Time hora;
    private int idEmpleado;
    private String motivo;
    private String observaciones;

    public Devolucion() {
    }

    public Devolucion(int idDevolucion, Date fecha, Time hora, int idEmpleado, String motivo, String observaciones) {
        this.idDevolucion = idDevolucion;
        this.fecha = fecha;
        this.hora = hora;
        this.idEmpleado = idEmpleado;
        this.motivo = motivo;
        this.observaciones = observaciones;
    }

    public int getIdDevolucion() {
        return idDevolucion;
    }

    public void setIdDevolucion(int idDevolucion) {
        this.idDevolucion = idDevolucion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

}
