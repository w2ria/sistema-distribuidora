package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IngresoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Ingreso buscarPorId(int idIngreso) {
        Ingreso ingreso = null;
        String sql = "SELECT * FROM ingreso WHERE idIngreso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idIngreso);
            rs = ps.executeQuery();
            if (rs.next()) {
                ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                ingreso.setIdProveedor(proveedor);
                ingreso.setTipoComprobante(rs.getString("tipoComprobante"));
                ingreso.setNumComprobante(rs.getString("numComprobante"));
                ingreso.setFecha(rs.getDate("fecha"));
                ingreso.setTotal(rs.getDouble("total"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorId IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return ingreso;
    }

    public List<Ingreso> listar() {
        String sql = "SELECT i.*, p.nombre AS nombreProveedor "
                + "FROM ingreso i "
                + "INNER JOIN proveedor p ON i.idProveedor = p.idProveedor "
                + "ORDER BY i.idIngreso";
        List<Ingreso> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                proveedor.setNombre(rs.getString("nombreProveedor"));
                ingreso.setIdProveedor(proveedor);
                ingreso.setTipoComprobante(rs.getString("tipoComprobante"));
                ingreso.setNumComprobante(rs.getString("numComprobante"));
                ingreso.setFecha(rs.getDate("fecha"));
                ingreso.setTotal(rs.getDouble("total"));
                lista.add(ingreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en listar IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return lista;
    }

    public int agregar(Ingreso ingreso) {
        String sql = "INSERT INTO ingreso (idIngreso, idProveedor, tipoComprobante, numComprobante, fecha, total) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ingreso.getIdIngreso());
            ps.setInt(2, ingreso.getIdProveedor().getIdProveedor());
            ps.setString(3, ingreso.getTipoComprobante());
            ps.setString(4, ingreso.getNumComprobante());
            ps.setDate(5, ingreso.getFecha());
            ps.setDouble(6, ingreso.getTotal());
            r = ps.executeUpdate();
            System.out.println("Ingreso agregado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en agregar IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public int actualizar(Ingreso ingreso) {
        String sql = "UPDATE ingreso SET idProveedor=?, tipoComprobante=?, numComprobante=?, fecha=?, total=? WHERE idIngreso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ingreso.getIdProveedor().getIdProveedor());
            ps.setString(2, ingreso.getTipoComprobante());
            ps.setString(3, ingreso.getNumComprobante());
            ps.setDate(4, ingreso.getFecha());
            ps.setDouble(5, ingreso.getTotal());
            ps.setInt(6, ingreso.getIdIngreso());
            r = ps.executeUpdate();
            System.out.println("Ingreso actualizado correctamente!");
        } catch (SQLException e) {
            System.out.println("ERROR en actualizar IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return r;
    }

    public boolean eliminar(int idIngreso) {
        String sql = "DELETE FROM ingreso WHERE idIngreso=?";
        boolean eliminado = false;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idIngreso);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                eliminado = true;
                System.out.println("Ingreso eliminado correctamente!");
            }
        } catch (SQLException e) {
            System.out.println("ERROR en eliminar IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return eliminado;
    }

    public int obtenerUltimoNumeroComprobante(String tipoComprobante) {
        String sql = "SELECT numComprobante FROM ingreso WHERE tipoComprobante = ? ORDER BY numComprobante DESC LIMIT 1";
        int ultimoNumero = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipoComprobante);
            rs = ps.executeQuery();

            if (rs.next()) {
                String ultimoComprobante = rs.getString("numComprobante");
                String numeroStr = ultimoComprobante.replaceAll("\\D", "");
                ultimoNumero = Integer.parseInt(numeroStr);
            }
        } catch (Exception e) {
            System.out.println("ERROR en obtenerUltimoNumeroComprobante: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return ultimoNumero;
    }

    public List<Ingreso> buscarPorNombreProveedor(String nombreProveedor) {
        List<Ingreso> ingresos = new ArrayList<>();
        String sql = "SELECT i.* FROM ingreso i "
                + "INNER JOIN proveedor p ON i.idProveedor = p.idProveedor "
                + "WHERE p.nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombreProveedor + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                proveedor.setNombre(rs.getString("nombre"));
                ingreso.setIdProveedor(proveedor);
                ingreso.setTipoComprobante(rs.getString("tipoComprobante"));
                ingreso.setNumComprobante(rs.getString("numComprobante"));
                ingreso.setFecha(rs.getDate("fecha"));
                ingreso.setTotal(rs.getDouble("total"));
                ingresos.add(ingreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorNombreProveedor IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return ingresos;
    }

    public List<Ingreso> buscarPorTipoComprobante(String tipoComprobante) {
        List<Ingreso> ingresos = new ArrayList<>();
        String sql = "SELECT * FROM ingreso WHERE tipoComprobante LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + tipoComprobante + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                ingreso.setIdProveedor(proveedor);
                ingreso.setTipoComprobante(rs.getString("tipoComprobante"));
                ingreso.setNumComprobante(rs.getString("numComprobante"));
                ingreso.setFecha(rs.getDate("fecha"));
                ingreso.setTotal(rs.getDouble("total"));
                ingresos.add(ingreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorTipoComprobante IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return ingresos;
    }

    public List<Ingreso> buscarPorNumComprobante(String numComprobante) {
        List<Ingreso> ingresos = new ArrayList<>();
        String sql = "SELECT * FROM ingreso WHERE numComprobante LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + numComprobante + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                ingreso.setIdProveedor(proveedor);
                ingreso.setTipoComprobante(rs.getString("tipoComprobante"));
                ingreso.setNumComprobante(rs.getString("numComprobante"));
                ingreso.setFecha(rs.getDate("fecha"));
                ingreso.setTotal(rs.getDouble("total"));
                ingresos.add(ingreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorNumComprobante IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return ingresos;
    }

    public List<Ingreso> buscarPorFecha(Date fecha) {
        List<Ingreso> ingresos = new ArrayList<>();
        String sql = "SELECT * FROM ingreso WHERE fecha = ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, fecha);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ingreso ingreso = new Ingreso();
                ingreso.setIdIngreso(rs.getInt("idIngreso"));
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                ingreso.setIdProveedor(proveedor);
                ingreso.setTipoComprobante(rs.getString("tipoComprobante"));
                ingreso.setNumComprobante(rs.getString("numComprobante"));
                ingreso.setFecha(rs.getDate("fecha"));
                ingreso.setTotal(rs.getDouble("total"));
                ingresos.add(ingreso);
            }
        } catch (SQLException e) {
            System.out.println("ERROR en buscarPorFecha IngresoDAO: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }
        return ingresos;
    }

}
