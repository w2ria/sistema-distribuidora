package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Usuario validar(String usuario, String contraseña) {
        Usuario us = new Usuario();
        String sql = "select * from usuario where usuario=? and clave=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setIdUsuario(rs.getInt("idUsuario"));
                us.setUsuario(rs.getString("usuario"));
                us.setClave(rs.getString("clave"));
                us.setToken(rs.getString("token"));
                us.setExpiracion(rs.getTimestamp("expiracion"));
            }
        } catch (Exception e) {
        }
        return us;
    }

    //Operaciones CRUD:
    public List<Usuario> listar() {
        String sql = "Select * From usuario";
        List<Usuario> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setIdUsuario(rs.getInt(1));
                us.setUsuario(rs.getString(2));
                us.setClave(rs.getString(3));
                us.setToken(rs.getString(4));
                us.setExpiracion(rs.getTimestamp(5));
                lista.add(us);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar UsuarioDAO: " + e.getMessage());
        }

        return lista;
    }

    public Usuario listarPorId(int id) {
        Usuario us = new Usuario();
        String sql = "Select * From usuario Where idUsuario=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ps.setString(1, us.getUsuario());
                ps.setString(2, us.getClave());
                ps.setString(3, us.getToken());
                ps.setTimestamp(4, us.getExpiracion());
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId UsuarioDAO: " + e.getMessage());
        }

        return us;
    }

    public int agregar(Usuario us) {
        String sql = "Insert Into usuario (usuario, clave, token, expiracion) Values(?,?,?,?)";
        int idUsuario = -1;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getClave());
            ps.setString(3, us.getToken());
            ps.setTimestamp(4, us.getExpiracion());
            ps.executeUpdate();

            // Obtener el ID generado por la base de datos
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                idUsuario = generatedKeys.getInt(1);
            }

            System.out.println("Usuario agregado correctamente con ID: " + idUsuario);
        } catch (Exception e) {
            System.out.println("ERROR en Agregar UsuarioDAO: " + e.getMessage());
        }

        return idUsuario;
    }

    public int actualizar(Usuario us) {
        String sql = "Update usuario Set usuario=?, clave=?, token=?, expiracion=? Where idUsuario=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getClave());
            ps.setString(3, us.getToken());
            ps.setTimestamp(4, us.getExpiracion());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Editar UsuarioDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int id) {
        String sql = "Delete from usuario Where idUsuario=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar UsuarioDAO: " + e.getMessage());
        }
    }
}
