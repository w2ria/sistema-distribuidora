package Modelo;

import Configuraciones.conexion;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Producto buscarPorId(int idProducto) {
        Producto producto = null;
        String sql = "SELECT * FROM producto WHERE idProducto=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();
            if (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                producto.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                producto.setMarca(marca);
                producto.setNombre(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return producto;
    }

    public Producto buscarPorNombre(String nombre) {
        Producto producto = new Producto();
        String sql = "SELECT p.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM producto p "
                + "INNER JOIN marca m ON p.idMarca = m.idMarca "
                + "INNER JOIN categoria c ON p.idCategoria = c.idCategoria "
                + "WHERE p.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setImagen(rs.getString("imagen"));
                producto.setEstado(rs.getString("estado"));
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt("idMarca"));
                marca.setNombre(rs.getString("nombre_marca"));
                producto.setMarca(marca);
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                producto.setCategoria(categoria);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return producto;
    }

    public Producto buscarPorMarca(String marca) {
        Producto producto = new Producto();
        String sql = "SELECT p.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM producto p "
                + "JOIN marca m ON p.idMarca = m.idMarca "
                + "JOIN categoria c ON p.idCategoria = c.idCategoria "
                + "WHERE m.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + marca + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setImagen(rs.getString("imagen"));
                producto.setEstado(rs.getString("estado"));
                Marca marcaProducto = new Marca();
                marcaProducto.setIdMarca(rs.getInt("idMarca"));
                marcaProducto.setNombre(rs.getString("nombre_marca"));
                producto.setMarca(marcaProducto);
                Categoria categoriaProducto = new Categoria();
                categoriaProducto.setIdCategoria(rs.getInt("idCategoria"));
                categoriaProducto.setNombre(rs.getString("nombre_categoria"));
                producto.setCategoria(categoriaProducto);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorMarca ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return producto;
    }

    public Producto buscarPorCategoria(String categoria) {
        Producto producto = new Producto();
        String sql = "SELECT p.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM producto p "
                + "JOIN marca m ON p.idMarca = m.idMarca "
                + "JOIN categoria c ON p.idCategoria = c.idCategoria "
                + "WHERE c.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + categoria + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setImagen(rs.getString("imagen"));
                producto.setEstado(rs.getString("estado"));
                Marca marcaProducto = new Marca();
                marcaProducto.setIdMarca(rs.getInt("idMarca"));
                marcaProducto.setNombre(rs.getString("nombre_marca"));
                producto.setMarca(marcaProducto);
                Categoria categoriaProducto = new Categoria();
                categoriaProducto.setIdCategoria(rs.getInt("idCategoria"));
                categoriaProducto.setNombre(rs.getString("nombre_categoria"));
                producto.setCategoria(categoriaProducto);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorCategoria ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return producto;
    }

    public List<Producto> listar() {
        String sql = "SELECT * FROM producto ORDER BY idProducto";
        List<Producto> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                producto.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                producto.setMarca(marca);
                producto.setNombre(rs.getString(4));
                BigDecimal precio = rs.getBigDecimal(5);
                precio = precio.setScale(4, RoundingMode.HALF_UP);
                producto.setPrecio(precio.doubleValue());
                producto.setStock(rs.getInt(6));
                producto.setDescripcion(rs.getString(7));
                producto.setImagen(rs.getString(8));
                producto.setEstado(rs.getString(9));
                lista.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Listar ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

    public List<Producto> listarConMarcaYCategoria() {
        String sql = "SELECT p.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM producto p "
                + "INNER JOIN marca m ON p.idMarca = m.idMarca "
                + "INNER JOIN categoria c ON p.idCategoria = c.idCategoria ORDER BY idProducto";

        List<Producto> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setImagen(rs.getString("imagen"));
                producto.setEstado(rs.getString("estado"));
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt("idMarca"));
                marca.setNombre(rs.getString("nombre_marca"));
                producto.setMarca(marca);
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                producto.setCategoria(categoria);

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
            ps.setInt(1, producto.getCategoria().getIdCategoria());
            ps.setInt(2, producto.getMarca().getIdMarca());
            ps.setString(3, producto.getNombre());
            ps.setDouble(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getDescripcion());
            ps.setString(7, producto.getImagen());
            ps.setString(8, producto.getEstado());
            r = ps.executeUpdate();
            System.out.println("Producto agregado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Agregar ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public int actualizar(Producto producto) {
        String sql = "UPDATE producto SET idCategoria=?, idMarca=?, nombre=?, precio=?, stock=?, descripcion=?, imagen=?, estado=? WHERE idProducto=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getCategoria().getIdCategoria());
            ps.setInt(2, producto.getMarca().getIdMarca());
            ps.setString(3, producto.getNombre());
            ps.setDouble(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getDescripcion());
            ps.setString(7, producto.getImagen());
            ps.setString(8, producto.getEstado());
            ps.setInt(9, producto.getIdProducto());
            r = ps.executeUpdate();
            System.out.println("Producto actualizado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Actualizar ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public boolean eliminar(int idProducto) {
        String sql = "DELETE FROM producto WHERE idProducto=?";
        boolean eliminado = false;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                eliminado = true;
                System.out.println("Producto eliminado correctamente!");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Eliminar ProductoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return eliminado;
    }

    public int obtenerUltimoNumeroImagen() {
        String sql = "SELECT MAX(CAST(SUBSTRING(imagen, 4, LENGTH(imagen) - 7) AS UNSIGNED)) AS ultimoNumero FROM producto WHERE imagen LIKE 'PRO%'";
        int ultimoNumero = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ultimoNumero = rs.getInt("ultimoNumero");
            }
        } catch (Exception e) {
            System.out.println("ERROR en obtenerUltimoNumeroImagen: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return ultimoNumero;
    }

    public String generarNuevoNombreImagen(int ultimoNumero) {
        int nuevoNumero = ultimoNumero + 1;
        return String.format("PRO%04d", nuevoNumero);
    }
}
