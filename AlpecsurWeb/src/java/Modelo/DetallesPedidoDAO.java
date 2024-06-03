
package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
