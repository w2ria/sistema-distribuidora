/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Autos> buscarAutosDisponibles(String ubicacion, String fechaInicio, String fechaFin, String horaInicio, String horaFin) {
        List<Autos> autosDisponibles = new ArrayList<>();
        String sql = "SELECT * FROM autos WHERE ubicacion = ? AND estado = 'activo' AND idAutos NOT IN (SELECT idAutos FROM detallereserva dr JOIN reserva r ON dr.idReserva = r.idReserva WHERE (r.fecha_inicio BETWEEN ? AND ?) AND (r.hora_inicio BETWEEN ? AND ?))";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, ubicacion);
            ps.setString(2, fechaInicio);
            ps.setString(3, fechaFin);
            ps.setString(4, horaInicio);
            ps.setString(5, horaFin);
            rs = ps.executeQuery();

            while (rs.next()) {
                Autos auto = new Autos();
                auto.setIdAutos(rs.getInt("idAutos"));
                auto.setNombre(rs.getString("nombre"));
                auto.setPrecio_Dia(rs.getDouble("precio_dia"));
                auto.setDescripcion(rs.getString("descripcion"));
                autosDisponibles.add(auto);
            }
        } catch (Exception e) {
            System.out.println("ERROR en buscarAutosDisponibles ReservaDao: " + e.getMessage());
        }
        return autosDisponibles;
    }

    public boolean reservarAuto(Reserva reserva, DetalleReserva detalleReserva) {
        String sqlReserva = "INSERT INTO reserva (idCliente, idEmpleado, idPago, tipoComprobante, numComprobante, ubicacion, fecha_inicio, fecha_fin, hora_inicio, hora_fin, total, idEstadoReserva) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlDetalle = "INSERT INTO detallereserva (idReserva, idAutos, cantidad, precio) VALUES (?, ?, ?, ?)";
        String sqlActualizarAuto = "UPDATE autos SET estado = 'reservado' WHERE idAutos = ?";
        boolean resultado = false;

        try {
            con = cn.Conexion();
            con.setAutoCommit(false);

            // Insertar reserva
            ps = con.prepareStatement(sqlReserva, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, reserva.getIdCliente());
            ps.setInt(2, reserva.getIdEmpleado());
            ps.setInt(3, reserva.getIdPago());
            ps.setString(4, reserva.getTipoComprobante());
            ps.setString(5, reserva.getNumComprobante());
            ps.setString(6, reserva.getUbicacion());
            ps.setDate(7, new Date(reserva.getFecha_inicio().getTime()));
            ps.setDate(8, new Date(reserva.getFecha_fin().getTime()));
            ps.setString(9, reserva.getHora_inicio());
            ps.setString(10, reserva.getHora_fin());
            ps.setDouble(11, reserva.getTotal());
            ps.setInt(12, reserva.getIdEstadoReserva());
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                detalleReserva.setIdReserva(rs.getInt(1));
            }

            // Insertar detalle de reserva
            ps = con.prepareStatement(sqlDetalle);
            ps.setInt(1, detalleReserva.getIdReserva());
            ps.setInt(2, detalleReserva.getIdAutos());
            ps.setInt(3, detalleReserva.getCantidad());
            ps.setDouble(4, detalleReserva.getPrecio());
            ps.executeUpdate();

            // Actualizar estado del auto
            ps = con.prepareStatement(sqlActualizarAuto);
            ps.setInt(1, detalleReserva.getIdAutos());
            ps.executeUpdate();

            con.commit();
            resultado = true;

        } catch (Exception e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                System.out.println("ERROR en rollback ReservaDao: " + ex.getMessage());
            }
            System.out.println("ERROR en reservarAuto ReservaDao: " + e.getMessage());
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                System.out.println("ERROR en setAutoCommit(true) ReservaDao: " + e.getMessage());
            }
        }
        return resultado;
    }
    public boolean insertar(Reserva reserva) {
        String sql = "INSERT INTO reserva (idCliente, idEmpleado, idPago, tipoComprobante, numComprobante, ubicacion, fecha_inicio, fecha_fin, hora_inicio, hora_fin, total, idEstadoReserva) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, reserva.getIdCliente());
            ps.setInt(2, reserva.getIdEmpleado());
            ps.setInt(3, reserva.getIdPago());
            ps.setString(4, reserva.getTipoComprobante());
            ps.setString(5, reserva.getNumComprobante());
            ps.setString(6, reserva.getUbicacion());
            ps.setDate(7, new java.sql.Date(reserva.getFecha_inicio().getTime()));
            ps.setDate(8, new java.sql.Date(reserva.getFecha_fin().getTime()));
            ps.setString(9, reserva.getHora_inicio());
            ps.setString(10, reserva.getHora_fin());
            ps.setDouble(11, reserva.getTotal());
            ps.setInt(12, reserva.getIdEstadoReserva());
            int resultado = ps.executeUpdate();
            return resultado > 0;
        } catch (SQLException e) {
            System.out.println("Error al insertar reserva: " + e.getMessage());
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar conexión: " + e.getMessage());
            }
        }
    }
}
