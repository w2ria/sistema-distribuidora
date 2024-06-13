package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<Pedido> listar() {
        List<Pedido> lista = new ArrayList<>();
        String sql = "SELECT * FROM pedido";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido ped = new Pedido();
                ped.setIdPedido(rs.getInt("idPedido"));
                ped.setIdCliente(rs.getInt("idCliente"));
                ped.setIdEmpleado(rs.getInt("idEmpleado"));
                ped.setIdPago(rs.getInt("idPago"));
                ped.setTipoComprobante(rs.getString("tipoComprobante"));
                ped.setNumComprobante(rs.getString("numComprobante"));
                ped.setFecha(rs.getString("fecha"));
                ped.setTotal(rs.getDouble("total"));
                ped.setIdEstadoPedido(rs.getInt("idEstadoPedido"));
                lista.add(ped);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    public int actualizar(Pedido p) {
        String sql = "UPDATE pedido SET idCliente = ?, idEmpleado = ?, idPago = ?, tipoComprobante = ?, numComprobante = ?, fecha = ?, total = ?, idEstadoPedido = ? WHERE idPedido = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, p.getIdCliente());
            ps.setInt(2, p.getIdEmpleado());
            ps.setInt(3, p.getIdPago());
            ps.setString(4, p.getTipoComprobante());
            ps.setString(5, p.getNumComprobante());
            ps.setString(6, p.getFecha());
            ps.setDouble(7, p.getTotal());
            ps.setInt(8, p.getIdEstadoPedido());
            ps.setInt(9, p.getIdPedido());
            r = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return r;
    }

    public Pedido obtenerPorId(int idPedido) {
        Pedido ped = null;
        String sql = "SELECT * FROM pedido WHERE idPedido = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();
            if (rs.next()) {
                ped = new Pedido();
                ped.setIdPedido(rs.getInt("idPedido"));
                ped.setIdCliente(rs.getInt("idCliente"));
                ped.setIdEmpleado(rs.getInt("idEmpleado"));
                ped.setIdPago(rs.getInt("idPago"));
                ped.setTipoComprobante(rs.getString("tipoComprobante"));
                ped.setNumComprobante(rs.getString("numComprobante"));
                ped.setFecha(rs.getString("fecha"));
                ped.setTotal(rs.getDouble("total"));
                ped.setIdEstadoPedido(rs.getInt("idEstadoPedido"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ped;
    }

}
