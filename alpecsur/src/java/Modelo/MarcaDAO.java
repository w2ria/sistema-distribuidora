package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MarcaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Marca buscarPorId(int idMarca) {
        Marca marca = new Marca();
        String sql = "SELECT * FROM marca WHERE idMarca=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idMarca);
            rs = ps.executeQuery();
            while (rs.next()) {
                marca.setIdMarca(rs.getInt(1));
                marca.setNombre(rs.getString(2));
                marca.setDescripcion(rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId MarcaDAO: " + e.getMessage());
        }
        return marca;
    }

    public List<Marca> listar() {
        String sql = "SELECT * FROM marca";
        List<Marca> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(1));
                marca.setNombre(rs.getString(2));
                marca.setDescripcion(rs.getString(3));
                lista.add(marca);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar MarcaDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(Marca marca) {
        String sql = "INSERT INTO marca (nombre, descripcion) VALUES (?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, marca.getNombre());
            ps.setString(2, marca.getDescripcion());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar MarcaDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Marca marca) {
        String sql = "UPDATE marca SET nombre=?, descripcion=? WHERE idMarca=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, marca.getNombre());
            ps.setString(2, marca.getDescripcion());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar MarcaDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idMarca) {
        String sql = "DELETE FROM marca WHERE idMarca=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idMarca);
            ps.executeUpdate();
            System.out.println("Marca eliminada correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar MarcaDAO: " + e.getMessage());
        }
    }
}
