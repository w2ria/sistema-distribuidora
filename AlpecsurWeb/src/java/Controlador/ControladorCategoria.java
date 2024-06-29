package Controlador;

import Modelo.Categoria;
import Modelo.CategoriaDAO;
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
public class ControladorCategoria extends HttpServlet {

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
        CategoriaDAO categoriaDAO = new CategoriaDAO();

        switch (opcion) {
            case "Listar":
                List<Categoria> listaCategorias = categoriaDAO.listar();
                request.setAttribute("ListaCategorias", listaCategorias);
                request.getRequestDispatcher("Categoria.jsp").forward(request, response);
                break;

            case "Eliminar":
                ProductoDAO productoDAO = new ProductoDAO();
                CategoriaDAO categoriaDAOEliminar = new CategoriaDAO();
                String idCategoriaEliminarStr = request.getParameter("idCategoria");

                if (idCategoriaEliminarStr != null && !idCategoriaEliminarStr.isEmpty()) {
                    try {
                        int idCategoriaAEliminar = Integer.parseInt(idCategoriaEliminarStr);
                        int productosRelacionados = productoDAO.contarProductosPorCategoria(idCategoriaAEliminar);
                        if (productosRelacionados > 0) {
                            response.sendRedirect("ControladorCategoria?Op=Listar&error=Esta+categoria+se+relaciona+con+" + productosRelacionados + "+producto(s),+no+se+eliminara+hasta+que+se+eliminen+todos+los+productos+pertenecientes+a+la+categoria.");
                        } else {
                            try {
                                categoriaDAOEliminar.eliminar(idCategoriaAEliminar);
                                response.sendRedirect("ControladorCategoria?Op=Listar&mensaje=Categoria+eliminada+correctamente");
                            } catch (Exception e) {
                                response.sendRedirect("ControladorCategoria?Op=Listar&error=Hubo+un+error+al+eliminar+la+categoria");
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("ControladorCategoria?Op=Listar&error=Hubo+un+error+al+eliminar+la+categoria");
                    }
                } else {
                    response.sendRedirect("ControladorCategoria?Op=Listar&error=No+se+proporciono+un+id+de+categoria");
                }
                break;

            case "Buscar":
                String nombreBuscar = request.getParameter("nombre");
                List<Categoria> categoriasEncontradas = categoriaDAO.buscarPorNombre(nombreBuscar);
                request.setAttribute("ListaCategorias", categoriasEncontradas);
                request.getRequestDispatcher("Categoria.jsp").forward(request, response);
                break;

            default:
                listaCategorias = categoriaDAO.listar();
                request.setAttribute("ListaCategorias", listaCategorias);
                request.getRequestDispatcher("Categoria.jsp").forward(request, response);
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
        CategoriaDAO categoriaDAO = new CategoriaDAO();

        switch (accion) {
            case "Agregar":
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");

                Categoria nuevaCategoria = new Categoria();
                nuevaCategoria.setNombre(nombre);
                nuevaCategoria.setDescripcion(descripcion);

                int resultadoAgregar = categoriaDAO.agregar(nuevaCategoria);
                if (resultadoAgregar >= 0) {
                    response.sendRedirect("ControladorCategoria?Op=Listar&mensaje=Categoria+agregada+correctamente");
                } else {
                    response.sendRedirect("ControladorCategoria?Op=Listar&mensaje=Error+al+agregar+la+categoria");
                }
                break;

            case "Editar":
                int idCategoriaEditar = Integer.parseInt(request.getParameter("idCategoria"));
                String nombreEditar = request.getParameter("nombre");
                String descripcionEditar = request.getParameter("descripcion");

                Categoria categoriaEditar = new Categoria();
                categoriaEditar.setIdCategoria(idCategoriaEditar);
                categoriaEditar.setNombre(nombreEditar);
                categoriaEditar.setDescripcion(descripcionEditar);

                int resultadoActualizacion = categoriaDAO.actualizar(categoriaEditar);

                if (resultadoActualizacion >= 0) {
                    response.sendRedirect("ControladorCategoria?Op=Listar&mensaje=Categoria+actualizada+correctamente");
                } else {
                    response.sendRedirect("ControladorCategoria?Op=Listar&mensaje=Error+al+actualizar+la+categoria");
                }
                break;

            default:
                // Manejo para otras acciones desconocidas o no implementadas
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
