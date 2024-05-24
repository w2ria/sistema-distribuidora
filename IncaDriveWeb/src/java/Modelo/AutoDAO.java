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

public class AutoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Autos buscarPorId(int idAutos) {
        Autos a = null;
        String sql = "SELECT * FROM autos WHERE idAutos=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idAutos);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = new Autos();
                a.setIdAutos(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                a.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                a.setMarca(marca);
                a.setNombre(rs.getString(4));
                a.setAño(rs.getString(5));
                a.setPlaca(rs.getString(6));
                a.setColor(rs.getString(7));
                a.setKilometraje(rs.getString(8));
                a.setPrecio_Dia(rs.getDouble(9));
                a.setUbicacion(rs.getString(10));
                a.setStock(rs.getInt(11));
                a.setDescripcion(rs.getString(12));
                a.setImagen(rs.getString(13));
                a.setEstado(rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return a;
    }

    public Autos buscarPorNombre(String nombre) {
        Autos a = new Autos();
        String sql = "SELECT a.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM autos a "
                + "INNER JOIN marca m ON a.idMarca = m.idMarca "
                + "INNER JOIN categoria c ON a.idCategoria = c.idCategoria "
                + "WHERE a.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setIdAutos(rs.getInt("idAutos"));
                a.setNombre(rs.getString("nombre"));
                a.setAño(rs.getString("año"));
                a.setPlaca(rs.getString("placa"));
                a.setColor(rs.getString("color"));
                a.setPrecio_Dia(rs.getDouble("precio_dia"));
                a.setUbicacion(rs.getString("ubicacion"));
                a.setStock(rs.getInt("stock"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setImagen(rs.getString("imagen"));
                a.setEstado(rs.getString("estado"));
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt("idMarca"));
                marca.setNombre(rs.getString("nombre_marca"));
                a.setMarca(marca);
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                a.setCategoria(categoria);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return a;
    }

    public Autos buscarPorMarca(String marca) {
        Autos a = new Autos();
        String sql = "SELECT a.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM autos a "
                + "JOIN marca m ON a.idMarca = m.idMarca "
                + "JOIN categoria c ON a.idCategoria = c.idCategoria "
                + "WHERE m.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + marca + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setIdAutos(rs.getInt("idAutos"));
                a.setNombre(rs.getString("nombre"));
                a.setAño(rs.getString("año"));
                a.setPlaca(rs.getString("placa"));
                a.setColor(rs.getString("color"));
                a.setPrecio_Dia(rs.getDouble("precio_dia"));
                a.setUbicacion(rs.getString("ubicacion"));
                a.setStock(rs.getInt("stock"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setImagen(rs.getString("imagen"));
                a.setEstado(rs.getString("estado"));
                Marca marcaAuto = new Marca();
                marcaAuto.setIdMarca(rs.getInt("idMarca"));
                marcaAuto.setNombre(rs.getString("nombre_marca"));
                a.setMarca(marcaAuto);
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                a.setCategoria(categoria);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorMarca AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return a;
    }

    public Autos buscarPorCategoria(String categoria) {
        Autos a = new Autos();
        String sql = "SELECT a.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM autos a "
                + "JOIN marca m ON a.idMarca = m.idMarca "
                + "JOIN categoria c ON a.idCategoria = c.idCategoria "
                + "WHERE c.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + categoria + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setIdAutos(rs.getInt("idAutos"));
                a.setNombre(rs.getString("nombre"));
                a.setAño(rs.getString("año"));
                a.setPlaca(rs.getString("placa"));
                a.setColor(rs.getString("color"));
                a.setPrecio_Dia(rs.getDouble("precio_dia"));
                a.setUbicacion(rs.getString("ubicacion"));
                a.setStock(rs.getInt("stock"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setImagen(rs.getString("imagen"));
                a.setEstado(rs.getString("estado"));
                Marca marcaAuto = new Marca();
                marcaAuto.setIdMarca(rs.getInt("idMarca"));
                marcaAuto.setNombre(rs.getString("nombre_marca"));
                a.setMarca(marcaAuto);
                Categoria categoriaAuto = new Categoria();
                categoriaAuto.setIdCategoria(rs.getInt("idCategoria"));
                categoriaAuto.setNombre(rs.getString("nombre_categoria"));
                a.setCategoria(categoriaAuto);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorCategoria AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return a;
    }

    public List<Autos> listar() {
        String sql = "SELECT * FROM autos ORDER BY idAutos";
        List<Autos> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Autos a = new Autos();
                a.setIdAutos(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                a.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                a.setMarca(marca);
                a.setNombre(rs.getString(4));
                a.setAño(rs.getString(5));
                a.setPlaca(rs.getString(6));
                a.setColor(rs.getString(7));
                a.setKilometraje(rs.getString(8));
                a.setPrecio_Dia(rs.getDouble(9));
                a.setUbicacion(rs.getString(10));
                a.setStock(rs.getInt(11));
                a.setDescripcion(rs.getString(12));
                a.setImagen(rs.getString(13));
                a.setEstado(rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Listar AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

    public List<Autos> listarConMarcaYCategoria() {
        String sql = "SELECT a.*, m.nombre AS nombre_marca, c.nombre AS nombre_categoria "
                + "FROM autos a "
                + "INNER JOIN marca m ON a.idMarca = m.idMarca "
                + "INNER JOIN categoria c ON a.idCategoria = c.idCategoria ORDER BY idAutos";

        List<Autos> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Autos a = new Autos();
                a.setIdAutos(rs.getInt("idAutos"));
                a.setNombre(rs.getString("nombre"));
                a.setAño(rs.getString("año"));
                a.setPlaca(rs.getString("placa"));
                a.setColor(rs.getString("color"));
                a.setPrecio_Dia(rs.getDouble("precio_dia"));
                a.setUbicacion(rs.getString("ubicacion"));
                a.setStock(rs.getInt("stock"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setImagen(rs.getString("imagen"));
                a.setEstado(rs.getString("estado"));
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt("idMarca"));
                marca.setNombre(rs.getString("nombre_marca"));
                a.setMarca(marca);
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                a.setCategoria(categoria);

                lista.add(a);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar AutoDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(Autos a) {
        String sql = "INSERT INTO autos (idCategoria, idMarca, nombre, año, placa, color, kilometraje, precio_dia, ubicacion, stock, descripcion, imagen, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, a.getCategoria().getIdCategoria());
            ps.setInt(2, a.getMarca().getIdMarca());
            ps.setString(3, a.getNombre());
            ps.setString(4, a.getAño());
            ps.setString(5, a.getPlaca());
            ps.setString(6, a.getColor());
            ps.setString(7, a.getKilometraje());
            ps.setDouble(8, a.getPrecio_Dia());
            ps.setString(9, a.getUbicacion());
            ps.setInt(10, a.getStock());
            ps.setString(11, a.getDescripcion());
            ps.setString(12, a.getImagen());
            ps.setString(13, a.getEstado());
            
            r = ps.executeUpdate();
            System.out.println("Auto agregado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Agregar AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public int actualizar(Autos a) {
        String sql = "UPDATE autos SET idCategoria=?, idMarca=?, nombre=?, año=?, placa=?, color=?, kilometraje=?, precio_dia=?, ubicacion=?, stock=?, descripcion=?, imagen=?, estado=? WHERE idAutos=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, a.getCategoria().getIdCategoria());
            ps.setInt(2, a.getMarca().getIdMarca());
            ps.setString(3, a.getNombre());
            ps.setString(4, a.getAño());
            ps.setString(5, a.getPlaca());
            ps.setString(6, a.getColor());
            ps.setString(7, a.getKilometraje());
            ps.setDouble(8, a.getPrecio_Dia());
            ps.setString(9, a.getUbicacion());
            ps.setInt(10, a.getStock());
            ps.setString(11, a.getDescripcion());
            ps.setString(12, a.getImagen());
            ps.setString(13, a.getEstado());
            r = ps.executeUpdate();
            System.out.println("Auto actualizado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en Actualizar AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public boolean eliminar(int idAutos) {
        String sql = "DELETE FROM autos WHERE idAutos=?";
        boolean eliminado = false;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idAutos);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                eliminado = true;
                System.out.println("Auto eliminado correctamente!");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en Eliminar AutoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return eliminado;
    }

    public int obtenerUltimoNumeroImagen() {
        String sql = "SELECT MAX(CAST(SUBSTRING(imagen, 4, LENGTH(imagen) - 7) AS UNSIGNED)) AS ultimoNumero FROM autos WHERE imagen LIKE 'PRO%'";
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
        return String.format("AUT%04d", nuevoNumero);
    }
    
    public List<Autos> getAutosDisponibles(String ubicacion, String fechaInicio, String fechaFin) {
        List<Autos> autos = new ArrayList<>();
        try {
            String query = "SELECT * FROM autos WHERE ubicacion=? AND estado='activo'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, ubicacion);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Autos auto = new Autos();
                auto.setIdAutos(rs.getInt("idAutos"));
                auto.setNombre(rs.getString("nombre"));
                auto.setPrecio_Dia(rs.getDouble("precio_dia"));
                // Completar el mapeo de los demás campos
                autos.add(auto);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return autos;
    }
}
