/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Configuraciones.fecha;
import static Configuraciones.fecha.fecha;
import Modelo.Carrito;
import Modelo.Cliente;
import Modelo.Empleado;
import Modelo.Pago;
import Modelo.Pedido;
import Modelo.PedidoDAO;
import Modelo.Producto;
import Modelo.ProductoCarritoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piero
 */
public class controlador extends HttpServlet {

    ProductoCarritoDAO pdao=new ProductoCarritoDAO();
    Producto p=new Producto();
    List<Producto> productos=new ArrayList<>();
    
    List<Carrito> listaCarrito=new ArrayList<>();
    int item;
    double totalPagar=0.0;
    int cantidad=1;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        productos=pdao.listar();
            switch(accion){
              case"AgregarCarrito":
                  int pos=0;
                  cantidad=1;
                  int idp=Integer.parseInt(request.getParameter("idProducto"));
                  p=pdao.listarId(idp);
                  if(listaCarrito.size()>0){
                      for (int i = 0; i < listaCarrito.size(); i++) {
                          if (idp==listaCarrito.get(i).getIdProducto()){
                              pos = i;
                          }
                        }
                      if (idp==listaCarrito.get(pos).getIdProducto()) {
                          cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
                          double subtotal=listaCarrito.get(pos).getPrecio()*cantidad;
                          listaCarrito.get(pos).setCantidad(cantidad);
                          listaCarrito.get(pos).setSubTotal(subtotal);
                      }else{
                            item=item+1;
                            Carrito cart=new Carrito();
                            cart.setItem(item);
                            cart.setIdProducto(p.getIdProducto());
                            cart.setNombre(p.getNombre());
                            cart.setDescripcion(p.getDescripcion());
                            cart.setPrecio(p.getPrecio());
                            cart.setCantidad(cantidad);
                            cart.setSubTotal(cantidad * p.getPrecio());
                            listaCarrito.add(cart); 
                      }
                      
                  }else{
                        item=item+1;
                        Carrito cart=new Carrito();
                        cart.setItem(item);
                        cart.setIdProducto(p.getIdProducto());
                        cart.setNombre(p.getNombre());
                        cart.setDescripcion(p.getDescripcion());
                        cart.setPrecio(p.getPrecio());
                        cart.setCantidad(cantidad);
                        cart.setSubTotal(cantidad * p.getPrecio());
                        listaCarrito.add(cart); 
                  }

                  request.setAttribute("cont",listaCarrito.size());
                  request.getRequestDispatcher("controlador?accion=productos").forward(request,response);
                  break;
              case "Delete":
                  int idproducto=Integer.parseInt(request.getParameter("idp"));
                  for (int i = 0; i < listaCarrito.size(); i++) {
                      if (listaCarrito.get(i).getIdProducto()==idproducto){
                          listaCarrito.remove(i);
                      }
                  }
                  break;
              case"ActualizarCantidad":
                    int idpro=Integer.parseInt(request.getParameter("idp"));
                    int cant=Integer.parseInt(request.getParameter("Cantidad"));
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (listaCarrito.get(i).getIdProducto()==idpro) {
                            listaCarrito.get(i).setCantidad(cant);
                            double st=listaCarrito.get(i).getPrecio()*cant;
                            listaCarrito.get(i).setSubTotal(st);
                        }
                  }
                    break;
              case"Carrito":
                  totalPagar=0.0;
                  request.setAttribute("carrito",listaCarrito);
                  for(int i=0; i<listaCarrito.size();i++){
                      totalPagar=totalPagar+listaCarrito.get(i).getSubTotal();
                  }
                  request.setAttribute("totalPagar", totalPagar);
                  request.getRequestDispatcher("carrito.jsp").forward(request, response);
                  break;
                /**
 *
 * @author piero
  
                case"GenerarPedido":
                    Cliente cliente=new Cliente();
                    cliente.setIdCliente(1);
                    Empleado empleado=new Empleado();
                    empleado.setIdEmpleado(1);
                    PedidoDAO dao= new PedidoDAO();
                    Pago pago = new Pago();
                    Pedido pedido = new Pedido(1,1);
                    int res=dao.GenerarPedido(pedido);
                    if(res!=0&&totalPagar>0){
                        request.getRequestDispatcher("mensaje.jsp").forward(request,response);
                    }else{
                        request.getRequestDispatcher("error.jsp").forward(request,response);
                    }
                    break;
                    * */ 
              default:
              request.setAttribute("productos",productos);
              request.getRequestDispatcher("productosCarrito.jsp").forward(request, response);
                
            }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        processRequest(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        processRequest(request,response);
    }
    
    @Override
    public String getServletInfo(){
        return "Short description";
    }
}
