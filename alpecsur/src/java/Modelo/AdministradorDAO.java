package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdministradorDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Administrador buscarPorNumDocumento(String numDocumento) {
        Administrador adm = new Administrador();
        String sql = "SELECT * FROM administrador WHERE numDocumento=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, numDocumento);
            rs = ps.executeQuery();
            while (rs.next()) {
                adm.setIdAdministrador(rs.getInt(1));
                adm.setIdUsuario(rs.getInt(2));
                adm.setNombre(rs.getString(3));
                adm.setTipoDocumento(rs.getString(4));
                adm.setNumDocumento(rs.getString(5));
                adm.setDireccion(rs.getString(6));
                adm.setTelefono(rs.getString(7));
                adm.setEmail(rs.getString(8));
                adm.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNumDocumento AdministradorDAO: " + e.getMessage());
        }
        return adm;
    }

    public Administrador buscarPorNombre(String nombre) {
        Administrador adm = new Administrador();
        String sql = "SELECT * FROM administrador WHERE nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                adm.setIdAdministrador(rs.getInt(1));
                adm.setIdUsuario(rs.getInt(2));
                adm.setNombre(rs.getString(3));
                adm.setTipoDocumento(rs.getString(4));
                adm.setNumDocumento(rs.getString(5));
                adm.setDireccion(rs.getString(6));
                adm.setTelefono(rs.getString(7));
                adm.setEmail(rs.getString(8));
                adm.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre AdministradorDAO: " + e.getMessage());
        }
        return adm;
    }

    //Operaciones CRUD:
    public List<Administrador> listar() {
        String sql = "SELECT * FROM administrador";
        List<Administrador> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Administrador adm = new Administrador();
                adm.setIdAdministrador(rs.getInt(1));
                adm.setIdUsuario(rs.getInt(2));
                adm.setNombre(rs.getString(3));
                adm.setTipoDocumento(rs.getString(4));
                adm.setNumDocumento(rs.getString(5));
                adm.setDireccion(rs.getString(6));
                adm.setTelefono(rs.getString(7));
                adm.setEmail(rs.getString(8));
                adm.setEstado(rs.getString(9));
                lista.add(adm);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar AdministradorDAO: " + e.getMessage());
        }

        return lista;
    }

    public Administrador listarPorId(int id) {
        Administrador adm = new Administrador();
        String sql = "SELECT * FROM administrador WHERE idAdministrador=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                adm.setIdAdministrador(rs.getInt(1));
                adm.setIdUsuario(rs.getInt(2));
                adm.setNombre(rs.getString(3));
                adm.setTipoDocumento(rs.getString(4));
                adm.setNumDocumento(rs.getString(5));
                adm.setDireccion(rs.getString(6));
                adm.setTelefono(rs.getString(7));
                adm.setEmail(rs.getString(8));
                adm.setEstado(rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId AdministradorDAO: " + e.getMessage());
        }

        return adm;
    }

    public int agregar(Administrador adm) {
        String sql = "INSERT INTO administrador (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email, estado) VALUES(?,?,?,?,?,?,?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, adm.getIdAdministrador());
            ps.setString(2, adm.getNombre());
            ps.setString(3, adm.getTipoDocumento());
            ps.setString(4, adm.getNumDocumento());
            ps.setString(5, adm.getDireccion());
            ps.setString(6, adm.getTelefono());
            ps.setString(7, adm.getEmail());
            ps.setString(8, adm.getEstado());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar AdministradorDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Administrador adm) {
        String sql = "UPDATE administrador SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=?, estado=? WHERE idAdministrador=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, adm.getIdUsuario());
            ps.setString(2, adm.getNombre());
            ps.setString(3, adm.getTipoDocumento());
            ps.setString(4, adm.getNumDocumento());
            ps.setString(5, adm.getDireccion());
            ps.setString(6, adm.getTelefono());
            ps.setString(7, adm.getEmail());
            ps.setString(8, adm.getEstado());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar AdministradorDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM administrador WHERE idAdministrador=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("Administrador eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar AdministradorDAO: " + e.getMessage());
        }
    }
}
