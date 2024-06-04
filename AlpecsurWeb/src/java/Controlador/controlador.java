package Controlador;

import Modelo.*;
import Modelo.ProductoCarritoDAO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class controlador extends HttpServlet {

    ProductoCarritoDAO pdao = new ProductoCarritoDAO();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList<>();

    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        productos = pdao.listar();
        switch (accion) {
            case "AgregarCarrito":
                agregarCarrito(request, response);
                break;
            case "Delete":
                eliminarProducto(request, response);
                break;
            case "ActualizarCantidad":
                actualizarCantidad(request, response);
                break;
            case "Carrito":
                mostrarCarrito(request, response);
                break;
            case "GenerarPedido":
                generarPedido(request, response);
                break;
            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("productosCarrito.jsp").forward(request, response);
                break;
        }
    }

    private void agregarCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");

        if (usuario == null || cliente == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int pos = 0;
        cantidad = 1;
        int idp = Integer.parseInt(request.getParameter("idProducto"));
        p = pdao.listarId(idp);
        if (listaCarrito.size() > 0) {
            for (int i = 0; i < listaCarrito.size(); i++) {
                if (idp == listaCarrito.get(i).getIdProducto()) {
                    pos = i;
                }
            }
            if (idp == listaCarrito.get(pos).getIdProducto()) {
                cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                double subtotal = listaCarrito.get(pos).getPrecio() * cantidad;
                listaCarrito.get(pos).setCantidad(cantidad);
                listaCarrito.get(pos).setSubTotal(subtotal);
            } else {
                item = item + 1;
                Carrito cart = new Carrito();
                cart.setItem(item);
                cart.setIdProducto(p.getIdProducto());
                cart.setNombre(p.getNombre());
                cart.setDescripcion(p.getDescripcion());
                cart.setPrecio(p.getPrecio());
                cart.setCantidad(cantidad);
                cart.setSubTotal(cantidad * p.getPrecio());
                listaCarrito.add(cart);
            }
        } else {
            item = item + 1;
            Carrito cart = new Carrito();
            cart.setItem(item);
            cart.setIdProducto(p.getIdProducto());
            cart.setNombre(p.getNombre());
            cart.setDescripcion(p.getDescripcion());
            cart.setPrecio(p.getPrecio());
            cart.setCantidad(cantidad);
            cart.setSubTotal(cantidad * p.getPrecio());
            listaCarrito.add(cart);
        }

        request.setAttribute("cont", listaCarrito.size());
        request.getRequestDispatcher("controlador?accion=productos").forward(request, response);
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");

        if (usuario == null || cliente == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int idproducto = Integer.parseInt(request.getParameter("idp"));
        for (int i = 0; i < listaCarrito.size(); i++) {
            if (listaCarrito.get(i).getIdProducto() == idproducto) {
                listaCarrito.remove(i);
            }
        }
        mostrarCarrito(request, response);
    }

    private void actualizarCantidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");

        if (usuario == null || cliente == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int idpro = Integer.parseInt(request.getParameter("idp"));
        int cant = Integer.parseInt(request.getParameter("Cantidad"));
        for (int i = 0; i < listaCarrito.size(); i++) {
            if (listaCarrito.get(i).getIdProducto() == idpro) {
                listaCarrito.get(i).setCantidad(cant);
                double st = listaCarrito.get(i).getPrecio() * cant;
                listaCarrito.get(i).setSubTotal(st);
            }
        }
        mostrarCarrito(request, response);
    }

    private void mostrarCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");

        if (usuario == null || cliente == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        totalPagar = 0.0;
        request.setAttribute("carrito", listaCarrito);
        for (int i = 0; i < listaCarrito.size(); i++) {
            totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
        }
        request.setAttribute("totalPagar", totalPagar);
        request.getRequestDispatcher("carrito.jsp").forward(request, response);
    }

    private void generarPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");

        if (usuario == null || cliente == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        PedidoDAO dao = new PedidoDAO();
        Empleado empleado = new Empleado();
        empleado.setIdEmpleado(1); // ID de empleado ficticio
        Pago pago = new Pago();
        pago.setMonto(totalPagar);

        dao.generarPago(pago); // Asegúrate de que esto esté implementado correctamente en PedidoDAO

        Pedido pedido = new Pedido();
        pedido.setIdCliente(cliente.getIdCliente());
        pedido.setIdEmpleado(empleado.getIdEmpleado());
        pedido.setIdPago(pago.getIdPago());
        pedido.setTipoComprobante("Factura");

        // Obtener el último número de comprobante y aumentarlo
        String ultimoComprobante = dao.obtenerUltimoNumeroComprobante();
        String nuevoComprobante = incrementarNumeroComprobante(ultimoComprobante);
        pedido.setNumComprobante(nuevoComprobante);

        pedido.setFecha(Date.valueOf(LocalDate.now()).toString()); // Fecha actual
        pedido.setTotal(totalPagar);
        pedido.setIdEstadoPedido(1); // Estado inicial del pedido
        pedido.setDetallePedido(listaCarrito); // Agregar los detalles del pedido

        int res = dao.generarPedido(pedido);

        if (res != 0 && totalPagar > 0) {
            listaCarrito.clear();
            totalPagar = 0.0;
            request.setAttribute("mensaje", "Compra finalizada!");
            request.getRequestDispatcher("carrito.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Error en la compra!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private String incrementarNumeroComprobante(String ultimoComprobante) {
        String[] partes = ultimoComprobante.split("-");
        int numero = Integer.parseInt(partes[1]) + 1;
        return String.format("%s-%08d", partes[0], numero);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
