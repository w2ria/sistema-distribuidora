package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Proveedor buscarPorNumDocumento(String numDocumento) {
        Proveedor prov = new Proveedor();
        String sql = "SELECT * FROM proveedor WHERE numDocumento=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, numDocumento);
            rs = ps.executeQuery();
            while (rs.next()) {
                prov.setIdProveedor(rs.getInt(1));
                prov.setIdUsuario(rs.getInt(2));
                prov.setNombre(rs.getString(3));
                prov.setTipoDocumento(rs.getString(4));
                prov.setNumDocumento(rs.getString(5));
                prov.setDireccion(rs.getString(6));
                prov.setTelefono(rs.getString(7));
                prov.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNumDocumento ProveedorDAO: " + e.getMessage());
        }
        return prov;
    }

    public Proveedor buscarPorNombre(String nombre) {
        Proveedor prov = new Proveedor();
        String sql = "SELECT * FROM proveedor WHERE nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                prov.setIdProveedor(rs.getInt(1));
                prov.setIdUsuario(rs.getInt(2));
                prov.setNombre(rs.getString(3));
                prov.setTipoDocumento(rs.getString(4));
                prov.setNumDocumento(rs.getString(5));
                prov.setDireccion(rs.getString(6));
                prov.setTelefono(rs.getString(7));
                prov.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre ProveedorDAO: " + e.getMessage());
        }
        return prov;
    }

    //Operaciones CRUD:
    public List<Proveedor> listar() {
        String sql = "SELECT * FROM proveedor";
        List<Proveedor> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor prov = new Proveedor();
                prov.setIdProveedor(rs.getInt(1));
                prov.setIdUsuario(rs.getInt(2));
                prov.setNombre(rs.getString(3));
                prov.setTipoDocumento(rs.getString(4));
                prov.setNumDocumento(rs.getString(5));
                prov.setDireccion(rs.getString(6));
                prov.setTelefono(rs.getString(7));
                prov.setEmail(rs.getString(8));
                lista.add(prov);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar ProveedorDAO: " + e.getMessage());
        }

        return lista;
    }

    public Proveedor listarPorId(int id) {
        Proveedor prov = new Proveedor();
        String sql = "SELECT * FROM proveedor WHERE idProveedor=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prov.setIdProveedor(rs.getInt(1));
                prov.setIdUsuario(rs.getInt(2));
                prov.setNombre(rs.getString(3));
                prov.setTipoDocumento(rs.getString(4));
                prov.setNumDocumento(rs.getString(5));
                prov.setDireccion(rs.getString(6));
                prov.setTelefono(rs.getString(7));
                prov.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId ProveedorDAO: " + e.getMessage());
        }

        return prov;
    }

    public int agregar(Proveedor prov) {
        String sql = "INSERT INTO proveedor (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email) VALUES(?,?,?,?,?,?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prov.getIdProveedor());
            ps.setString(2, prov.getNombre());
            ps.setString(3, prov.getTipoDocumento());
            ps.setString(4, prov.getNumDocumento());
            ps.setString(5, prov.getDireccion());
            ps.setString(6, prov.getTelefono());
            ps.setString(7, prov.getEmail());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar ProveedorDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Proveedor prov) {
        String sql = "UPDATE proveedor SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=? WHERE idProveedor=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prov.getIdUsuario());
            ps.setString(2, prov.getNombre());
            ps.setString(3, prov.getTipoDocumento());
            ps.setString(4, prov.getNumDocumento());
            ps.setString(5, prov.getDireccion());
            ps.setString(6, prov.getTelefono());
            ps.setString(7, prov.getEmail());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar ProveedorDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM proveedor WHERE idProveedor=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("Proveedor eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar ProveedorDAO: " + e.getMessage());
        }
    }
}
