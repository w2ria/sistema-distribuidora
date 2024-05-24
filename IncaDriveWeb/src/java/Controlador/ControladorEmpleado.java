
package Controlador;

import Modelo.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        switch (opcion) {
            case "Listar":
                List<Empleado> listaEmpleados = empleadoDAO.listar();
                request.setAttribute("ListaEmpleados", listaEmpleados);
                request.getRequestDispatcher("Empleado.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idEmpleadoEliminarStr = request.getParameter("idEmpleado");
                if (idEmpleadoEliminarStr != null && !idEmpleadoEliminarStr.isEmpty()) {
                    int idEmpleadoAEliminar = Integer.parseInt(idEmpleadoEliminarStr);
                    boolean eliminacionExitosa = empleadoDAO.eliminar(idEmpleadoAEliminar);
                    if (eliminacionExitosa) {
                        response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Empleado+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorEmpleado?Op=Listar&error=Hubo+un+error+al+eliminar+el+empleado");
                    }
                } else {
                    response.sendRedirect("ControladorEmpleado?Op=Listar&error=Hubo+un+error+al+eliminar+el+empleado");
                }
                break;

            case "Buscar":
                String nombreBuscar = request.getParameter("nombre");
                List<Empleado> empleadosEncontrados = empleadoDAO.buscarPorNombre(nombreBuscar);
                request.setAttribute("ListaEmpleados", empleadosEncontrados);
                request.getRequestDispatcher("Empleado.jsp").forward(request, response);
                break;

            default:
                listaEmpleados = empleadoDAO.listar();
                request.setAttribute("ListaEmpleados", listaEmpleados);
                request.getRequestDispatcher("Empleado.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
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
                        Empleado nuevoEmpleado = new Empleado();
                        nuevoEmpleado.setIdUsuario(idUsuario);
                        nuevoEmpleado.setNombre(nombre);
                        nuevoEmpleado.setTipoDocumento(tipoDocumento);
                        nuevoEmpleado.setNumDocumento(numDocumento);
                        nuevoEmpleado.setDireccion(direccion);
                        nuevoEmpleado.setTelefono(telefono);
                        nuevoEmpleado.setEmail(email);

                        int resultado = empleadoDAO.agregar(nuevoEmpleado);
                        if (resultado > 0) {
                            response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Empleado+agregado+correctamente");
                        } else {
                            response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Empleado+agregado+correctamente");
                        }
                    } else {
                        response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Error+al+agregar+el+empleado");
                    }
                } else {
                    response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Error+al+agregar+el+empleado");
                }
                break;

            case "Editar":
                int idEmpleadoEditar = Integer.parseInt(request.getParameter("idEmpleado"));
                String nombreEditar = request.getParameter("nombre");
                String tipoDocumentoEditar = request.getParameter("tipoDocumento");
                String numDocumentoEditar = request.getParameter("numDocumento");
                String direccionEditar = request.getParameter("direccion");
                String telefonoEditar = request.getParameter("telefono");
                String emailEditar = request.getParameter("email");

                Empleado empleadoEditar = new Empleado();
                empleadoEditar.setIdEmpleado(idEmpleadoEditar);
                empleadoEditar.setNombre(nombreEditar);
                empleadoEditar.setTipoDocumento(tipoDocumentoEditar);
                empleadoEditar.setNumDocumento(numDocumentoEditar);
                empleadoEditar.setDireccion(direccionEditar);
                empleadoEditar.setTelefono(telefonoEditar);
                empleadoEditar.setEmail(emailEditar);

                int resultadoActualizacion = empleadoDAO.actualizar(empleadoEditar);

                if (resultadoActualizacion > 0) {
                    response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Empleado+actualizado+correctamente");
                } else if (resultadoActualizacion == 0) {
                    response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Empleado+actualizado+correctamente");
                } else {
                    response.sendRedirect("ControladorEmpleado?Op=Listar&mensaje=Error+al+actualizar+el+empleado");
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
