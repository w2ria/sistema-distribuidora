package Controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Pedido;
import Modelo.Cliente;
import Modelo.ClienteDAO;
import Modelo.DetallesPedido;
import Modelo.DetallesPedidoDAO;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.EstadoPedido;
import Modelo.EstadoPedidoDAO;
import Modelo.Pago;
import Modelo.PagoDAO;
import Modelo.PedidoDAO;
import Modelo.ProductoDAO;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class ControladorPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("Op");
        PedidoDAO pedidoDAO = new PedidoDAO();
        ClienteDAO clienteDAO = new ClienteDAO();
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        EstadoPedidoDAO estadoPedidoDAO = new EstadoPedidoDAO();

        switch (op) {
            case "Listar":
                List<Pedido> listaPedidos = pedidoDAO.listar();
                List<Cliente> listaClientes = clienteDAO.listar();
                List<Empleado> listaEmpleados = empleadoDAO.listar();
                List<EstadoPedido> listaEstados = estadoPedidoDAO.listar();

                Map<Integer, Cliente> mapaClientes = new HashMap<>();
                for (Cliente cliente : listaClientes) {
                    mapaClientes.put(cliente.getIdCliente(), cliente);
                }

                Map<Integer, Empleado> mapaEmpleados = new HashMap<>();
                for (Empleado empleado : listaEmpleados) {
                    mapaEmpleados.put(empleado.getIdEmpleado(), empleado);
                }

                Map<Integer, EstadoPedido> mapaEstados = new HashMap<>();
                for (EstadoPedido estado : listaEstados) {
                    mapaEstados.put(estado.getIdEstadoPedido(), estado);
                }

                request.setAttribute("listaPedidos", listaPedidos);
                request.setAttribute("mapaClientes", mapaClientes);
                request.setAttribute("mapaEmpleados", mapaEmpleados);
                request.setAttribute("mapaEstados", mapaEstados);

                request.getRequestDispatcher("Pedido.jsp").forward(request, response);

                break;

            case "ContarDetalles":
                DetallesPedidoDAO detallePedidoDAOcontar = new DetallesPedidoDAO();
                String idPedidoParam = request.getParameter("idPedido");
                if (idPedidoParam != null && !idPedidoParam.isEmpty()) {
                    int idPedido = Integer.parseInt(idPedidoParam);
                    int detallesRelacionados = detallePedidoDAOcontar.contarDetallesConIdPedido(idPedido);

                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    out.print("{\"detallePedidoCount\":" + detallesRelacionados + "}");
                    out.flush();
                } else {
                    // Manejo de la situación en la que idPedido es null o está vacío
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro idPedido es nulo o está vacío");
                }
                break;

            default:
                listaPedidos = pedidoDAO.listar();
                listaClientes = clienteDAO.listar();
                listaEmpleados = empleadoDAO.listar();
                listaEstados = estadoPedidoDAO.listar();

                mapaClientes = new HashMap<>();
                for (Cliente cliente : listaClientes) {
                    mapaClientes.put(cliente.getIdCliente(), cliente);
                }

                mapaEmpleados = new HashMap<>();
                for (Empleado empleado : listaEmpleados) {
                    mapaEmpleados.put(empleado.getIdEmpleado(), empleado);
                }

                mapaEstados = new HashMap<>();
                for (EstadoPedido estado : listaEstados) {
                    mapaEstados.put(estado.getIdEstadoPedido(), estado);
                }

                request.setAttribute("listaPedidos", listaPedidos);
                request.setAttribute("mapaClientes", mapaClientes);
                request.setAttribute("mapaEmpleados", mapaEmpleados);
                request.setAttribute("mapaEstados", mapaEstados);

                request.getRequestDispatcher("Pedido.jsp").forward(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String accion = request.getParameter("accion");
        PedidoDAO pedidoDAO = new PedidoDAO();

        switch (accion) {
            case "Agregar":
                Pedido nuevoPedido = new Pedido();
                Pago nuevoPago = new Pago();

                int idClienteAgregar = Integer.parseInt(request.getParameter("cliente"));
                int idEmpleadoAgregar = Integer.parseInt(request.getParameter("empleado"));
                String tipoComprobanteAgregar = request.getParameter("tipoComprobante");
                String ultimoNumeroComprobante = pedidoDAO.obtenerUltimoNumeroComprobante();
                String numComprobanteAgregar = nuevoPedido.generarNuevoNumeroComprobante(ultimoNumeroComprobante);
                String fechaAgregar = request.getParameter("fecha");
                double totalAgregar = Double.parseDouble(request.getParameter("total"));
                int idEstadoAgregar = Integer.parseInt(request.getParameter("estado"));

                // Generar el pago
                nuevoPago.setMonto(totalAgregar);
                pedidoDAO.generarPago(nuevoPago);

                // Configurar el nuevo pedido
                nuevoPedido.setIdCliente(idClienteAgregar);
                if (idEmpleadoAgregar != 0) { // Verifica si se seleccionó un empleado (0 es el valor por defecto)
                    nuevoPedido.setIdEmpleado(idEmpleadoAgregar);
                }
                nuevoPedido.setIdPago(nuevoPago.getIdPago()); // Usar el ID de pago generado
                nuevoPedido.setTipoComprobante(tipoComprobanteAgregar);
                nuevoPedido.setNumComprobante(numComprobanteAgregar);
                nuevoPedido.setFecha(fechaAgregar);
                nuevoPedido.setTotal(totalAgregar);
                nuevoPedido.setIdEstadoPedido(idEstadoAgregar);

                int resultadoAgregar = pedidoDAO.agregar(nuevoPedido);

                if (resultadoAgregar > 0) {
                    response.sendRedirect("ControladorPedido?Op=Listar&mensaje=Pedido+agregado+correctamente");
                } else {
                    response.sendRedirect("ControladorPedido?Op=Listar&error=Error+al+agregar+el+pedido");
                }
                break;

            case "Editar":
                int idPedidoEditar = Integer.parseInt(request.getParameter("idPedido"));
                int idClienteEditar = Integer.parseInt(request.getParameter("cliente"));
                int idEmpleadoEditar = Integer.parseInt(request.getParameter("empleado"));
                String tipoComprobanteEditar = request.getParameter("tipoComprobante");
                String numComprobanteEditar = request.getParameter("numComprobante");
                String fechaEditar = request.getParameter("fecha");
                double totalEditar = Double.parseDouble(request.getParameter("total"));
                int idEstadoEditar = Integer.parseInt(request.getParameter("estado"));

                PagoDAO pagoDAO = new PagoDAO();
                int idPagoEditar = pagoDAO.obtenerIdPagoPorIdPedido(idPedidoEditar);

                Pedido pedidoEditar = new Pedido();
                pedidoEditar.setIdPedido(idPedidoEditar);
                pedidoEditar.setIdCliente(idClienteEditar);
                if (idEmpleadoEditar != 0) {
                    pedidoEditar.setIdEmpleado(idEmpleadoEditar);
                }
                pedidoEditar.setIdPago(idPagoEditar);
                pedidoEditar.setTipoComprobante(tipoComprobanteEditar);
                pedidoEditar.setNumComprobante(numComprobanteEditar);
                pedidoEditar.setFecha(fechaEditar);
                pedidoEditar.setTotal(totalEditar);
                pedidoEditar.setIdEstadoPedido(idEstadoEditar);

                PedidoDAO pedidoDAOEditar = new PedidoDAO();
                int resultadoEditar = pedidoDAOEditar.actualizar(pedidoEditar);

                if (resultadoEditar > 0) {
                    Pago pagoEditar = pagoDAO.buscarPorId(idPagoEditar);
                    pagoEditar.setMonto(totalEditar);
                    int pagoActualizado = pagoDAO.actualizar(pagoEditar);

                    if (pagoActualizado > 0) {
                        response.sendRedirect("ControladorPedido?Op=Listar&mensaje=Pedido+actualizado+correctamente");
                    } else {
                        response.sendRedirect("ControladorPedido?Op=Listar&error=Error+al+actualizar+el+pago");
                    }
                } else {
                    response.sendRedirect("ControladorPedido?Op=Listar&error=Error+al+actualizar+el+pedido");
                }
                break;

            case "Eliminar":
                DetallesPedidoDAO detallePedidoDAO = new DetallesPedidoDAO();
                String idPedidoEliminarStr = request.getParameter("idPedido");

                if (idPedidoEliminarStr != null && !idPedidoEliminarStr.isEmpty()) {
                    try {
                        int idPedidoAEliminar = Integer.parseInt(idPedidoEliminarStr);
                        int detallesRelacionados = detallePedidoDAO.contarDetallesConIdPedido(idPedidoAEliminar);

                        if (detallesRelacionados > 0) {
                            ProductoDAO productoDAOEliminar = new ProductoDAO();
                            List<DetallesPedido> detallesPedido = detallePedidoDAO.listarTodoPorIdPedido(idPedidoAEliminar);
                            for (DetallesPedido detalle : detallesPedido) {
                                int idProducto = detalle.getIdProducto();
                                int cantidad = detalle.getCantidad();
                                int stockActual = productoDAOEliminar.obtenerStock(idProducto);
                                int nuevoStock = stockActual + cantidad;
                                productoDAOEliminar.actualizarStock(idProducto, nuevoStock);
                            }
                            // Eliminar primero los detalles relacionados
                            boolean eliminacionDetallesExitosa = detallePedidoDAO.eliminarDetallesPorIdPedido(idPedidoAEliminar);
                            if (eliminacionDetallesExitosa) {
                                // Luego de eliminar los detalles, eliminar el pedido principal
                                boolean eliminacionExitosa = pedidoDAO.eliminar(idPedidoAEliminar);
                                if (eliminacionExitosa) {
                                    response.sendRedirect("ControladorPedido?Op=Listar&mensaje=Pedido+y+detalles+eliminados+correctamente");
                                } else {
                                    response.sendRedirect("ControladorPedido?Op=Listar&error=Hubo+un+error+al+eliminar+el+pedido");
                                }
                            } else {
                                response.sendRedirect("ControladorPedido?Op=Listar&error=Hubo+un+error+al+eliminar+los+detalles");
                            }
                        } else {
                            // No hay detalles relacionados, eliminar directamente el pedido
                            boolean eliminacionExitosa = pedidoDAO.eliminar(idPedidoAEliminar);
                            if (eliminacionExitosa) {
                                response.sendRedirect("ControladorPedido?Op=Listar&mensaje=Pedido+eliminado+correctamente");
                            } else {
                                response.sendRedirect("ControladorPedido?Op=Listar&error=Hubo+un+error+al+eliminar+el+pedido");
                            }
                        }
                    } catch (NumberFormatException e) {
                        // Captura la excepción si no se puede convertir idPedidoEliminarStr a un entero
                        response.sendRedirect("ControladorPedido?Op=Listar&error=El+id+de+pedido+no+es+válido");
                    } catch (Exception e) {
                        // Captura otras excepciones inesperadas
                        e.printStackTrace();
                        response.sendRedirect("ControladorPedido?Op=Listar&error=Hubo+un+error+al+eliminar+el+pedido");
                    }
                } else {
                    response.sendRedirect("ControladorPedido?Op=Listar&error=No+se+proporciono+un+id+de+pedido");
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
