package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    conexion cn = new conexion();
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
            System.out.println("ERROR en validar UsuarioDAO: " + e.getMessage());
        }
        return us;
    }

    // Operaciones CRUD:
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

    public Usuario listarPorId(int id) {
        Usuario us = new Usuario();
        String sql = "Select * From usuario Where idUsuario=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setIdUsuario(rs.getInt("idUsuario"));
                us.setUsuario(rs.getString("usuario"));
                us.setClave(rs.getString("clave"));
                us.setToken(rs.getString("token"));
                us.setExpiracion(rs.getTimestamp("expiracion"));
            }
        } catch (Exception e) {
            System.out.println("ERROR en ListarPorId UsuarioDAO: " + e.getMessage());
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

        return us;
    }

    public int agregar(Usuario us) {
        String sql = "Insert Into usuario (usuario, clave, token, expiracion) Values(?,?,?,?)";
        int idUsuario = -1;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);  // Aquí se especifica RETURN_GENERATED_KEYS
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
            ps.setInt(5, us.getIdUsuario());
            r = ps.executeUpdate();
            System.out.println("Actualizado de forma correcta!");
        } catch (Exception e) {
            System.out.println("ERROR en Editar UsuarioDAO: " + e.getMessage());
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
        String sql = "Delete from usuario Where idUsuario=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar UsuarioDAO: " + e.getMessage());
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

    public int obtenerUltimoNumeroUsuario() {
        String sql = "SELECT MAX(CAST(SUBSTRING(usuario, 4, 4) AS UNSIGNED)) FROM usuario WHERE usuario LIKE 'PRO%'";
        int ultimoNumero = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                ultimoNumero = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("ERROR en obtenerUltimoNumeroUsuario: " + e.getMessage());
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
        return ultimoNumero;
    }

    public int agregarUsuarioProveedor(Usuario us) {
        String sql = "INSERT INTO usuario (usuario,expiracion) VALUES(?,?)";
        int idUsuario = -1;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, us.getUsuario());
            ps.setTimestamp(2, us.getExpiracion());
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                idUsuario = generatedKeys.getInt(1);
            }

            System.out.println("Usuario agregado correctamente con ID: " + idUsuario);
        } catch (Exception e) {
            System.out.println("ERROR en Agregar UsuarioDAO: " + e.getMessage());
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

        return idUsuario;
    }

    public String generarNuevoNombreUsuarioProveedor(int ultimoNumero) {
        int nuevoNumero = ultimoNumero + 1;
        return String.format("PRO%04d", nuevoNumero);
    }

    public boolean existeUsuario(int idUsuario) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE idUsuario = ?";
        boolean existe = false;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                existe = true;
            }
        } catch (Exception e) {
            System.out.println("ERROR en existeUsuario: " + e.getMessage());
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

        return existe;
    }

}

//import Configuraciones.conexion;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;
//
//public class UsuarioDAO {
//
//    conexion cn = new conexion();
//    Connection con;
//    PreparedStatement ps;
//    ResultSet rs;
//    int r;
//
//    public Usuario validar(String usuario, String contraseña) {
//        Usuario us = new Usuario();
//        String sql = "select * from usuario where usuario=? and clave=?";
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            ps.setString(1, usuario);
//            ps.setString(2, contraseña);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                us.setIdUsuario(rs.getInt("idUsuario"));
//                us.setUsuario(rs.getString("usuario"));
//                us.setClave(rs.getString("clave"));
//                us.setToken(rs.getString("token"));
//                us.setExpiracion(rs.getTimestamp("expiracion"));
//            }
//        } catch (Exception e) {
//        }
//        return us;
//    }
//
//    //Operaciones CRUD:
//    public List<Usuario> listar() {
//        String sql = "Select * From usuario";
//        List<Usuario> lista = new ArrayList<>();
//
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Usuario us = new Usuario();
//                us.setIdUsuario(rs.getInt(1));
//                us.setUsuario(rs.getString(2));
//                us.setClave(rs.getString(3));
//                us.setToken(rs.getString(4));
//                us.setExpiracion(rs.getTimestamp(5));
//                lista.add(us);
//            }
//        } catch (Exception e) {
//            System.out.println("ERROR en Listar UsuarioDAO: " + e.getMessage());
//        }
//
//        return lista;
//    }
//
//    public Usuario listarPorId(int id) {
//        Usuario us = new Usuario();
//        String sql = "Select * From usuario Where idUsuario=" + id;
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                ps.setString(1, us.getUsuario());
//                ps.setString(2, us.getClave());
//                ps.setString(3, us.getToken());
//                ps.setTimestamp(4, us.getExpiracion());
//            }
//        } catch (Exception e) {
//            System.out.println("ERROR en ListarPorId UsuarioDAO: " + e.getMessage());
//        }
//
//        return us;
//    }
//
//    public int agregar(Usuario us) {
//        String sql = "Insert Into usuario (usuario, clave, token, expiracion) Values(?,?,?,?)";
//        int idUsuario = -1;
//
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            ps.setString(1, us.getUsuario());
//            ps.setString(2, us.getClave());
//            ps.setString(3, us.getToken());
//            ps.setTimestamp(4, us.getExpiracion());
//            ps.executeUpdate();
//
//            // Obtener el ID generado por la base de datos
//            ResultSet generatedKeys = ps.getGeneratedKeys();
//            if (generatedKeys.next()) {
//                idUsuario = generatedKeys.getInt(1);
//            }
//
//            System.out.println("Usuario agregado correctamente con ID: " + idUsuario);
//        } catch (Exception e) {
//            System.out.println("ERROR en Agregar UsuarioDAO: " + e.getMessage());
//        }
//
//        return idUsuario;
//    }
//
//
//    public int actualizar(Usuario us) {
//        String sql = "Update usuario Set usuario=?, clave=?, token=?, expiracion=? Where idUsuario=?";
//
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            ps.setString(1, us.getUsuario());
//            ps.setString(2, us.getClave());
//            ps.setString(3, us.getToken());
//            ps.setTimestamp(4, us.getExpiracion());
//            ps.executeUpdate();
//            System.out.println("Actualizado de forma correcta!");
//        } catch (Exception e) {
//            System.out.println("ERROR en Editar UsuarioDAO: " + e.getMessage());
//        }
//
//        return r;
//    }
//
//    public void eliminar(int id) {
//        String sql = "Delete from usuario Where idUsuario=" + id;
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            System.out.println("ERROR en Eliminar UsuarioDAO: " + e.getMessage());
//        }
//    }
//
//    public int obtenerUltimoNumeroUsuario() {
//        String sql = "SELECT MAX(CAST(SUBSTRING(usuario, 4, 4) AS UNSIGNED)) FROM usuario WHERE usuario LIKE 'PRO%'";
//        int ultimoNumero = 0;
//
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                ultimoNumero = rs.getInt(1);
//            }
//        } catch (Exception e) {
//            System.out.println("ERROR en obtenerUltimoNumeroUsuario: " + e.getMessage());
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (ps != null) {
//                    ps.close();
//                }
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                System.out.println("ERROR cerrando conexiones: " + e.getMessage());
//            }
//        }
//        return ultimoNumero;
//    }
//
//    public String generarNuevoNombreUsuarioProveedor(int ultimoNumero) {
//        int nuevoNumero = ultimoNumero + 1;
//        return String.format("PRO%04d", nuevoNumero);
//    }
//
//    public boolean existeUsuario(int idUsuario) {
//        String sql = "SELECT COUNT(*) FROM usuario WHERE idUsuario = ?";
//        boolean existe = false;
//
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, idUsuario);
//            rs = ps.executeQuery();
//            if (rs.next() && rs.getInt(1) > 0) {
//                existe = true;
//            }
//        } catch (Exception e) {
//            System.out.println("ERROR en existeUsuario: " + e.getMessage());
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (ps != null) {
//                    ps.close();
//                }
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                System.out.println("ERROR cerrando conexiones: " + e.getMessage());
//            }
//        }
//
//        return existe;
//    }
//
//}
