package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DetalleDevolucionDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public DetalleDevolucion buscarPorId(int idDetalleDevolucion) {
        DetalleDevolucion detalleDevolucion = new DetalleDevolucion();
        String sql = "SELECT * FROM detalleDevolucion WHERE idDetalleDevolucion=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleDevolucion);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleDevolucion.setIdDetalleDevolucion(rs.getInt(1));
                detalleDevolucion.setIdDevolucion(rs.getInt(2));
                detalleDevolucion.setIdDetalleIngreso(rs.getInt(3));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId DetalleDevolucionDAO: " + e.getMessage());
        }
        return detalleDevolucion;
    }

    public List<DetalleDevolucion> listar() {
        String sql = "SELECT * FROM detalleDevolucion";
        List<DetalleDevolucion> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleDevolucion detalleDevolucion = new DetalleDevolucion();
                detalleDevolucion.setIdDetalleDevolucion(rs.getInt(1));
                detalleDevolucion.setIdDevolucion(rs.getInt(2));
                detalleDevolucion.setIdDetalleIngreso(rs.getInt(3));
                lista.add(detalleDevolucion);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar DetalleDevolucionDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(DetalleDevolucion detalleDevolucion) {
        String sql = "INSERT INTO detalleDevolucion (idDevolucion, idDetalleIngreso) VALUES (?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleDevolucion.getIdDevolucion());
            ps.setInt(2, detalleDevolucion.getIdDetalleIngreso());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar DetalleDevolucionDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(DetalleDevolucion detalleDevolucion) {
        String sql = "UPDATE detalleDevolucion SET idDevolucion=?, idDetalleIngreso=? WHERE idDetalleDevolucion=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleDevolucion.getIdDevolucion());
            ps.setInt(2, detalleDevolucion.getIdDetalleIngreso());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar DetalleDevolucionDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idDetalleDevolucion) {
        String sql = "DELETE FROM detalleDevolucion WHERE idDetalleDevolucion=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idDetalleDevolucion);
            ps.executeUpdate();
            System.out.println("Detalle de devolución eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar DetalleDevolucionDAO: " + e.getMessage());
        }
    }
}
