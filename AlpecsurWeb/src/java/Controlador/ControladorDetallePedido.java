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

                Map<Integer, String> mapaNombresProductos = new HashMap<>();
                for (Producto producto : listaProductos) {
                    mapaNombresProductos.put(producto.getIdProducto(), producto.getNombre());
                }

                request.setAttribute("listaDetallesPedido", listaDetallesPedido);
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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
