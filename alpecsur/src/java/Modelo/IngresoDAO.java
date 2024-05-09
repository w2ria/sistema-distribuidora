package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import config.Conexion;

public class IngresoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public int agregar(Ingreso ing) {
        String sql = "INSERT INTO ingreso (idProveedor, tipoComprobante, numComprobante, fecha, total) VALUES (?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ing.getIdProveedor());
            ps.setString(2, ing.getTipoComprobante());
            ps.setString(3, ing.getNumComprobante());
            ps.setDate(4, ing.getFecha());
            ps.setDouble(5, ing.getTotal());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al agregar ingreso: " + e.getMessage());
        }
        return r;
    }

    public int actualizar(Ingreso ing) {
        String sql = "UPDATE ingreso SET idProveedor=?, tipoComprobante=?, numComprobante=?, fecha=?, total=? WHERE idIngreso=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ing.getIdProveedor());
            ps.setString(2, ing.getTipoComprobante());
            ps.setString(3, ing.getNumComprobante());
            ps.setDate(4, ing.getFecha());
            ps.setDouble(5, ing.getTotal());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al actualizar ingreso: " + e.getMessage());
        }
        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM ingreso WHERE idIngreso=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar ingreso: " + e.getMessage());
        }
    }

    public List<Ingreso> listar() {
        String sql = "SELECT * FROM ingreso";
        List<Ingreso> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ingreso ing = new Ingreso();
                ing.setIdIngreso(rs.getInt(1));
                ing.setIdProveedor(rs.getInt(2));
                ing.setTipoComprobante(rs.getString(3));
                ing.setNumComprobante(rs.getString(4));
                ing.setFecha(rs.getDate(5));
                ing.setTotal(rs.getDouble(6));
                lista.add(ing);
            }
        } catch (Exception e) {
            System.out.println("Error al listar ingresos: " + e.getMessage());
        }
        return lista;
    }

    public Ingreso listarPorId(int id) {
        Ingreso ing = new Ingreso();
        String sql = "SELECT * FROM ingreso WHERE idIngreso=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ing.setIdIngreso(rs.getInt(1));
                ing.setIdProveedor(rs.getInt(2));
                ing.setTipoComprobante(rs.getString(3));
                ing.setNumComprobante(rs.getString(4));
                ing.setFecha(rs.getDate(5));
                ing.setTotal(rs.getDouble(6));
            }
        } catch (Exception e) {
            System.out.println("Error al listar ingreso por ID: " + e.getMessage());
        }
        return ing;
    }
}
