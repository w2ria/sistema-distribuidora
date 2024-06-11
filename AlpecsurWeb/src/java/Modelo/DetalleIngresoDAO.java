package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class DetalleIngresoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<DetalleIngreso> listar() {
        String sql = "SELECT * FROM detalleingreso";
        List<DetalleIngreso> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleIngreso detalleIngreso = new DetalleIngreso();
                detalleIngreso.setIdDetalleIngreso(rs.getInt("idDetalleIngreso"));
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                detalleIngreso.setIdIngreso(ingreso);
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                detalleIngreso.setIdProducto(producto);
                detalleIngreso.setCantidad(rs.getInt("cantidad"));
                detalleIngreso.setStockActual(rs.getInt("stockActual"));
                detalleIngreso.setPrecio(rs.getDouble("precio"));
                detalleIngreso.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                lista.add(detalleIngreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listar DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

    public DetalleIngreso listarPorIdDetalleIngreso(int idDetalleIngreso) {
        String sql = "SELECT di.*, p.nombre AS nombreProducto "
                + "FROM detalleingreso di "
                + "INNER JOIN producto p ON di.idProducto = p.idProducto "
                + "WHERE di.idDetalleIngreso = ?";
        DetalleIngreso detalleIngreso = null;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleIngreso);
            rs = ps.executeQuery();
            if (rs.next()) {
                detalleIngreso = new DetalleIngreso();
                detalleIngreso.setIdDetalleIngreso(rs.getInt("idDetalleIngreso"));

                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                detalleIngreso.setIdIngreso(ingreso);

                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombreProducto"));
                detalleIngreso.setIdProducto(producto);

                detalleIngreso.setCantidad(rs.getInt("cantidad"));
                detalleIngreso.setStockActual(rs.getInt("stockActual"));
                detalleIngreso.setPrecio(rs.getDouble("precio"));
                detalleIngreso.setFechaVencimiento(rs.getDate("fechaVencimiento"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listarPorIdDetalleIngreso DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return detalleIngreso;
    }

    public List<DetalleIngreso> listarPorIdIngreso(int idIngreso) {
        String sql = "SELECT di.*, p.nombre AS nombreProducto "
                + "FROM detalleingreso di "
                + "INNER JOIN producto p ON di.idProducto = p.idProducto "
                + "WHERE di.idIngreso = ?";
        List<DetalleIngreso> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idIngreso);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleIngreso detalleIngreso = new DetalleIngreso();
                detalleIngreso.setIdDetalleIngreso(rs.getInt("idDetalleIngreso"));

                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                detalleIngreso.setIdIngreso(ingreso);

                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombreProducto"));
                detalleIngreso.setIdProducto(producto);

                detalleIngreso.setCantidad(rs.getInt("cantidad"));
                detalleIngreso.setStockActual(rs.getInt("stockActual"));
                detalleIngreso.setPrecio(rs.getDouble("precio"));
                detalleIngreso.setFechaVencimiento(rs.getDate("fechaVencimiento"));

                lista.add(detalleIngreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listarPorIdIngreso DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

    public int agregar(DetalleIngreso detalleIngreso) {
        String sql = "INSERT INTO detalleingreso (idIngreso, idProducto, cantidad, stockActual, precio, fechaVencimiento) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleIngreso.getIdIngreso().getIdIngreso());
            ps.setInt(2, detalleIngreso.getIdProducto().getIdProducto());
            ps.setInt(3, detalleIngreso.getCantidad());
            ps.setInt(4, detalleIngreso.getStockActual());
            ps.setDouble(5, detalleIngreso.getPrecio());
            ps.setDate(6, detalleIngreso.getFechaVencimiento());
            r = ps.executeUpdate();
            System.out.println("Detalle de ingreso agregado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en agregar DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public int actualizar(DetalleIngreso detalleIngreso) {
        String sql = "UPDATE detalleingreso SET stockActual=?, precio=?, fechaVencimiento=? WHERE idDetalleIngreso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleIngreso.getStockActual());
            ps.setDouble(2, detalleIngreso.getPrecio());
            ps.setDate(3, detalleIngreso.getFechaVencimiento());
            ps.setInt(4, detalleIngreso.getIdDetalleIngreso());
            r = ps.executeUpdate();
            System.out.println("Detalle de ingreso actualizado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en actualizar DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return r;
    }

    public boolean eliminar(int idDetalleIngreso) {
        String sql = "DELETE FROM detalleingreso WHERE idDetalleIngreso=?";
        boolean eliminado = false;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleIngreso);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                eliminado = true;
                System.out.println("Detalle de ingreso eliminado correctamente!");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en eliminar DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return eliminado;
    }

    public DetalleIngreso buscarPorId(int idDetalleIngreso) {
        DetalleIngreso detalleIngreso = null;
        String sql = "SELECT * FROM detalleingreso WHERE idDetalleIngreso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleIngreso);
            rs = ps.executeQuery();
            if (rs.next()) {
                detalleIngreso = new DetalleIngreso();
                detalleIngreso.setIdDetalleIngreso(rs.getInt("idDetalleIngreso"));
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                detalleIngreso.setIdIngreso(ingreso);
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                detalleIngreso.setIdProducto(producto);
                detalleIngreso.setCantidad(rs.getInt("cantidad"));
                detalleIngreso.setStockActual(rs.getInt("stockActual"));
                detalleIngreso.setPrecio(rs.getDouble("precio"));
                detalleIngreso.setFechaVencimiento(rs.getDate("fechaVencimiento"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return detalleIngreso;
    }

    public double calcularNuevoTotal(int idIngreso) {
        double nuevoTotal = 0.0;
        String sql = "SELECT SUM(precio) AS nuevo_total FROM detalleingreso WHERE idIngreso = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idIngreso);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevoTotal = rs.getDouble("nuevo_total");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en calcularNuevoTotal en DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return nuevoTotal;
    }

    public int contarDetallesConIdIngreso(int idIngreso) {
        String sql = "SELECT COUNT(*) AS count FROM detalleingreso WHERE idIngreso = ?";
        int count = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idIngreso);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en contarDetallesConIdIngreso DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return count;
    }

    public boolean eliminarDetallesPorIdIngreso(int idIngreso) {
        String sql = "DELETE FROM detalleingreso WHERE idIngreso = ?";
        boolean eliminado = false;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idIngreso);
            int rowsAffected = ps.executeUpdate();
            eliminado = rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("ERROR en eliminarDetallesPorIdIngreso DetalleIngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return eliminado;
    }

}
