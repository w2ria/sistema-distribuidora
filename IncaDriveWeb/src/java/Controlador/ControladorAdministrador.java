
package Controlador;

import Modelo.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorAdministrador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        AdministradorDAO administradorDAO = new AdministradorDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<Administrador> listaAdministradores = null;

        switch (opcion) {
            case "Listar":
                listaAdministradores = administradorDAO.listar();
                request.setAttribute("ListaAdministradores", listaAdministradores);
                request.getRequestDispatcher("Administrador.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idAdministradorEliminarStr = request.getParameter("idAdministrador");
                if (idAdministradorEliminarStr != null && !idAdministradorEliminarStr.isEmpty()) {
                    int idAdministradorAEliminar = Integer.parseInt(idAdministradorEliminarStr);
                    boolean eliminacionExitosa = administradorDAO.eliminar(idAdministradorAEliminar);
                    if (eliminacionExitosa) {
                        response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Administrador+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorAdministrador?Op=Listar&error=Hubo+un+error+al+eliminar+el+administrador");
                    }
                } else {
                    response.sendRedirect("ControladorAdministrador?Op=Listar&error=Hubo+un+error+al+eliminar+el+administrador");
                }
                break;

            case "Buscar":
                String nombreBuscar = request.getParameter("nombre");
                listaAdministradores = administradorDAO.buscarPorNombre(nombreBuscar);
                request.setAttribute("ListaAdministradores", listaAdministradores);
                request.getRequestDispatcher("Administrador.jsp").forward(request, response);
                break;

            default:
                listaAdministradores = administradorDAO.listar();
                request.setAttribute("ListaAdministradores", listaAdministradores);
                request.getRequestDispatcher("Administrador.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        AdministradorDAO administradorDAO = new AdministradorDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        switch (accion) {
            case "Agregar":
                String usuario = request.getParameter("usuario");
                String clave = request.getParameter("clave");
                String nombre = request.getParameter("nombre");
                String tipoDocumento = request.getParameter("tipoDocumento");
                String numDocumento = request.getParameter("numDocumento");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                String email = request.getParameter("email");

                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setUsuario(usuario);
                nuevoUsuario.setClave(clave);
                nuevoUsuario.setExpiracion(new Timestamp(System.currentTimeMillis()));

                int idUsuario = usuarioDAO.agregar(nuevoUsuario);

                if (idUsuario > 0) {
                    // Validar si el usuario fue insertado correctamente
                    if (usuarioDAO.existeUsuario(idUsuario)) {
                        Administrador nuevoAdministrador = new Administrador();
                        nuevoAdministrador.setIdUsuario(idUsuario);
                        nuevoAdministrador.setNombre(nombre);
                        nuevoAdministrador.setTipoDocumento(tipoDocumento);
                        nuevoAdministrador.setNumDocumento(numDocumento);
                        nuevoAdministrador.setDireccion(direccion);
                        nuevoAdministrador.setTelefono(telefono);
                        nuevoAdministrador.setEmail(email);

                        int resultado = administradorDAO.agregar(nuevoAdministrador);
                        if (resultado > 0) {
                            response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Administrador+agregado+correctamente");
                        } else {
                            response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Administrador+agregado+correctamente");
                        }
                    } else {
                        response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Error+al+agregar+el+administrador");
                    }
                } else {
                    response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Error+al+agregar+el+administrador");
                }
                break;

            case "Editar":
                int idAdministradorEditar = Integer.parseInt(request.getParameter("idAdministrador"));
                String nombreEditar = request.getParameter("nombre");
                String tipoDocumentoEditar = request.getParameter("tipoDocumento");
                String numDocumentoEditar = request.getParameter("numDocumento");
                String direccionEditar = request.getParameter("direccion");
                String telefonoEditar = request.getParameter("telefono");
                String emailEditar = request.getParameter("email");

                Administrador administradorEditar = new Administrador();
                administradorEditar.setIdAdministrador(idAdministradorEditar);
                administradorEditar.setNombre(nombreEditar);
                administradorEditar.setTipoDocumento(tipoDocumentoEditar);
                administradorEditar.setNumDocumento(numDocumentoEditar);
                administradorEditar.setDireccion(direccionEditar);
                administradorEditar.setTelefono(telefonoEditar);
                administradorEditar.setEmail(emailEditar);

                int resultadoActualizacion = administradorDAO.actualizar(administradorEditar);

                if (resultadoActualizacion > 0) {
                    response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Administrador+actualizado+correctamente");
                } else if (resultadoActualizacion == 0) {
                    response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Administrador+actualizado+correctamente");
                } else {
                    response.sendRedirect("ControladorAdministrador?Op=Listar&mensaje=Error+al+actualizar+el+administrador");
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
    }
}
