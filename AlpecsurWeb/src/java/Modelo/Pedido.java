package Modelo;

import java.util.List;

public class Pedido {

    private int idPedido;
    private int idCliente;
    private int idEmpleado;
    private int idPago;
    private String tipoComprobante;
    private String numComprobante;
    private String fecha;
    private double total;
    private int idEstadoPedido;
    private List<Carrito> detallePedido;

    public Pedido() {
    }

    public Pedido(int idPedido, int idCliente, int idEmpleado, int idPago, String tipoComprobante, String numComprobante, String fecha, double total, int idEstadoPedido, List<Carrito> detallePedido) {
        this.idPedido = idPedido;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.idPago = idPago;
        this.tipoComprobante = tipoComprobante;
        this.numComprobante = numComprobante;
        this.fecha = fecha;
        this.total = total;
        this.idEstadoPedido = idEstadoPedido;
        this.detallePedido = detallePedido;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getIdEstadoPedido() {
        return idEstadoPedido;
    }

    public void setIdEstadoPedido(int idEstadoPedido) {
        this.idEstadoPedido = idEstadoPedido;
    }

    public List<Carrito> getDetallePedido() {
        return detallePedido;
    }

    public void setDetallePedido(List<Carrito> detallePedido) {
        this.detallePedido = detallePedido;
    }

    public String generarNuevoNumeroComprobante(String ultimoNumeroComprobante) {
        String[] partes = ultimoNumeroComprobante.split("-");
        int serie = Integer.parseInt(partes[0]);
        int numero = Integer.parseInt(partes[1]);

        numero++;

        if (numero > 99999999) {
            numero = 0;
            serie++;
        }

        String nuevoNumeroComprobante = String.format("%04d-%08d", serie, numero);

        return nuevoNumeroComprobante;
    }

}
