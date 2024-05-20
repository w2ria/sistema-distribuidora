package Controlador;

import Modelo.Proveedor;
import Modelo.ProveedorDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maria
 */
public class ControladorProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        ProveedorDAO proveedorDAO = new ProveedorDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        switch (opcion) {
            case "Listar":
                List<Proveedor> listaProveedores = proveedorDAO.listar();
                request.setAttribute("ListaProveedores", listaProveedores);
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idProveedorEliminarStr = request.getParameter("idProveedor");
                if (idProveedorEliminarStr != null && !idProveedorEliminarStr.isEmpty()) {
                    int idProveedorAEliminar = Integer.parseInt(idProveedorEliminarStr);
                    boolean eliminacionExitosa = proveedorDAO.eliminar(idProveedorAEliminar);
                    if (eliminacionExitosa) {
                        response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Proveedor+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorProveedor?Op=Listar&error=Hubo+un+error+al+eliminar+el+proveedor");
                    }
                } else {
                    response.sendRedirect("ControladorProveedor?Op=Listar&error=Hubo+un+error+al+eliminar+el+proveedor");
                }
                break;

            default:
                listaProveedores = proveedorDAO.listar();
                request.setAttribute("ListaProveedores", listaProveedores);
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        ProveedorDAO proveedorDAO = new ProveedorDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Proveedor prov = new Proveedor();

        switch (accion) {
            case "Agregar":
                String nombre = request.getParameter("nombre");
                String tipoDocumento = request.getParameter("tipoDocumento");
                String numDocumento = request.getParameter("numDocumento");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                String email = request.getParameter("email");

                String nombreUsuario = usuarioDAO.generarNuevoNombreUsuarioProveedor(usuarioDAO.obtenerUltimoNumeroUsuario());

                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setUsuario(nombreUsuario);
                nuevoUsuario.setExpiracion(new Timestamp(System.currentTimeMillis()));

                int idUsuario = usuarioDAO.agregarUsuarioProveedor(nuevoUsuario);

                if (idUsuario > 0) {
                    // Validar si el usuario fue insertado correctamente
                    if (usuarioDAO.existeUsuario(idUsuario)) {
                        Proveedor nuevoProveedor = new Proveedor();
                        nuevoProveedor.setIdUsuario(idUsuario);
                        nuevoProveedor.setNombre(nombre);
                        nuevoProveedor.setTipoDocumento(tipoDocumento);
                        nuevoProveedor.setNumDocumento(numDocumento);
                        nuevoProveedor.setDireccion(direccion);
                        nuevoProveedor.setTelefono(telefono);
                        nuevoProveedor.setEmail(email);

                        int resultado = proveedorDAO.agregar(nuevoProveedor);
                        if (resultado > 0) {
                            response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Proveedor agregado correctamente");
                        } else {
                            response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Proveedor agregado correctamente");
                        }
                    } else {
                        response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Error al agregar el proveedor");
                    }
                } else {
                    response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Error al agregar el proveedor");
                }
                break;

            case "Editar":
                int idProveedorEditar = Integer.parseInt(request.getParameter("idProveedor"));
                String nombreEditar = request.getParameter("nombre");
                String tipoDocumentoEditar = request.getParameter("tipoDocumento");
                String numDocumentoEditar = request.getParameter("numDocumento");
                String direccionEditar = request.getParameter("direccion");
                String telefonoEditar = request.getParameter("telefono");
                String emailEditar = request.getParameter("email");

                Proveedor proveedorEditar = new Proveedor();
                proveedorEditar.setIdProveedor(idProveedorEditar);
                proveedorEditar.setNombre(nombreEditar);
                proveedorEditar.setTipoDocumento(tipoDocumentoEditar);
                proveedorEditar.setNumDocumento(numDocumentoEditar);
                proveedorEditar.setDireccion(direccionEditar);
                proveedorEditar.setTelefono(telefonoEditar);
                proveedorEditar.setEmail(emailEditar);

                int resultadoActualizacion = proveedorDAO.actualizar(proveedorEditar);

                if (resultadoActualizacion > 0) {
                    // Redireccionar a la misma página con un mensaje de éxito
                    response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Proveedor actualizado correctamente");
                } else if (resultadoActualizacion == 0) {
                    // Redireccionar a la misma página con un mensaje de error
                    response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Proveedor actualizado correctamente");
                } else {
                    // Redireccionar a la misma página con un mensaje de error
                    response.sendRedirect("ControladorProveedor?Op=Listar&mensaje=Error al actualizar el proveedor");
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
