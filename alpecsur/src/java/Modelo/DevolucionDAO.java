package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DevolucionDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Devolucion buscarPorId(int idDevolucion) {
        Devolucion devolucion = new Devolucion();
        String sql = "SELECT * FROM devolucion WHERE idDevolucion=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDevolucion);
            rs = ps.executeQuery();
            while (rs.next()) {
                devolucion.setIdDevolucion(rs.getInt(1));
                devolucion.setFecha(rs.getDate(2));
                devolucion.setHora(rs.getTime(3));
                devolucion.setIdEmpleado(rs.getInt(4));
                devolucion.setMotivo(rs.getString(5));
                devolucion.setObservaciones(rs.getString(6));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId DevolucionDAO: " + e.getMessage());
        }
        return devolucion;
    }

    public List<Devolucion> listar() {
        String sql = "SELECT * FROM devolucion";
        List<Devolucion> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Devolucion devolucion = new Devolucion();
                devolucion.setIdDevolucion(rs.getInt(1));
                devolucion.setFecha(rs.getDate(2));
                devolucion.setHora(rs.getTime(3));
                devolucion.setIdEmpleado(rs.getInt(4));
                devolucion.setMotivo(rs.getString(5));
                devolucion.setObservaciones(rs.getString(6));
                lista.add(devolucion);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Listar DevolucionDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(Devolucion devolucion) {
        String sql = "INSERT INTO devolucion (fecha, hora, idEmpleado, motivo, observaciones) VALUES (?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, devolucion.getFecha());
            ps.setTime(2, devolucion.getHora());
            ps.setInt(3, devolucion.getIdEmpleado());
            ps.setString(4, devolucion.getMotivo());
            ps.setString(5, devolucion.getObservaciones());
            ps.executeUpdate();
            System.out.println("Devolución agregada correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Agregar DevolucionDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Devolucion devolucion) {
        String sql = "UPDATE devolucion SET fecha=?, hora=?, idEmpleado=?, motivo=?, observaciones=? WHERE idDevolucion=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, devolucion.getFecha());
            ps.setTime(2, devolucion.getHora());
            ps.setInt(3, devolucion.getIdEmpleado());
            ps.setString(4, devolucion.getMotivo());
            ps.setString(5, devolucion.getObservaciones());
            ps.setInt(6, devolucion.getIdDevolucion());
            ps.executeUpdate();
            System.out.println("Devolución actualizada correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Actualizar DevolucionDAO: " + e.getMessage());
        } 

        return r;
    }

    public void eliminar(int idDevolucion) {
        String sql = "DELETE FROM devolucion WHERE idDevolucion=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDevolucion);
            ps.executeUpdate();
            System.out.println("Devolución eliminada correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Eliminar DevolucionDAO: " + e.getMessage());
        }
    }

}
