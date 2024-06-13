package Controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
