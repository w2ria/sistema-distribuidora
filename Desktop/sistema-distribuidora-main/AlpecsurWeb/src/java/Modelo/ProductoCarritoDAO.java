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
import java.util.ArrayList;
import java.util.List;


public class ProductoCarritoDAO {
    Connection con;
    conexion cn= new conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Producto listarId(int idProducto) {
        String sql = "SELECT * FROM producto WHERE idProducto="+idProducto;
        Producto p=new Producto();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                p.setIdProducto(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                p.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                p.setMarca(marca);
                p.setNombre(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setDescripcion(rs.getString(7));
                p.setImagen(rs.getString(8));
                p.setEstado(rs.getString(9));
            }
        } catch (SQLException e) {
        }return p;
    }
    
    
    public List listar(){
        List<Producto>productos=new ArrayList();
        String sql="select * from producto";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Producto p=new Producto();
                p.setIdProducto(rs.getInt(1));
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt(2));
                p.setCategoria(categoria);
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt(3));
                p.setMarca(marca);
                p.setNombre(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setDescripcion(rs.getString(7));
                p.setImagen(rs.getString(8));
                p.setEstado(rs.getString(9));
                productos.add(p);
            }
        }catch(SQLException e){
        }
        return productos;
    }
    
}
