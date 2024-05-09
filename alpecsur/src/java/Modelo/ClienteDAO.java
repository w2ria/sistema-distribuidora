package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Cliente buscarPorNumDocumento(String numDocumento) {
        Cliente cli = new Cliente();
        String sql = "SELECT * FROM cliente WHERE numDocumento=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, numDocumento);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setIdCliente(rs.getInt(1));
                cli.setIdUsuario(rs.getInt(2));
                cli.setNombre(rs.getString(3));
                cli.setTipoDocumento(rs.getString(4));
                cli.setNumDocumento(rs.getString(5));
                cli.setDireccion(rs.getString(6));
                cli.setTelefono(rs.getString(7));
                cli.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en BuscarPorNumDocumento ClienteDAO: " + e.getMessage());
        }
        return cli;
    }

    public Cliente buscarPorNombre(String nombre) {
        Cliente cli = new Cliente();
        String sql = "SELECT * FROM cliente WHERE nombre LIKE ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                cli.setIdCliente(rs.getInt(1));
                cli.setIdUsuario(rs.getInt(2));
                cli.setNombre(rs.getString(3));
                cli.setTipoDocumento(rs.getString(4));
                cli.setNumDocumento(rs.getString(5));
                cli.setDireccion(rs.getString(6));
                cli.setTelefono(rs.getString(7));
                cli.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorNombre ClienteDAO: " + e.getMessage());
        }
        return cli;
    }

    //Operaciones CRUD:
    public List<Cliente> listar() {
        String sql = "SELECT * FROM cliente";
        List<Cliente> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setIdCliente(rs.getInt(1));
                cli.setIdUsuario(rs.getInt(2));
                cli.setNombre(rs.getString(3));
                cli.setTipoDocumento(rs.getString(4));
                cli.setNumDocumento(rs.getString(5));
                cli.setDireccion(rs.getString(6));
                cli.setTelefono(rs.getString(7));
                cli.setEmail(rs.getString(8));
                lista.add(cli);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar ClienteDAO: " + e.getMessage());
        }

        return lista;
    }

    public Cliente listarPorId(int id) {
        Cliente cli = new Cliente();
        String sql = "SELECT * FROM cliente WHERE idCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setIdCliente(rs.getInt(1));
                cli.setIdUsuario(rs.getInt(2));
                cli.setNombre(rs.getString(3));
                cli.setTipoDocumento(rs.getString(4));
                cli.setNumDocumento(rs.getString(5));
                cli.setDireccion(rs.getString(6));
                cli.setTelefono(rs.getString(7));
                cli.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId ClienteDAO: " + e.getMessage());
        }

        return cli;
    }

    public int agregar(Cliente cli) {
        String sql = "INSERT INTO cliente (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email) VALUES(?,?,?,?,?,?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cli.getIdUsuario());
            ps.setString(2, cli.getNombre());
            ps.setString(3, cli.getTipoDocumento());
            ps.setString(4, cli.getNumDocumento());
            ps.setString(5, cli.getDireccion());
            ps.setString(6, cli.getTelefono());
            ps.setString(7, cli.getEmail());
            ps.executeUpdate();
            System.out.println("Agregado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar ClienteDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Cliente cli) {
        String sql = "UPDATE cliente SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=? WHERE idCliente=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cli.getIdUsuario());
            ps.setString(2, cli.getNombre());
            ps.setString(3, cli.getTipoDocumento());
            ps.setString(4, cli.getNumDocumento());
            ps.setString(5, cli.getDireccion());
            ps.setString(6, cli.getTelefono());
            ps.setString(7, cli.getEmail());
            ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar ClienteDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM cliente WHERE idCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("Cliente eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar ClienteDAO: " + e.getMessage());
        }
    }
}
