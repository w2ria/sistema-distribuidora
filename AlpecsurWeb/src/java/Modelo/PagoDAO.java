
package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PagoDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Pago buscarPorId(int idPago) {
        Pago pago = new Pago();
        String sql = "SELECT * FROM pago WHERE idPago=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPago);
            rs = ps.executeQuery();
            while (rs.next()) {
                pago.setIdPago(rs.getInt(1));
                pago.setMonto(rs.getDouble(2));
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarPorId PagoDAO: " + e.getMessage());
        }
        return pago;
    }

    public List<Pago> listar() {
        String sql = "SELECT * FROM pago";
        List<Pago> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pago pago = new Pago();
                pago.setIdPago(rs.getInt(1));
                pago.setMonto(rs.getDouble(2));
                lista.add(pago);
            }
        } catch (Exception e) {
            System.out.println("ERROR en Listar PagoDAO: " + e.getMessage());
        }

        return lista;
    }

    public int agregar(Pago pago) {
        String sql = "INSERT INTO pago (Monto) VALUES (?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, pago.getMonto());
            r = ps.executeUpdate();
            System.out.println("Pago agregado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Agregar PagoDAO: " + e.getMessage());
        }

        return r;
    }

    public int actualizar(Pago pago) {
        String sql = "UPDATE pago SET Monto=? WHERE idPago=?";

        try {
            con = cn.Conexion();    
            ps = con.prepareStatement(sql);
            ps.setDouble(1, pago.getMonto());
            ps.setInt(2, pago.getIdPago());
            r = ps.executeUpdate();
            System.out.println("Pago actualizado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Actualizar PagoDAO: " + e.getMessage());
        }

        return r;
    }

    public void eliminar(int idPago) {
        String sql = "DELETE FROM pago WHERE idPago=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPago);
            ps.executeUpdate();
            System.out.println("Pago eliminado correctamente!");
        } catch (Exception e) {
            System.out.println("ERROR en Eliminar PagoDAO: " + e.getMessage());
        }
    }
    
     public int obtenerIdPagoPorIdPedido(int idPedido) {
        int idPago = -1;

        String sql = "SELECT idPago FROM pedido WHERE idPedido = ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);

            rs = ps.executeQuery();
            if (rs.next()) {
                idPago = rs.getInt("idPago");
            }
        } catch (SQLException e) {
            System.out.println("Error en obtenerIdPagoPorIdPedido: " + e.getMessage());
        } finally {
            cn.cerrarConexion(con);
        }

        return idPago;
    }
}
