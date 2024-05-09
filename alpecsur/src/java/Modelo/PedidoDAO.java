package Modelo;

import config.Conexion;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PedidoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Pedido buscarPorId(int idPedido) {
        Pedido pedido = new Pedido();
        String sql = "SELECT * FROM pedido WHERE idPedido=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();
            if (rs.next()) {
                pedido.setIdPedido(rs.getInt(1));
                pedido.setIdCliente(rs.getInt(2));
                pedido.setIdEmpleado(rs.getInt(3));
                pedido.setTipoComprobante(rs.getString(4));
                pedido.setNumComprobante(rs.getString(5));
                pedido.setFecha(rs.getDate(6));
                pedido.setTotal(rs.getDouble(7));
                pedido.setIdEstadoPedido(rs.getInt(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId PedidoDAO: " + e.getMessage());
        }
        return pedido;
    }

    public List<Pedido> buscarPorCliente(int idCliente) {
        List<Pedido> listaPedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedido WHERE idCliente=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdPedido(rs.getInt(1));
                pedido.setIdCliente(rs.getInt(2));
                pedido.setIdEmpleado(rs.getInt(3));
                pedido.setTipoComprobante(rs.getString(4));
                pedido.setNumComprobante(rs.getString(5));
                pedido.setFecha(rs.getDate(6));
                pedido.setTotal(rs.getDouble(7));
                pedido.setIdEstadoPedido(rs.getInt(8));
                listaPedidos.add(pedido);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorCliente PedidoDAO: " + e.getMessage());
        }
        return listaPedidos;
    }

    public List<Pedido> buscarPorEmpleado(int idEmpleado) {
        List<Pedido> listaPedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedido WHERE idEmpleado=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdPedido(rs.getInt(1));
                pedido.setIdCliente(rs.getInt(2));
                pedido.setIdEmpleado(rs.getInt(3));
                pedido.setTipoComprobante(rs.getString(4));
                pedido.setNumComprobante(rs.getString(5));
                pedido.setFecha(rs.getDate(6));
                pedido.setTotal(rs.getDouble(7));
                pedido.setIdEstadoPedido(rs.getInt(8));
                listaPedidos.add(pedido);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorEmpleado PedidoDAO: " + e.getMessage());
        }
        return listaPedidos;
    }

    public List<Pedido> listar() {
        List<Pedido> listaPedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedido";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdPedido(rs.getInt(1));
                pedido.setIdCliente(rs.getInt(2));
                pedido.setIdEmpleado(rs.getInt(3));
                pedido.setTipoComprobante(rs.getString(4));
                pedido.setNumComprobante(rs.getString(5));
                pedido.setFecha(rs.getDate(6));
                pedido.setTotal(rs.getDouble(7));
                pedido.setIdEstadoPedido(rs.getInt(8));
                listaPedidos.add(pedido);
            }
        } catch (Exception e) {
            System.out.println("ERROR en listar PedidoDAO: " + e.getMessage());
        }
        return listaPedidos;
    }

    public int agregar(Pedido pedido) {
        String sql = "INSERT INTO pedido (idCliente, idEmpleado, tipoComprobante, numComprobante, fecha, total, idEstadoPedido) VALUES (?,?,?,?,?,?,?)";
        int resultado = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pedido.getIdCliente());
            ps.setInt(2, pedido.getIdEmpleado());
            ps.setString(3, pedido.getTipoComprobante());
            ps.setString(4, pedido.getNumComprobante());
            ps.setDate(5, pedido.getFecha());
            ps.setDouble(6, pedido.getTotal());
            ps.setInt(7, pedido.getIdEstadoPedido());
            resultado = ps.executeUpdate();
            System.out.println("Pedido agregado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR al agregar pedido: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                System.out.println("ERROR al cerrar conexiones: " + ex.getMessage());
            }
        }
        return resultado;
    }

    public int actualizar(Pedido pedido) {
        String sql = "UPDATE pedido SET idCliente=?, idEmpleado=?, tipoComprobante=?, numComprobante=?, fecha=?, total=?, idEstadoPedido=? WHERE idPedido=?";
        int resultado = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pedido.getIdCliente());
            ps.setInt(2, pedido.getIdEmpleado());
            ps.setString(3, pedido.getTipoComprobante());
            ps.setString(4, pedido.getNumComprobante());
            ps.setDate(5, pedido.getFecha());
            ps.setDouble(6, pedido.getTotal());
            ps.setInt(7, pedido.getIdEstadoPedido());
            resultado = ps.executeUpdate();
            System.out.println("Pedido actualizado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR al actualizar pedido: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                System.out.println("ERROR al cerrar conexiones: " + ex.getMessage());
            }
        }
        return resultado;
    }

    public int eliminar(int idPedido) {
        String sql = "DELETE FROM pedido WHERE idPedido=?";
        int resultado = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            resultado = ps.executeUpdate();
            System.out.println("Pedido eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR al eliminar pedido: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                System.out.println("ERROR al cerrar conexiones: " + ex.getMessage());
            }
        }
        return resultado;
    }
}
