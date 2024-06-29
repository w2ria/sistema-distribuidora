package Controlador;

import Modelo.Marca;
import Modelo.MarcaDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maria
 */
public class ControladorMarca extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        MarcaDAO marcaDAO = new MarcaDAO();

        switch (opcion) {
            case "Listar":
                List<Marca> listaMarcas = marcaDAO.listar();
                request.setAttribute("ListaMarcas", listaMarcas);
                request.getRequestDispatcher("Marca.jsp").forward(request, response);
                break;

            case "Eliminar":
                ProductoDAO productoDAO = new ProductoDAO();
                MarcaDAO marcaDAOEliminar = new MarcaDAO();
                String idMarcaEliminarStr = request.getParameter("idMarca");

                if (idMarcaEliminarStr != null && !idMarcaEliminarStr.isEmpty()) {
                    try {
                        int idMarcaAEliminar = Integer.parseInt(idMarcaEliminarStr);
                        int productosRelacionados = productoDAO.contarProductosPorMarca(idMarcaAEliminar);
                        if (productosRelacionados > 0) {
                            response.sendRedirect("ControladorMarca?Op=Listar&error=Esta+marca+se+relaciona+con+" + productosRelacionados + "+producto(s),+no+se+eliminara+hasta+que+se+eliminen+todos+los+productos+pertenecientes+a+la+marca.");
                        } else {
                            try {
                                marcaDAOEliminar.eliminar(idMarcaAEliminar);
                                response.sendRedirect("ControladorMarca?Op=Listar&mensaje=Marca+eliminada+correctamente");
                            } catch (Exception e) {
                                response.sendRedirect("ControladorMarca?Op=Listar&error=Hubo+un+error+al+eliminar+la+marca");
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("ControladorMarca?Op=Listar&error=Hubo+un+error+al+eliminar+la+marca");
                    }
                } else {
                    response.sendRedirect("ControladorMarca?Op=Listar&error=No+se+proporcionó+un+id+de+marca");
                }
                break;

            case "Buscar":
                String nombreBuscar = request.getParameter("nombre");
                List<Marca> marcasEncontradas = marcaDAO.buscarPorNombre(nombreBuscar);
                request.setAttribute("ListaMarcas", marcasEncontradas);
                request.getRequestDispatcher("Marca.jsp").forward(request, response);
                break;

            default:
                listaMarcas = marcaDAO.listar();
                request.setAttribute("ListaMarcas", listaMarcas);
                request.getRequestDispatcher("Marca.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        String accion = request.getParameter("accion");
        MarcaDAO marcaDAO = new MarcaDAO();

        switch (accion) {
            case "Agregar":
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");

                Marca nuevaMarca = new Marca();
                nuevaMarca.setNombre(nombre);
                nuevaMarca.setDescripcion(descripcion);

                int resultadoAgregar = marcaDAO.agregar(nuevaMarca);
                if (resultadoAgregar >= 0) {
                    response.sendRedirect("ControladorMarca?Op=Listar&mensaje=Marca+agregada+correctamente");
                } else {
                    response.sendRedirect("ControladorMarca?Op=Listar&mensaje=Error+al+agregar+la+marca");
                }
                break;

            case "Editar":
                int idMarcaEditar = Integer.parseInt(request.getParameter("idMarca"));
                String nombreEditar = request.getParameter("nombre");
                String descripcionEditar = request.getParameter("descripcion");

                Marca marcaEditar = new Marca();
                marcaEditar.setIdMarca(idMarcaEditar);
                marcaEditar.setNombre(nombreEditar);
                marcaEditar.setDescripcion(descripcionEditar);

                int resultadoActualizacion = marcaDAO.actualizar(marcaEditar);

                if (resultadoActualizacion >= 0) {
                    response.sendRedirect("ControladorMarca?Op=Listar&mensaje=Marca+actualizada+correctamente");
                } else {
                    response.sendRedirect("ControladorMarca?Op=Listar&mensaje=Error+al+actualizar+la+marca");
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
