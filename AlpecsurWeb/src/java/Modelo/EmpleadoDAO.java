/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author user
 */
import Configuraciones.conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Connection con;

    public EmpleadoDAO() {
        conexion conn = new conexion();
        con = conn.Conexion();
    }

    // Crear un nuevo empleado
    public boolean addEmpleado(Empleado empleado) {
        String sql = "INSERT INTO empleado (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, empleado.getIdUsuario());
            ps.setString(2, empleado.getNombre());
            ps.setString(3, empleado.getTipoDocumento());
            ps.setString(4, empleado.getNumDocumento());
            ps.setString(5, empleado.getDireccion());
            ps.setString(6, empleado.getTelefono());
            ps.setString(7, empleado.getEmail());
            ps.setString(8, empleado.getEstado());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Obtener un empleado por su ID
    public Empleado getEmpleadoById(int idEmpleado) {
        String sql = "SELECT * FROM empleado WHERE idEmpleado = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Empleado empleado = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getInt("idUsuario"),
                        rs.getString("nombre"),
                        rs.getString("tipoDocumento"),
                        rs.getString("numDocumento"),
                        rs.getString("direccion"),
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("estado")
                );
                return empleado;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Obtener todos los empleados
    public List<Empleado> getAllEmpleados() {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM empleado";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado empleado = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getInt("idUsuario"),
                        rs.getString("nombre"),
                        rs.getString("tipoDocumento"),
                        rs.getString("numDocumento"),
                        rs.getString("direccion"),
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("estado")
                );
                empleados.add(empleado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empleados;
    }

    // Actualizar un empleado
    public boolean updateEmpleado(Empleado empleado) {
        String sql = "UPDATE empleado SET idUsuario = ?, nombre = ?, tipoDocumento = ?, numDocumento = ?, direccion = ?, telefono = ?, email = ?, estado = ? WHERE idEmpleado = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, empleado.getIdUsuario());
            ps.setString(2, empleado.getNombre());
            ps.setString(3, empleado.getTipoDocumento());
            ps.setString(4, empleado.getNumDocumento());
            ps.setString(5, empleado.getDireccion());
            ps.setString(6, empleado.getTelefono());
            ps.setString(7, empleado.getEmail());
            ps.setString(8, empleado.getEstado());
            ps.setInt(9, empleado.getIdEmpleado());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Eliminar un empleado
    public boolean deleteEmpleado(int idEmpleado) {
        String sql = "DELETE FROM empleado WHERE idEmpleado = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Consultas adicionales
    // Obtener empleados por estado
    public List<Empleado> getEmpleadosByEstado(String estado) {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM empleado WHERE estado = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado empleado = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getInt("idUsuario"),
                        rs.getString("nombre"),
                        rs.getString("tipoDocumento"),
                        rs.getString("numDocumento"),
                        rs.getString("direccion"),
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("estado")
                );
                empleados.add(empleado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empleados;
    }

    // Obtener empleados por tipo de documento
    public List<Empleado> getEmpleadosByTipoDocumento(String tipoDocumento) {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM empleado WHERE tipoDocumento = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tipoDocumento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado empleado = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getInt("idUsuario"),
                        rs.getString("nombre"),
                        rs.getString("tipoDocumento"),
                        rs.getString("numDocumento"),
                        rs.getString("direccion"),
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("estado")
                );
                empleados.add(empleado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empleados;
    }
}
