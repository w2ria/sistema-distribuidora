/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PedidoDAO {
    Connection con;
    conexion cn= new conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int GenerarPedido(Pedido pedido){
        int idpedido;
        String sql="inser into pedido(idCliente,idEmpleado,idPago,tipoComprobante,numComprobante,fecha,total,idEstadoPedido)values(?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1,pedido.getIdCliente());
            ps.setInt(2,pedido.getIdEmpleado());
            ps.setInt(3,pedido.getIdPago());
            ps.setString(4,pedido.getTipoComprobante());
            ps.setString(5, pedido.getNumComprobante());
            ps.setString(6, pedido.getFecha());
            ps.setDouble(7,pedido.getTotal());
            ps.setInt(8,pedido.getIdEstadoPedido());
            r=ps.executeUpdate();
            
            sql="Select @@IDENTIFY AS idPedido";
            rs = ps.executeQuery(sql);
            rs.next();
            idpedido=rs.getInt("idPedido");
            rs.close();
            
            for (Carrito detalle: pedido.getDetallePedido()) {
                sql="insert into detallepedido(idPedido ,idProducto cantidad,precio)values(?,?,?,?)";
                ps=con.prepareStatement(sql);
                ps.setInt(1, idpedido);
                ps.setInt(2, detalle.getIdProducto());
                ps.setInt(3,detalle.getCantidad());
                ps.setDouble(4,detalle.getPrecio());
                r=ps.executeUpdate();
            }
        }catch(SQLException e){
            
        }
        return r;
        
    }
    
}
