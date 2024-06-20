package Controlador;

import Modelo.DetallesPedido;
import Modelo.DetallesPedidoDAO;
import Modelo.PedidoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maria
 */
public class ControladorDetallePedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        DetallesPedidoDAO detallesPedidoDAO = new DetallesPedidoDAO();
        PedidoDAO pedidoDAO = new PedidoDAO();
        ProductoDAO productoDAO = new ProductoDAO();
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));

        switch (opcion) {
            case "Listar":
                List<DetallesPedido> listaDetallesPedido = detallesPedidoDAO.listarPorIdPedido(idPedido);
                List<Producto> listaProductos = productoDAO.listar();
                List<Producto> listaProductosDisponibles = productoDAO.listarProductosDisponibles();

                Map<Integer, String> mapaNombresProductos = new HashMap<>();
                for (Producto producto : listaProductos) {
                    mapaNombresProductos.put(producto.getIdProducto(), producto.getNombre());
                }

                request.setAttribute("listaDetallesPedido", listaDetallesPedido);
                request.setAttribute("listaProductosDisponibles", listaProductosDisponibles);
                request.setAttribute("mapaNombresProductos", mapaNombresProductos);

                request.getRequestDispatcher("DetallePedido.jsp").forward(request, response);
                break;

            default:
                List<DetallesPedido> defaultListaDetallesPedido = detallesPedidoDAO.listarPorIdPedido(idPedido);
                List<Producto> defaultListaProductos = productoDAO.listar();

                Map<Integer, String> defaultMapaNombresProductos = new HashMap<>();
                for (Producto producto : defaultListaProductos) {
                    defaultMapaNombresProductos.put(producto.getIdProducto(), producto.getNombre());
                }

                request.setAttribute("listaDetallesPedido", defaultListaDetallesPedido);
                request.setAttribute("mapaNombresProductos", defaultMapaNombresProductos);

                request.getRequestDispatcher("DetallePedido.jsp").forward(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        DetallesPedidoDAO detallePedidoDAO = new DetallesPedidoDAO();
        ProductoDAO productoDAO = new ProductoDAO();
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));

        switch (accion) {
            case "Agregar":
                int idPedidoAgregar = Integer.parseInt(request.getParameter("idPedido"));
                int idProductoAgregar = Integer.parseInt(request.getParameter("idProducto"));
                int cantidadAgregar = Integer.parseInt(request.getParameter("cantidad"));
                double precioAgregar = Double.parseDouble(request.getParameter("precio"));
                int stockActual = Integer.parseInt(request.getParameter("stockActual"));

                int nuevoStock = stockActual - cantidadAgregar;
                int resultadoActualizarStock = productoDAO.actualizarStock(idProductoAgregar, nuevoStock);

                if (resultadoActualizarStock > 0) {
                    DetallesPedido detallePedidoAgregar = new DetallesPedido();
                    detallePedidoAgregar.setIdPedido(idPedidoAgregar);
                    detallePedidoAgregar.setIdProducto(idProductoAgregar);
                    detallePedidoAgregar.setCantidad(cantidadAgregar);
                    detallePedidoAgregar.setPrecio(precioAgregar);

                    int resultadoAgregar = detallePedidoDAO.agregar(detallePedidoAgregar);

                    if (resultadoAgregar > 0) {
                        response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&mensaje=Detalle+de+pedido+agregado+correctamente");
                    } else {
                        response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&error=Error+al+agregar+el+detalle+de+pedido");
                    }
                } else {
                    response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&error=Error+al+actualizar+el+stock+del+producto");
                }

                break;

            default:

                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
