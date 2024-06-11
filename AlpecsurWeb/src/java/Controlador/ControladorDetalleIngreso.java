package Controlador;

import Modelo.DetalleIngreso;
import Modelo.DetalleIngresoDAO;
import Modelo.Ingreso;
import Modelo.IngresoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maria
 */
public class ControladorDetalleIngreso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        DetalleIngresoDAO detalleIngresoDAO = new DetalleIngresoDAO();
        ProductoDAO productoDAO = new ProductoDAO();
        int idIngreso = Integer.parseInt(request.getParameter("idIngreso"));

        switch (opcion) {
            case "Listar":
                List<DetalleIngreso> listaDetalleIngresos = detalleIngresoDAO.listarPorIdIngreso(idIngreso);
                List<Producto> listaProductos = productoDAO.listar();
                request.setAttribute("ListaDetalleIngresos", listaDetalleIngresos);
                request.setAttribute("ListaProductos", listaProductos);
                request.getRequestDispatcher("DetalleIngreso.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idDetalleIngresoEliminarStr = request.getParameter("idDetalleIngreso");
                if (idDetalleIngresoEliminarStr != null && !idDetalleIngresoEliminarStr.isEmpty()) {
                    int idDetalleIngresoAEliminar = Integer.parseInt(idDetalleIngresoEliminarStr);

                    List<DetalleIngreso> listaDetalleIngresoEliminar = detalleIngresoDAO.listarPorIdIngreso(idIngreso);

                    // Buscar el detalle de ingreso a eliminar en la lista
                    DetalleIngreso detalleAEliminar = null;
                    for (DetalleIngreso detalle : listaDetalleIngresoEliminar) {
                        if (detalle.getIdDetalleIngreso() == idDetalleIngresoAEliminar) {
                            detalleAEliminar = detalle;
                            break;
                        }
                    }

                    if (detalleAEliminar != null) {
                        int cantidadAEliminar = detalleAEliminar.getCantidad();

                        boolean eliminacionExitosa = detalleIngresoDAO.eliminar(idDetalleIngresoAEliminar);
                        if (eliminacionExitosa) {
                            IngresoDAO ingresoDAOEliminar = new IngresoDAO();
                            double nuevoTotalEliminar = detalleIngresoDAO.calcularNuevoTotal(idIngreso);
                            ingresoDAOEliminar.actualizarTotal(idIngreso, nuevoTotalEliminar);

                            ProductoDAO productoDAOEliminar = new ProductoDAO();
                            int stockActualProducto = productoDAOEliminar.obtenerStock(detalleAEliminar.getIdProducto().getIdProducto());
                            int resultadoActualizarStock = stockActualProducto - cantidadAEliminar;
                            productoDAOEliminar.actualizarStock(detalleAEliminar.getIdProducto().getIdProducto(), resultadoActualizarStock);

                            response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&mensaje=Detalle+de+ingreso+eliminado+correctamente");
                        } else {
                            response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&error=Hubo+un+error+al+eliminar+el+detalle+de+ingreso");
                        }
                    } else {
                        response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&error=El+detalle+de+ingreso+a+eliminar+no+se+encontró");
                    }
                } else {
                    response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&error=Hubo+un+error+al+eliminar+el+detalle+de+ingreso");
                }
                break;

            default:
                listaDetalleIngresos = detalleIngresoDAO.listarPorIdIngreso(idIngreso);
                listaProductos = productoDAO.listar();
                request.setAttribute("ListaDetalleIngresos", listaDetalleIngresos);
                request.setAttribute("ListaProductos", listaProductos);
                request.getRequestDispatcher("DetalleIngreso.jsp").forward(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        DetalleIngresoDAO detalleIngresoDAO = new DetalleIngresoDAO();
        int idIngreso = Integer.parseInt(request.getParameter("idIngreso"));

        switch (accion) {
            case "Agregar":
                int idProductoAgregar = Integer.parseInt(request.getParameter("idProducto"));
                int cantidadAgregar = Integer.parseInt(request.getParameter("cantidad"));
                int stockActualAgregar = Integer.parseInt(request.getParameter("cantidad"));
                double precioAgregar = Double.parseDouble(request.getParameter("precio"));
                Date fechaVencimientoAgregar = Date.valueOf(request.getParameter("fechaVencimiento"));

                Ingreso ingresoAgregar = new Ingreso();
                ingresoAgregar.setIdIngreso(idIngreso);
                DetalleIngreso detalleIngresoAgregar = new DetalleIngreso();
                detalleIngresoAgregar.setIdIngreso(ingresoAgregar);
                Producto productoAgregar = new Producto();
                productoAgregar.setIdProducto(idProductoAgregar);
                detalleIngresoAgregar.setIdProducto(productoAgregar);
                detalleIngresoAgregar.setCantidad(cantidadAgregar);
                detalleIngresoAgregar.setStockActual(stockActualAgregar);
                detalleIngresoAgregar.setPrecio(precioAgregar);
                detalleIngresoAgregar.setFechaVencimiento(fechaVencimientoAgregar);

                ProductoDAO productoDAO = new ProductoDAO();
                int stockActualProducto = productoDAO.obtenerStock(idProductoAgregar);
                int nuevoStockProducto = stockActualProducto + cantidadAgregar;

                int resultadoAgregar = detalleIngresoDAO.agregar(detalleIngresoAgregar);

                if (resultadoAgregar > 0) {
                    IngresoDAO ingresoDAOAgregar = new IngresoDAO();
                    double nuevoTotalAgregar = detalleIngresoDAO.calcularNuevoTotal(idIngreso);
                    ingresoDAOAgregar.actualizarTotal(idIngreso, nuevoTotalAgregar);

                    productoDAO.actualizarStock(idProductoAgregar, nuevoStockProducto);

                    response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&mensaje=Detalle+de+ingreso+agregado+correctamente");
                } else {
                    response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&error=Error+al+agregar+el+detalle+de+ingreso");
                }

                break;

            case "Editar":
                try {
                String idDetalleIngresoParam = request.getParameter("idDetalleIngreso");
                String idProductoParam = request.getParameter("idProducto");
                String cantidadParam = request.getParameter("cantidad");
                String stockActualParam = request.getParameter("stockActual");
                String precioParam = request.getParameter("precio");
                String fechaVencimientoParam = request.getParameter("fechaVencimiento");

                if (idDetalleIngresoParam == null || idProductoParam == null || cantidadParam == null
                        || stockActualParam == null || precioParam == null || fechaVencimientoParam == null
                        || idDetalleIngresoParam.isEmpty() || idProductoParam.isEmpty() || cantidadParam.isEmpty()
                        || stockActualParam.isEmpty() || precioParam.isEmpty() || fechaVencimientoParam.isEmpty()) {

                    throw new NumberFormatException("Uno o más parámetros están vacíos o nulos");
                }

                int idDetalleIngresoEditar = Integer.parseInt(idDetalleIngresoParam);
                int idProductoEditar = Integer.parseInt(idProductoParam);
                int cantidadEditar = Integer.parseInt(cantidadParam);
                int stockActualEditar = Integer.parseInt(stockActualParam);
                double precioEditar = Double.parseDouble(precioParam);
                Date fechaVencimientoEditar = Date.valueOf(fechaVencimientoParam);

                // Obtener detalle de ingreso original antes de la edición
                DetalleIngreso detalleIngresoOriginal = detalleIngresoDAO.listarPorIdDetalleIngreso(idDetalleIngresoEditar);
                int cantidadOriginal = detalleIngresoOriginal.getCantidad();
                int stockOriginal = detalleIngresoOriginal.getStockActual();

                // Actualizar el detalle de ingreso
                DetalleIngreso detalleIngresoEditar = new DetalleIngreso();
                detalleIngresoEditar.setIdDetalleIngreso(idDetalleIngresoEditar);
                detalleIngresoEditar.setCantidad(cantidadEditar);
                detalleIngresoEditar.setStockActual(stockActualEditar);
                detalleIngresoEditar.setPrecio(precioEditar);
                detalleIngresoEditar.setFechaVencimiento(fechaVencimientoEditar);

                int resultadoEditar = detalleIngresoDAO.actualizar(detalleIngresoEditar);

                if (resultadoEditar > 0) {
                    // Obtener el stock actual del producto
                    ProductoDAO productoDAOEditar = new ProductoDAO();
                    int stockActualProductoEd = productoDAOEditar.obtenerStock(idProductoEditar);

                    // Calcular el nuevo stock del producto
                    int diferenciaStock = stockOriginal - stockActualEditar;
                    int nuevoStockProductoEd = stockActualProductoEd - diferenciaStock;

                    // Actualizar el stock del producto
                    productoDAOEditar.actualizarStock(idProductoEditar, nuevoStockProductoEd);

                    // Actualizar el total del ingreso
                    IngresoDAO ingresoDAO = new IngresoDAO();
                    double nuevoTotal = detalleIngresoDAO.calcularNuevoTotal(idIngreso);
                    ingresoDAO.actualizarTotal(idIngreso, nuevoTotal);

                    response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&mensaje=Detalle+de+ingreso+actualizado+correctamente");
                } else {
                    response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&error=Error+al+actualizar+el+detalle+de+ingreso");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("ControladorDetalleIngreso?Op=Listar&idIngreso=" + idIngreso + "&error=Error+en+los+datos+ingresados");
            }
            break;

            default:
                List<DetalleIngreso> listaDetalleIngresos = detalleIngresoDAO.listarPorIdIngreso(idIngreso);
                request.setAttribute("ListaDetalleIngresos", listaDetalleIngresos);
                request.getRequestDispatcher("DetalleIngreso.jsp").forward(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
