package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetalleIngresoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public DetalleIngreso buscarPorId(int idDetalleIngreso) {
        DetalleIngreso detalleIngreso = new DetalleIngreso();
        String sql = "SELECT * FROM detalleIngreso WHERE idDetalleIngreso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleIngreso);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleIngreso.setIdDetalleIngreso(rs.getInt(1));
                detalleIngreso.setIdIngreso(rs.getInt(2));
                detalleIngreso.setIdProducto(rs.getInt(3));
                detalleIngreso.setCantidad(rs.getInt(4));
                detalleIngreso.setStockActual(rs.getInt(5));
                detalleIngreso.setPrecio(rs.getDouble(6));
                detalleIngreso.setFechaVencimiento(rs.getDate(7));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId DetalleIngresoDAO: " + e.getMessage());
        }
        return detalleIngreso;
    }

    public List<DetalleIngreso> listar() {
        String sql = "SELECT * FROM detalleIngreso";
        List<DetalleIngreso> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleIngreso detalleIngreso = new DetalleIngreso();
                detalleIngreso.setIdDetalleIngreso(rs.getInt(1));
                detalleIngreso.setIdIngreso(rs.getInt(2));
                detalleIngreso.setIdProducto(rs.getInt(3));
                detalleIngreso.setCantidad(rs.getInt(4));
                detalleIngreso.setStockActual(rs.getInt(5));
                detalleIngreso.setPrecio(rs.getDouble(6));
                detalleIngreso.setFechaVencimiento(rs.getDate(7));
                lista.add(detalleIngreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Listar DetalleIngresoDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(DetalleIngreso detalleIngreso) {
        String sql = "INSERT INTO detalleIngreso (idIngreso, idProducto, cantidad, stockActual, precio, fechaVencimiento) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleIngreso.getIdIngreso());
            ps.setInt(2, detalleIngreso.getIdProducto());
            ps.setInt(3, detalleIngreso.getCantidad());
            ps.setInt(4, detalleIngreso.getStockActual());
            ps.setDouble(5, detalleIngreso.getPrecio());
            ps.setDate(6, detalleIngreso.getFechaVencimiento());
            ps.executeUpdate();
            System.out.println("Detalle de ingreso agregado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Agregar DetalleIngresoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(DetalleIngreso detalleIngreso) {
        String sql = "UPDATE detalleIngreso SET idIngreso=?, idProducto=?, cantidad=?, stockActual=?, precio=?, fechaVencimiento=? WHERE idDetalleIngreso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleIngreso.getIdIngreso());
            ps.setInt(2, detalleIngreso.getIdProducto());
            ps.setInt(3, detalleIngreso.getCantidad());
            ps.setInt(4, detalleIngreso.getStockActual());
            ps.setDouble(5, detalleIngreso.getPrecio());
            ps.setDate(6, detalleIngreso.getFechaVencimiento());
            ps.executeUpdate();
            System.out.println("Detalle de ingreso actualizado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Actualizar DetalleIngresoDAO: " + e.getMessage());
        }
        return r;
    }

    public void eliminar(int idDetalleIngreso) {
        String sql = "DELETE FROM detalleIngreso WHERE idDetalleIngreso=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleIngreso);
            ps.executeUpdate();
            System.out.println("Detalle de ingreso eliminado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Eliminar DetalleIngresoDAO: " + e.getMessage());
        }
    }

}
