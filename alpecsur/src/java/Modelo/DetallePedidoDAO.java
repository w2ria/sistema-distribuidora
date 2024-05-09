package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetallePedidoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public DetallePedido buscarPorId(int idDetallePedido) {
        DetallePedido detallePedido = new DetallePedido();
        String sql = "SELECT * FROM detallePedido WHERE idDetallePedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetallePedido);
            rs = ps.executeQuery();
            while (rs.next()) {
                detallePedido.setIdDetallePedido(rs.getInt(1));
                detallePedido.setIdPedido(rs.getInt(2));
                detallePedido.setIdProducto(rs.getInt(3));
                detallePedido.setCantidad(rs.getInt(4));
                detallePedido.setPrecio(rs.getDouble(5));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId DetallePedidoDAO: " + e.getMessage());
        }
        return detallePedido;
    }

    public List<DetallePedido> listar() {
        String sql = "SELECT * FROM detallePedido";
        List<DetallePedido> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetallePedido detallePedido = new DetallePedido();
                detallePedido.setIdDetallePedido(rs.getInt(1));
                detallePedido.setIdPedido(rs.getInt(2));
                detallePedido.setIdProducto(rs.getInt(3));
                detallePedido.setCantidad(rs.getInt(4));
                detallePedido.setPrecio(rs.getDouble(5));
                lista.add(detallePedido);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Listar DetallePedidoDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(DetallePedido detallePedido) {
        String sql = "INSERT INTO detallePedido (idPedido, idProducto, cantidad, precio) VALUES (?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detallePedido.getIdPedido());
            ps.setInt(2, detallePedido.getIdProducto());
            ps.setInt(3, detallePedido.getCantidad());
            ps.setDouble(4, detallePedido.getPrecio());
            ps.executeUpdate();
            System.out.println("Detalle de pedido agregado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Agregar DetallePedidoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(DetallePedido detallePedido) {
        String sql = "UPDATE detallePedido SET idPedido=?, idProducto=?, cantidad=?, precio=? WHERE idDetallePedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detallePedido.getIdPedido());
            ps.setInt(2, detallePedido.getIdProducto());
            ps.setInt(3, detallePedido.getCantidad());
            ps.setDouble(4, detallePedido.getPrecio());
            ps.executeUpdate();
            System.out.println("Detalle de pedido actualizado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Actualizar DetallePedidoDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idDetallePedido) {
        String sql = "DELETE FROM detallePedido WHERE idDetallePedido=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetallePedido);
            ps.executeUpdate();
            System.out.println("Detalle de pedido eliminado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Eliminar DetallePedidoDAO: " + e.getMessage());
        }
    }
}
