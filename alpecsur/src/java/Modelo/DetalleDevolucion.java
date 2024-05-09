package Modelo;

public class DetalleDevolucion {

    private int idDetalleDevolucion;
    private int idDevolucion;
    private int idDetalleIngreso;

    public DetalleDevolucion() {
    }

    public DetalleDevolucion(int idDetalleDevolucion, int idDevolucion, int idDetalleIngreso) {
        this.idDetalleDevolucion = idDetalleDevolucion;
        this.idDevolucion = idDevolucion;
        this.idDetalleIngreso = idDetalleIngreso;
    }

    public int getIdDetalleDevolucion() {
        return idDetalleDevolucion;
    }

    public void setIdDetalleDevolucion(int idDetalleDevolucion) {
        this.idDetalleDevolucion = idDetalleDevolucion;
    }

    public int getIdDevolucion() {
        return idDevolucion;
    }

    public void setIdDevolucion(int idDevolucion) {
        this.idDevolucion = idDevolucion;
    }

    public int getIdDetalleIngreso() {
        return idDetalleIngreso;
    }

    public void setIdDetalleIngreso(int idDetalleIngreso) {
        this.idDetalleIngreso = idDetalleIngreso;
    }

}
