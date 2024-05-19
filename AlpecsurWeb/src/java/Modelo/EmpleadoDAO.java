/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
                emp.setIdProveedor(rs.getInt("idProveedor"));
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

    public Empleado listarPorId(int id) {
        Empleado emp = new Empleado();
        String sql = "SELECT * FROM empleado WHERE idProveedor=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdProveedor(rs.getInt("idProveedor"));
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
        String sql = "UPDATE empleado SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=? WHERE idProveedor=?";
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
            ps.setInt(8, emp.getIdProveedor());
            r = ps.executeUpdate();
            System.out.println("Empleado actualizado correctamente.");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar EmpleadoDAO: " + e.getMessage());
        }
        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM empleado WHERE idProveedor=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("Empleado eliminado correctamente.");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar EmpleadoDAO: " + e.getMessage());
        }
    }
}
