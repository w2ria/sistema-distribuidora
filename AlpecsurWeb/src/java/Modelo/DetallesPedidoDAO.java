package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetallesPedidoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public DetallesPedido buscarPorId(int idDetallePedido) {
        DetallesPedido detalle = new DetallesPedido();
        String sql = "SELECT * FROM detallepedido WHERE idDetallePedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetallePedido);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalle.setIdDetallePedido(rs.getInt(1));
                detalle.setIdPedido(rs.getInt(2));
                detalle.setIdProducto(rs.getInt(3));
                detalle.setCantidad(rs.getInt(4));
                detalle.setPrecio(rs.getDouble(5));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId DetallesPedidoDAO: " + e.getMessage());
        }
        return detalle;
    }

    public List<DetallesPedido> listar() {
        String sql = "SELECT * FROM detallepedido";
        List<DetallesPedido> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetallesPedido detalle = new DetallesPedido();
                detalle.setIdDetallePedido(rs.getInt(1));
                detalle.setIdPedido(rs.getInt(2));
                detalle.setIdProducto(rs.getInt(3));
                detalle.setCantidad(rs.getInt(4));
                detalle.setPrecio(rs.getDouble(5));
                lista.add(detalle);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar DetallesPedidoDAO: " + e.getMessage());
        }

        return lista;
    }

    public List<DetallesPedido> listarPorIdPedido(int idPedido) {
        List<DetallesPedido> lista = new ArrayList<>();
        String sql = "SELECT * FROM detallepedido WHERE idPedido = ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();

            while (rs.next()) {
                DetallesPedido detalle = new DetallesPedido();
                detalle.setIdDetallePedido(rs.getInt("idDetallePedido"));
                detalle.setIdPedido(rs.getInt("idPedido"));
                detalle.setIdProducto(rs.getInt("idProducto"));
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setPrecio(rs.getDouble("precio"));

                lista.add(detalle);
            }
        } catch (SQLException e) {
            System.out.println("Error en listarPorIdPedido en DetallesPedidoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return lista;
    }

    public int agregar(DetallesPedido detalle) {
        String sql = "INSERT INTO detallepedido (idPedido, idProducto, cantidad, precio) VALUES (?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalle.getIdPedido());
            ps.setInt(2, detalle.getIdProducto());
            ps.setInt(3, detalle.getCantidad());
            ps.setDouble(4, detalle.getPrecio());
            r = ps.executeUpdate();
            System.out.println("Detalle de pedido agregado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar DetallesPedidoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(DetallesPedido detalle) {
        String sql = "UPDATE detallepedido SET idPedido=?, idProducto=?, cantidad=?, precio=? WHERE idDetallePedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalle.getIdPedido());
            ps.setInt(2, detalle.getIdProducto());
            ps.setInt(3, detalle.getCantidad());
            ps.setDouble(4, detalle.getPrecio());
            ps.setInt(5, detalle.getIdDetallePedido());
            r = ps.executeUpdate();
            System.out.println("Detalle de pedido actualizado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar DetallesPedidoDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idDetallePedido) {
        String sql = "DELETE FROM detallepedido WHERE idDetallePedido=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetallePedido);
            ps.executeUpdate();
            System.out.println("Detalle de pedido eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar DetallesPedidoDAO: " + e.getMessage());
        }
    }

    public DetallesPedido obtenerPorId(int idDetallePedido) {
        DetallesPedido detallePedido = null;
        String sql = "SELECT * FROM detallepedido WHERE idDetallePedido = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetallePedido);
            rs = ps.executeQuery();
            if (rs.next()) {
                detallePedido = new DetallesPedido();
                detallePedido.setIdDetallePedido(rs.getInt("idDetallePedido"));
                detallePedido.setIdPedido(rs.getInt("idPedido"));
                detallePedido.setIdProducto(rs.getInt("idProducto"));
                detallePedido.setCantidad(rs.getInt("cantidad"));
                detallePedido.setPrecio(rs.getDouble("precio"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en obtenerPorId DetallesPedidoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return detallePedido;
    }

    public double calcularNuevoTotal(int idPedido) {
        double nuevoTotal = 0.0;
        String sql = "SELECT SUM(precio) AS nuevo_total FROM detallepedido WHERE idPedido = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevoTotal = rs.getDouble("nuevo_total");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en calcularNuevoTotal en DetallesPedidoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return nuevoTotal;
    }

    public int contarDetallesConIdPedido(int idPedido) {
        String sql = "SELECT COUNT(*) AS count FROM detallepedido WHERE idPedido = ?";
        int count = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en contarDetallesConIdPedido PedidoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return count;
    }

    public boolean eliminarDetallesPorIdPedido(int idPedido) {
        String sql = "DELETE FROM detallepedido WHERE idPedido = ?";
        boolean eliminado = false;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            int rowsAffected = ps.executeUpdate();
            eliminado = rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("ERROR en eliminarDetallesPorIdPedido PedidoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return eliminado;
    }

    public List<DetallesPedido> listarTodoPorIdPedido(int idPedido) {
        String sql = "SELECT dp.*, p.nombre AS nombreProducto "
                + "FROM detallepedido dp "
                + "INNER JOIN producto p ON dp.idProducto = p.idProducto "
                + "WHERE dp.idPedido = ?";
        List<DetallesPedido> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetallesPedido detallePedido = new DetallesPedido();
                detallePedido.setIdDetallePedido(rs.getInt("idDetallePedido"));
                detallePedido.setIdPedido(rs.getInt("idPedido"));
                detallePedido.setIdProducto(rs.getInt("idProducto"));
                detallePedido.setCantidad(rs.getInt("cantidad"));
                detallePedido.setPrecio(rs.getDouble("precio"));

                lista.add(detallePedido);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listarPorIdPedido DetallePedidoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

}
