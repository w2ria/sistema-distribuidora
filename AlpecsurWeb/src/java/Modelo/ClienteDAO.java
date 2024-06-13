package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Cliente> listar() {
        String sql = "SELECT * FROM cliente";
        List<Cliente> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setIdUsuario(rs.getInt("idUsuario"));
                cli.setNombre(rs.getString("nombre"));
                cli.setTipoDocumento(rs.getString("tipoDocumento"));
                cli.setNumDocumento(rs.getString("numDocumento"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setTelefono(rs.getString("telefono"));
                cli.setEmail(rs.getString("email"));
                lista.add(cli);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar ClienteDAO: " + e.getMessage());
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
        return lista;
    }

    public Cliente listarPorId(int idUsuario) {
        Cliente cli = new Cliente();
        String sql = "SELECT * FROM cliente WHERE idUsuario = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario); // Asegurarse de que este ID es válido y proviene de la sesión del usuario autenticado
            rs = ps.executeQuery();
            if (rs.next()) {
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setIdUsuario(rs.getInt("idUsuario"));
                cli.setNombre(rs.getString("nombre"));
                cli.setTipoDocumento(rs.getString("tipoDocumento"));
                cli.setNumDocumento(rs.getString("numDocumento"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setTelefono(rs.getString("telefono"));
                cli.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId ClienteDAO: " + e.getMessage());
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
        return cli;
    }

    public int agregar(Cliente cli) {
        String sql = "INSERT INTO cliente (idUsuario, nombre, tipoDocumento, numDocumento, direccion, telefono, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cli.getIdUsuario());
            ps.setString(2, cli.getNombre());
            ps.setString(3, cli.getTipoDocumento());
            ps.setString(4, cli.getNumDocumento());
            ps.setString(5, cli.getDireccion());
            ps.setString(6, cli.getTelefono());
            ps.setString(7, cli.getEmail());
            r = ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                cli.setIdCliente(generatedKeys.getInt(1));
            }

            System.out.println("Cliente agregado correctamente con ID: " + cli.getIdCliente());
        } catch (Exception e) {
            System.out.println("ERROR en Agregar ClienteDAO: " + e.getMessage());
        } finally {
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
        return r;
    }

    public int actualizar(Cliente cli) {
        String sql = "UPDATE cliente SET idUsuario=?, nombre=?, tipoDocumento=?, numDocumento=?, direccion=?, telefono=?, email=? WHERE idProveedor=?";
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
            ps.setInt(8, cli.getIdCliente());
            r = ps.executeUpdate();
            System.out.println("Cliente actualizado correctamente.");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar ClienteDAO: " + e.getMessage());
        } finally {
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
        return r;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM cliente WHERE idProveedor=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            System.out.println("Cliente eliminado correctamente.");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar ClienteDAO: " + e.getMessage());
        } finally {
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
    }
}
