package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Modelo.EstadoPedido;

public class EstadoPedidoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public EstadoPedido buscarPorId(int idEstadoPedido) {
        EstadoPedido estadoPedido = new EstadoPedido();
        String sql = "SELECT * FROM estadopedido WHERE idEstadoPedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEstadoPedido);
            rs = ps.executeQuery();
            while (rs.next()) {
                estadoPedido.setIdEstadoPedido(rs.getInt(1));
                estadoPedido.setNombre(rs.getString(2));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId EstadoPedidoDAO: " + e.getMessage());
        }finally {
            cn.cerrarConexion(con);
        }
        return estadoPedido;
    }

    public List<EstadoPedido> listar() {
        String sql = "SELECT * FROM estadopedido";
        List<EstadoPedido> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                EstadoPedido estadoPedido = new EstadoPedido();
                estadoPedido.setIdEstadoPedido(rs.getInt(1));
                estadoPedido.setNombre(rs.getString(2));
                lista.add(estadoPedido);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar EstadoPedidoDAO: " + e.getMessage());
        }finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

    public int agregar(EstadoPedido estadoPedido) {
        String sql = "INSERT INTO estadopedido (nombreEstado) VALUES (?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, estadoPedido.getNombre());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar EstadoPedidoDAO: " + e.getMessage());
        }finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public int actualizar(EstadoPedido estadoPedido) {
        String sql = "UPDATE estadopedido SET nombreEstado=? WHERE idEstadoPedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, estadoPedido.getNombre());
            ps.setInt(2, estadoPedido.getIdEstadoPedido());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar EstadoPedidoDAO: " + e.getMessage());
        }finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public void eliminar(int idEstadoPedido) {
        String sql = "DELETE FROM estadopedido WHERE idEstadoPedido=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEstadoPedido);
            ps.executeUpdate();
            System.out.println("Estado de pedido eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar EstadoPedidoDAO: " + e.getMessage());
        }finally {
            cn.cerrarConexion(con);
        }
    }
}
