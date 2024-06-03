
package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PedidoDAO {
    Connection con;
    conexion cn = new conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int generarPedido(Pedido pedido) {
        int idpedido;
        String sql = "INSERT INTO pedido(idCliente, idEmpleado, idPago, tipoComprobante, numComprobante, fecha, total, idEstadoPedido) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, pedido.getIdCliente());
            ps.setInt(2, pedido.getIdEmpleado());
            ps.setInt(3, pedido.getIdPago());
            ps.setString(4, pedido.getTipoComprobante());
            ps.setString(5, pedido.getNumComprobante());
            ps.setString(6, pedido.getFecha());
            ps.setDouble(7, pedido.getTotal());
            ps.setInt(8, pedido.getIdEstadoPedido());
            r = ps.executeUpdate();
            
            rs = ps.getGeneratedKeys();
            rs.next();
            idpedido = rs.getInt(1);
            rs.close();
            
            for (Carrito detalle : pedido.getDetallePedido()) {
                sql = "INSERT INTO detallepedido(idPedido, idProducto, cantidad, precio) VALUES (?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, idpedido);
                ps.setInt(2, detalle.getIdProducto());
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecio());
                r = ps.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error en GenerarPedido: " + e.getMessage());
        }
        return r;
    }

    public void generarPago(Pago pago) {
        String sql = "INSERT INTO pago(monto) VALUES (?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, pago.getMonto());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                pago.setIdPago(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println("Error en generarPago: " + e.getMessage());
        }
    }
    public String obtenerUltimoNumeroComprobante() {
        String ultimoComprobante = "0001-00000000";
        String sql = "SELECT numComprobante FROM pedido ORDER BY idPedido DESC LIMIT 1";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                ultimoComprobante = rs.getString("numComprobante");
            }
        } catch (SQLException e) {
            System.out.println("Error en obtenerUltimoNumeroComprobante: " + e.getMessage());
        }
        return ultimoComprobante;
    }
}
