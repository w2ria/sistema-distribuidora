package Controlador;

import Modelo.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "controlador", urlPatterns = {"/controlador"})
public class controlador extends HttpServlet {

    ProductoCarritoDAO pdao = new ProductoCarritoDAO();
    ProductoDAO productoDAO = new ProductoDAO();
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    MarcaDAO marcaDAO = new MarcaDAO();
    Producto p = new Producto();
    List<Producto> productos;

    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        productos = productoDAO.listarConStock();
        List<Categoria> listaCategorias = categoriaDAO.listar();
        List<Marca> listaMarcas = marcaDAO.listar();

        request.setAttribute("listaCategorias", listaCategorias);
        request.setAttribute("listaMarcas", listaMarcas);

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
            case "FiltrarCategoria":
                filtrarCategoria(request, response);
                break;
            case "FiltrarMarca":
                filtrarMarca(request, response);
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
        int idp = Integer.parseInt(request.getParameter("idProducto"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        // Verificar stock disponible
        int stockDisponible = productoDAO.obtenerStock(idp);
        if (cantidad > stockDisponible) {
            cantidad = stockDisponible;
        }

        p = productoDAO.listarId(idp); // Se cambió de pdao a productoDAO
        if (listaCarrito.size() > 0) {
            for (int i = 0; i < listaCarrito.size(); i++) {
                if (idp == listaCarrito.get(i).getIdProducto()) {
                    pos = i;
                }
            }
            if (idp == listaCarrito.get(pos).getIdProducto()) {
                cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                if (cantidad > stockDisponible) {
                    cantidad = stockDisponible;
                }
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
                cart.setImagen(p.getImagen()); // Asegurarse de que la imagen se establece en el carrito
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
            cart.setImagen(p.getImagen()); // Asegurarse de que la imagen se establece en el carrito
            cart.setPrecio(p.getPrecio());
            cart.setCantidad(cantidad);
            cart.setSubTotal(cantidad * p.getPrecio());
            listaCarrito.add(cart);
        }

        request.getSession().setAttribute("contadorCarrito", listaCarrito.size());
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

        // Verificar stock disponible
        int stockDisponible = productoDAO.obtenerStock(idpro);
        if (cant > stockDisponible) {
            cant = stockDisponible;
        }

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
        empleado.setIdEmpleado(1);
        Pago pago = new Pago();
        pago.setMonto(totalPagar);

        dao.generarPago(pago);

        Pedido pedido = new Pedido();
        pedido.setIdCliente(cliente.getIdCliente());
        pedido.setIdEmpleado(empleado.getIdEmpleado());
        pedido.setIdPago(pago.getIdPago());
        pedido.setTipoComprobante("Pago Por Tarjeta");

        // Obtener el último número de comprobante y aumentarlo
        String ultimoComprobante = dao.obtenerUltimoNumeroComprobante();
        String nuevoComprobante = incrementarNumeroComprobante(ultimoComprobante);
        pedido.setNumComprobante(nuevoComprobante);

        pedido.setFecha(Date.valueOf(LocalDate.now()).toString());
        pedido.setTotal(totalPagar);
        pedido.setIdEstadoPedido(1);
        pedido.setDetallePedido(listaCarrito);

        int res = dao.generarPedido(pedido);

        if (res != 0 && totalPagar > 0) {
            // Actualizar el stock de cada producto
            for (Carrito item : listaCarrito) {
                int idProducto = item.getIdProducto();
                int cantidadComprada = item.getCantidad();
                int stockActual = productoDAO.obtenerStock(idProducto);
                int nuevoStock = stockActual - cantidadComprada;
                productoDAO.actualizarStock(idProducto, nuevoStock);
            }
            listaCarrito.clear();
            totalPagar = 0.0;
            response.sendRedirect("index.jsp?mensaje=compraExitosa");
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

    private void filtrarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoria = request.getParameter("categoria");
        productos = pdao.listarPorCategoria(categoria);
        request.setAttribute("productos", productos);
        request.getRequestDispatcher("productosCarrito.jsp").forward(request, response);
    }

    private void filtrarMarca(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String marca = request.getParameter("marca");
        productos = pdao.listarPorMarca(marca);
        request.setAttribute("productos", productos);
        request.getRequestDispatcher("productosCarrito.jsp").forward(request, response);
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
