package Controlador;

import Modelo.DetallesPedido;
import Modelo.DetallesPedidoDAO;
import Modelo.Pago;
import Modelo.PagoDAO;
import Modelo.Pedido;
import Modelo.PedidoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import java.io.IOException;
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

                Map<Integer, Integer> mapaStockProductos = new HashMap<>();
                for (Producto producto : listaProductos) {
                    mapaNombresProductos.put(producto.getIdProducto(), producto.getNombre());

                    int stock = productoDAO.obtenerStock(producto.getIdProducto());
                    mapaStockProductos.put(producto.getIdProducto(), stock);
                }

                request.setAttribute("listaDetallesPedido", listaDetallesPedido);
                request.setAttribute("listaProductosDisponibles", listaProductosDisponibles);
                request.setAttribute("mapaNombresProductos", mapaNombresProductos);
                request.setAttribute("mapaStockProductos", mapaStockProductos);

                request.getRequestDispatcher("DetallePedido.jsp").forward(request, response);
                break;

            case "Eliminar":
                DetallesPedidoDAO detallePedidoDAO = new DetallesPedidoDAO();
                int idDetallePedidoEliminar = Integer.parseInt(request.getParameter("idDetallePedido"));
                int idPedidoEliminar = Integer.parseInt(request.getParameter("idPedido"));

                DetallesPedido detallePedidoEliminar = detallesPedidoDAO.obtenerPorId(idDetallePedidoEliminar);

                if (detallePedidoEliminar != null) {
                    int idProductoEliminar = detallePedidoEliminar.getIdProducto();
                    int cantidadEliminar = detallePedidoEliminar.getCantidad();
                    int stockActualEliminar = productoDAO.obtenerStock(idProductoEliminar);
                    int nuevoStockEliminar = stockActualEliminar + cantidadEliminar;
                    productoDAO.actualizarStock(idProductoEliminar, nuevoStockEliminar);
                    detallesPedidoDAO.eliminar(idDetallePedidoEliminar);

                    double nuevoTotalPedido = detallePedidoDAO.calcularNuevoTotal(idPedidoEliminar);
                    pedidoDAO.actualizarTotal(idPedidoEliminar, nuevoTotalPedido);

                    PagoDAO pagoDAO = new PagoDAO();
                    int idPagoEditar = pagoDAO.obtenerIdPagoPorIdPedido(idPedidoEliminar);
                    Pago pagoEditar = pagoDAO.buscarPorId(idPagoEditar);
                    pagoEditar.setMonto(nuevoTotalPedido);
                    int pagoActualizado = pagoDAO.actualizar(pagoEditar);

                    if (pagoActualizado > 0) {
                        response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEliminar + "&mensaje=Detalle+de+pedido+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEliminar + "&error=Error+al+eliminar+el+pago");
                    }
                } else {
                    response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEliminar + "&error=Error+al+eliminar+el+detalle+de+pedido");
                }
                break;

            default:
                List<DetallesPedido> defaultListaDetallesPedido = detallesPedidoDAO.listarPorIdPedido(idPedido);
                List<Producto> defaultListaProductos = productoDAO.listar();
                List<Producto> defaultListaProductosDisponibles = productoDAO.listarProductosDisponibles();

                Map<Integer, String> defaultMapaNombresProductos = new HashMap<>();
                for (Producto producto : defaultListaProductos) {
                    defaultMapaNombresProductos.put(producto.getIdProducto(), producto.getNombre());
                }

                Map<Integer, Integer> defaultMapaStockProductos = new HashMap<>();
                for (Producto producto : defaultListaProductos) {
                    int stock = productoDAO.obtenerStock(producto.getIdProducto());
                    defaultMapaStockProductos.put(producto.getIdProducto(), stock);
                }

                request.setAttribute("listaDetallesPedido", defaultListaDetallesPedido);
                request.setAttribute("listaProductosDisponibles", defaultListaProductosDisponibles);
                request.setAttribute("mapaNombresProductos", defaultMapaNombresProductos);
                request.setAttribute("mapaStockProductos", defaultMapaStockProductos);

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
        Pedido nuevoPedido = new Pedido();
        PedidoDAO pedidoDAO = new PedidoDAO();
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
                double totalAgregar = cantidadAgregar * precioAgregar;

                if (resultadoActualizarStock > 0) {
                    DetallesPedido detallePedidoAgregar = new DetallesPedido();
                    detallePedidoAgregar.setIdPedido(idPedidoAgregar);
                    detallePedidoAgregar.setIdProducto(idProductoAgregar);
                    detallePedidoAgregar.setCantidad(cantidadAgregar);
                    detallePedidoAgregar.setPrecio(totalAgregar);

                    int resultadoAgregar = detallePedidoDAO.agregar(detallePedidoAgregar);

                    if (resultadoAgregar > 0) {
                        double nuevoTotalPedido = detallePedidoDAO.calcularNuevoTotal(idPedidoAgregar);
                        pedidoDAO.actualizarTotal(idPedidoAgregar, nuevoTotalPedido);

                        PagoDAO pagoDAO = new PagoDAO();
                        int idPagoEditar = pagoDAO.obtenerIdPagoPorIdPedido(idPedidoAgregar);
                        Pago pagoEditar = pagoDAO.buscarPorId(idPagoEditar);
                        pagoEditar.setMonto(nuevoTotalPedido);
                        int pagoActualizado = pagoDAO.actualizar(pagoEditar);

                        if (pagoActualizado > 0) {
                            response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&mensaje=Detalle+de+pedido+agregado+correctamente");
                        } else {
                            response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&error=Error+al+actualizar+el+pago");
                        }

                    } else {
                        response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&error=Error+al+agregar+el+detalle+de+pedido");
                    }
                } else {
                    response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoAgregar + "&error=Error+al+actualizar+el+stock+del+producto");
                }

                break;

            case "Editar":
                int idDetallePedidoEditar = Integer.parseInt(request.getParameter("idDetallePedido"));
                int idProductoEditar = Integer.parseInt(request.getParameter("idProducto"));
                int cantidadEditar = Integer.parseInt(request.getParameter("cantidad"));
                double precioEditar = Double.parseDouble(request.getParameter("precio"));
                int idPedidoEditar = Integer.parseInt(request.getParameter("idPedido"));
                int stockActualEditar = Integer.parseInt(request.getParameter("stockActual"));

                DetallesPedido detallePedidoActualEditar = detallePedidoDAO.obtenerPorId(idDetallePedidoEditar);

                if (detallePedidoActualEditar != null) {
                    int cantidadActualEditar = detallePedidoActualEditar.getCantidad();

                    int nuevoStockEditar = stockActualEditar + cantidadActualEditar - cantidadEditar;

                    productoDAO.actualizarStock(idProductoEditar, nuevoStockEditar);

                    double totalEditar = precioEditar * cantidadEditar;

                    DetallesPedido detallePedidoEditar = new DetallesPedido();
                    detallePedidoEditar.setIdDetallePedido(idDetallePedidoEditar);
                    detallePedidoEditar.setIdPedido(idPedidoEditar);
                    detallePedidoEditar.setIdProducto(idProductoEditar);
                    detallePedidoEditar.setCantidad(cantidadEditar);
                    detallePedidoEditar.setPrecio(totalEditar);

                    detallePedidoDAO.actualizar(detallePedidoEditar);

                    double nuevoTotalPedidoEditar = detallePedidoDAO.calcularNuevoTotal(idPedidoEditar);
                    int resultadoActualizarTotal = pedidoDAO.actualizarTotal(idPedidoEditar, nuevoTotalPedidoEditar);

                    if (resultadoActualizarTotal > 0) {

                        PagoDAO pagoDAO = new PagoDAO();
                        int idPagoEditar = pagoDAO.obtenerIdPagoPorIdPedido(idPedidoEditar);
                        Pago pagoEditar = pagoDAO.buscarPorId(idPagoEditar);
                        pagoEditar.setMonto(nuevoTotalPedidoEditar);
                        int pagoActualizado = pagoDAO.actualizar(pagoEditar);

                        if (pagoActualizado > 0) {
                            response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEditar + "&mensaje=Detalle+de+pedido+editado+correctamente");
                        } else {
                            response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEditar + "&error=Error+al+actualizar+el+pago");
                        }
                    } else {
                        response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEditar + "&error=Error+al+editar+el+detalle+de+pedido");
                    }
                } else {
                    response.sendRedirect("ControladorDetallePedido?Op=Listar&idPedido=" + idPedidoEditar + "&error=Detalle+de+pedido+no+encontrado");
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
