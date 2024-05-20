package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Empleado> listar() {
        String sql = "SELECT * FROM empleado";
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setIdEmpleado(rs.getInt("idEmpleado"));
                emp.setIdUsuario(rs.getInt("idUsuario"));
                emp.setNombre(rs.getString("nombre"));
                emp.setTipoDocumento(rs.getString("tipoDocumento"));
                emp.setNumDocumento(rs.getString("numDocumento"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setEmail(rs.getString("email"));
                lista.add(emp);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar EmpleadoDAO: " + e.getMessage());
        }
        return lista;
    }

    public List<Empleado> buscarPorNombre(String nombre) {
        List<Empleado> lista = new ArrayList<>();
        String sql = "SELECT * FROM empleado WHERE nombre LIKE ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setIdEmpleado(rs.getInt("idEmpleado"));
                emp.setIdUsuario(rs.getInt("idUsuario"));
                emp.setNombre(rs.getString("nombre"));
                emp.setTipoDocumento(rs.getString("tipoDocumento"));
                emp.setNumDocumento(rs.getString("numDocumento"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setEmail(rs.getString("email"));
                lista.add(emp);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre EmpleadoDAO: " + e.getMessage());
        }
        return lista;
    }

    public Empleado listarPorId(int idUsuario) { // Corregido a idUsuario
        Empleado emp = new Empleado();
        String sql = "SELECT * FROM empleado WHERE idUsuario=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next()) { // Cambiado a if
                emp.setIdEmpleado(rs.getInt("idEmpleado"));
                emp.setIdUsuario(rs.getInt("idUsuario"));
                emp.setNombre(rs.getString("nombre"));
                emp.setTipoDocumento(rs.getString("tipoDocumento"));
                emp.setNumDocumento(rs.getString("numDocumento"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId EmpleadoDAO: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.out.println("ERROR cerrando conexiones: " + e.getMessage());
            }
        }
        return emp;
    }

    public int agregar(Empleado emp) {
        String sql = "INSERT INTO empleado (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, emp.getIdUsuario());
            ps.setString(2, emp.getNombre());
            ps.setString(3, emp.getTipoDocumento());
            ps.setString(4, emp.getNumDocumento());
            ps.setString(5, emp.getDireccion());
            ps.setString(6, emp.getTelefono());
            ps.setString(7, emp.getEmail());
            r = ps.executeUpdate();
            System.out.println("Empleado agregado correctamente.");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar EmpleadoDAO: " + e.getMessage());
        }
        return r;
    }

    public int actualizar(Empleado emp) {
        String sql = "UPDATE empleado SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=? WHERE idEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, emp.getIdUsuario());
            ps.setString(2, emp.getNombre());
            ps.setString(3, emp.getTipoDocumento());
            ps.setString(4, emp.getNumDocumento());
            ps.setString(5, emp.getDireccion());
            ps.setString(6, emp.getTelefono());
            ps.setString(7, emp.getEmail());
            ps.setInt(8, emp.getIdEmpleado());
            r = ps.executeUpdate();
            System.out.println("Empleado actualizado correctamente.");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar EmpleadoDAO: " + e.getMessage());
        }
        return r;
    }

    public boolean eliminar(int idEmpleado) {
        boolean eliminacionExitosa = false;
        String sql = "DELETE FROM empleado WHERE idEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                eliminacionExitosa = true;
                System.out.println("Empleado eliminado correctamente");
            } else {
                System.out.println("No se encontró ningún empleado con el ID especificado");
            }
        } catch (Exception e) {
            System.out.println("ERROR al eliminar empleado: " + e.getMessage());
        } finally {
            // Cerrar recursos (PreparedStatement, Connection, etc.) si es necesario
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.out.println("ERROR cerrando conexiones: " + e.getMessage());
            }
        }
        return eliminacionExitosa;
    }

}
