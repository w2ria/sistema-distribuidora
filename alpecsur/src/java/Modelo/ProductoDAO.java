package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Producto buscarPorId(int idProducto) {
        Producto producto = new Producto();
        String sql = "SELECT * FROM producto WHERE idProducto=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto.setIdProducto(rs.getInt(1));
                producto.setIdCategoria(rs.getInt(2));
                producto.setIdMarca(rs.getInt(3));
                producto.setNombre(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId ProductoDAO: " + e.getMessage());
        }
        return producto;
    }

    public Producto buscarPorNombre(String nombre) {
        Producto producto = new Producto();
        String sql = "SELECT * FROM producto WHERE nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt(1));
                producto.setIdCategoria(rs.getInt(2));
                producto.setIdMarca(rs.getInt(3));
                producto.setNombre(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre ProductoDAO: " + e.getMessage());
        }
        return producto;
    }

    public Producto buscarPorMarca(String marca) {
        Producto producto = new Producto();
        String sql = "SELECT p.* FROM producto p JOIN marca m ON p.idMarca = m.idMarca WHERE m.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + marca + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt(1));
                producto.setIdCategoria(rs.getInt(2));
                producto.setIdMarca(rs.getInt(3));
                producto.setNombre(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorMarca ProductoDAO: " + e.getMessage());
        }
        return producto;
    }

    public Producto buscarPorCategoria(String categoria) {
        Producto producto = new Producto();
        String sql = "SELECT p.* FROM producto p JOIN categoria c ON p.idCategoria = c.idCategoria WHERE c.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + categoria + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt(1));
                producto.setIdCategoria(rs.getInt(2));
                producto.setIdMarca(rs.getInt(3));
                producto.setNombre(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorCategoria ProductoDAO: " + e.getMessage());
        }
        return producto;
    }

    public List<Producto> listar() {
        String sql = "SELECT * FROM producto";
        List<Producto> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt(1));
                producto.setIdCategoria(rs.getInt(2));
                producto.setIdMarca(rs.getInt(3));
                producto.setNombre(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
                lista.add(producto);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar ProductoDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(Producto producto) {
        String sql = "INSERT INTO producto (idCategoria, idMarca, nombre, precio, stock, descripcion, imagen, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getIdCategoria());
            ps.setInt(2, producto.getIdMarca());
            ps.setString(3, producto.getNombre());
            ps.setDouble(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getDescripcion());
            ps.setString(7, producto.getImagen());
            ps.setString(8, producto.getEstado());
            ps.executeUpdate();
            System.out.println("Producto agregado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar ProductoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Producto producto) {
        String sql = "UPDATE producto SET idCategoria=?, idMarca=?, nombre=?, precio=?, stock=?, descripcion=?, imagen=?, estado=? WHERE idProducto=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getIdCategoria());
            ps.setInt(2, producto.getIdMarca());
            ps.setString(3, producto.getNombre());
            ps.setDouble(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getDescripcion());
            ps.setString(7, producto.getImagen());
            ps.setString(8, producto.getEstado());
            ps.executeUpdate();
            System.out.println("Producto actualizado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar ProductoDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idProducto) {
        String sql = "DELETE FROM producto WHERE idProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            ps.executeUpdate();
            System.out.println("Producto eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar ProductoDAO: " + e.getMessage());
        }
    }
}
