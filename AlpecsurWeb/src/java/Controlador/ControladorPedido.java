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
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.EstadoPedido;
import Modelo.EstadoPedidoDAO;
import Modelo.Pago;
import Modelo.PedidoDAO;
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

            default:

                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
