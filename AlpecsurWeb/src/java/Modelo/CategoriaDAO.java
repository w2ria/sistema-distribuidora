package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Categoria buscarPorId(int idCategoria) {
        Categoria categoria = new Categoria();
        String sql = "SELECT * FROM categoria WHERE idCategoria=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCategoria);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoria.setIdCategoria(rs.getInt(1));
                categoria.setNombre(rs.getString(2));
                categoria.setDescripcion(rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId CategoriaDAO: " + e.getMessage());
        }
        return categoria;
    }

    public List<Categoria> listar() {
        String sql = "SELECT * FROM categoria";
        List<Categoria> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(1));
                categoria.setNombre(rs.getString(2));
                categoria.setDescripcion(rs.getString(3));
                lista.add(categoria);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar CategoriaDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(Categoria categoria) {
        String sql = "INSERT INTO categoria (nombre, descripcion) VALUES (?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, categoria.getNombre());
            ps.setString(2, categoria.getDescripcion());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar CategoriaDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Categoria categoria) {
        String sql = "UPDATE categoria SET nombre=?, descripcion=? WHERE idCategoria=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, categoria.getNombre());
            ps.setString(2, categoria.getDescripcion());
            ps.setInt(3, categoria.getIdCategoria());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar CategoriaDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idCategoria) {
        String sql = "DELETE FROM categoria WHERE idCategoria=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCategoria);
            ps.executeUpdate();
            System.out.println("Categoria eliminada correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar CategoriaDAO: " + e.getMessage());
        }
    }

    public List<Categoria> buscarPorNombre(String nombre) {
        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM categoria WHERE nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre"));
                categoria.setDescripcion(rs.getString("descripcion"));
                lista.add(categoria);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre CategoriaDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return lista;
    }
    
}
