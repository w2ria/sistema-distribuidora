package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado buscarPorNumDocumento(String numDocumento) {
        Empleado emp = new Empleado();
        String sql = "SELECT * FROM empleado WHERE numDocumento=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, numDocumento);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdEmpleado(rs.getInt(1));
                emp.setIdUsuario(rs.getInt(2));
                emp.setNombre(rs.getString(3));
                emp.setTipoDocumento(rs.getString(4));
                emp.setNumDocumento(rs.getString(5));
                emp.setDireccion(rs.getString(6));
                emp.setTelefono(rs.getString(7));
                emp.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNumDocumento EmpleadoDAO: " + e.getMessage());
        }
        return emp;
    }

    public Empleado buscarPorNombre(String nombre) {
        Empleado emp = new Empleado();
        String sql = "SELECT * FROM empleado WHERE nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                emp.setIdEmpleado(rs.getInt(1));
                emp.setIdUsuario(rs.getInt(2));
                emp.setNombre(rs.getString(3));
                emp.setTipoDocumento(rs.getString(4));
                emp.setNumDocumento(rs.getString(5));
                emp.setDireccion(rs.getString(6));
                emp.setTelefono(rs.getString(7));
                emp.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre EmpleadoDAO: " + e.getMessage());
        }
        return emp;
    }

    //Operaciones CRUD:
    public List<Empleado> listar() {
        String sql = "SELECT * FROM empleado";
        List<Empleado> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setIdEmpleado(rs.getInt(1));
                emp.setIdUsuario(rs.getInt(2));
                emp.setNombre(rs.getString(3));
                emp.setTipoDocumento(rs.getString(4));
                emp.setNumDocumento(rs.getString(5));
                emp.setDireccion(rs.getString(6));
                emp.setTelefono(rs.getString(7));
                emp.setEmail(rs.getString(8));
                emp.setEstado(rs.getString(9));
                lista.add(emp);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar EmpleadoDAO: " + e.getMessage());
        }

        return lista;
    }

    public Empleado listarPorId(int id) {
        Empleado emp = new Empleado();
        String sql = "SELECT * FROM empleado WHERE idEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdEmpleado(rs.getInt(1));
                emp.setIdUsuario(rs.getInt(2));
                emp.setNombre(rs.getString(3));
                emp.setTipoDocumento(rs.getString(4));
                emp.setNumDocumento(rs.getString(5));
                emp.setDireccion(rs.getString(6));
                emp.setTelefono(rs.getString(7));
                emp.setEmail(rs.getString(8));
                emp.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId EmpleadoDAO: " + e.getMessage());
        }

        return emp;
    }

    public int agregar(Empleado emp) {
        String sql = "INSERT INTO empleado (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email, estado) VALUES(?,?,?,?,?,?,?,?)";

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
            ps.setString(8, emp.getEstado());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar EmpleadoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Empleado emp) {
        String sql = "UPDATE empleado SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=?, estado=? WHERE idEmpleado=?";

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
            ps.setString(8, emp.getEstado());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar EmpleadoDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM empleado WHERE idEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("Empleado eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar EmpleadoDAO: " + e.getMessage());
        }
    }
}
