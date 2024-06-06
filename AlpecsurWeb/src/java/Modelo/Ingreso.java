package Modelo;

import java.sql.Date;

public class Ingreso {

    private int idIngreso;
    private Proveedor idProveedor;
    private String tipoComprobante;
    private String numComprobante;
    private Date fecha;
    private Double total;

    public Ingreso() {
    }

    public Ingreso(int idIngreso, Proveedor idProveedor, String tipoComprobante, String numComprobante, Date fecha, Double total) {
        this.idIngreso = idIngreso;
        this.idProveedor = idProveedor;
        this.tipoComprobante = tipoComprobante;
        this.numComprobante = numComprobante;
        this.fecha = fecha;
        this.total = total;
    }

    public int getIdIngreso() {
        return idIngreso;
    }

    public void setIdIngreso(int idIngreso) {
        this.idIngreso = idIngreso;
    }

    public Proveedor getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(Proveedor idProveedor) {
        this.idProveedor = idProveedor;
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String generarNuevoNumeroComprobante(int ultimoNumero, String tipoComprobante) {
        int nuevoNumero = ultimoNumero + 1;
        String abreviatura = "";

        switch (tipoComprobante) {
            case "Factura Electronica":
                abreviatura = "FE";
                break;
            case "Boleta de Venta Electronica":
                abreviatura = "BVE";
                break;
            case "Nota de Credito Electronica":
                abreviatura = "NCE";
                break;
            case "Nota de Debito Electronica":
                abreviatura = "NDE";
                break;
            default:
                throw new IllegalArgumentException("Tipo de comprobante no reconocido: " + tipoComprobante);
        }

        return String.format("%s%04d", abreviatura, nuevoNumero);
    }

}
