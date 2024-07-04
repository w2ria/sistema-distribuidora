package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoCarritoDAO {

    Connection con;
    conexion cn = new conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Producto listarId(int idProducto) {
        String sql = "SELECT * FROM producto WHERE idProducto=" + idProducto;
        Producto p = new Producto();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdProducto(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                p.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                p.setMarca(marca);
                p.setNombre(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setDescripcion(rs.getString(7));
                p.setImagen(rs.getString(8));
                p.setEstado(rs.getString(9));
            }
        } catch (SQLException e) {
        }
        return p;
    }

    public List<Producto> listar() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM producto";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                p.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                p.setMarca(marca);
                p.setNombre(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setDescripcion(rs.getString(7));
                p.setImagen(rs.getString(8));
                p.setEstado(rs.getString(9));
                productos.add(p);
            }
        } catch (SQLException e) {
        }
        return productos;
    }

    public List<Producto> listarPorCategoria(String categoria) {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT p.* FROM producto p INNER JOIN categoria c ON p.idCategoria = c.idCategoria WHERE c.nombre = ? AND p.stock > 0 ORDER BY p.idProducto";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, categoria);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                Categoria cat = new Categoria();
                cat.setIdCategoria(rs.getInt("idCategoria"));
                cat.setNombre(categoria);
                producto.setCategoria(cat);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt("idMarca"));
                producto.setMarca(marca);
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setImagen(rs.getString("imagen"));
                producto.setEstado(rs.getString("estado"));
                lista.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listarPorCategoria ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

// Método para listar productos por marca
    public List<Producto> listarPorMarca(String marca) {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT p.* FROM producto p INNER JOIN marca m ON p.idMarca = m.idMarca WHERE m.nombre = ? AND p.stock > 0 ORDER BY p.idProducto";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, marca);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                producto.setCategoria(categoria);
                Marca mar = new Marca();
                mar.setIdMarca(rs.getInt("idMarca"));
                mar.setNombre(marca);
                producto.setMarca(mar);
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setImagen(rs.getString("imagen"));
                producto.setEstado(rs.getString("estado"));
                lista.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listarPorMarca ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

}
