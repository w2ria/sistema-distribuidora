package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EstadoPedidoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public EstadoPedido buscarPorId(int idEstadoPedido) {
        EstadoPedido estadoPedido = new EstadoPedido();
        String sql = "SELECT * FROM estadoPedido WHERE idEstadoPedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEstadoPedido);
            rs = ps.executeQuery();
            while (rs.next()) {
                estadoPedido.setIdEstadoPedido(rs.getInt(1));
                estadoPedido.setNombreEstado(rs.getString(2));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId EstadoPedidoDAO: " + e.getMessage());
        }
        return estadoPedido;
    }

    public List<EstadoPedido> listar() {
        String sql = "SELECT * FROM estadoPedido";
        List<EstadoPedido> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                EstadoPedido estadoPedido = new EstadoPedido();
                estadoPedido.setIdEstadoPedido(rs.getInt(1));
                estadoPedido.setNombreEstado(rs.getString(2));
                lista.add(estadoPedido);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar EstadoPedidoDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(EstadoPedido estadoPedido) {
        String sql = "INSERT INTO estadoPedido (nombreEstado) VALUES (?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, estadoPedido.getNombreEstado());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar EstadoPedidoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(EstadoPedido estadoPedido) {
        String sql = "UPDATE estadoPedido SET nombreEstado=? WHERE idEstadoPedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, estadoPedido.getNombreEstado());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar EstadoPedidoDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idEstadoPedido) {
        String sql = "DELETE FROM estadoPedido WHERE idEstadoPedido=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEstadoPedido);
            ps.executeUpdate();
            System.out.println("Estado de pedido eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar EstadoPedidoDAO: " + e.getMessage());
        }
    }
}
