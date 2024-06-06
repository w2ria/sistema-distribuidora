package Controlador;

import Modelo.Ingreso;
import Modelo.IngresoDAO;
import Modelo.Proveedor;
import Modelo.ProveedorDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maria
 */
public class ControladorIngreso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        Ingreso nuevoIngreso = new Ingreso();
        IngresoDAO ingresoDAO = new IngresoDAO();
        ProveedorDAO proveedorDAO = new ProveedorDAO();

        switch (opcion) {
            case "Listar":
                List<Ingreso> listaIngresos = ingresoDAO.listar();
                List<Proveedor> listaProveedores = proveedorDAO.listarNombres();
                request.setAttribute("ListaIngresos", listaIngresos);
                request.setAttribute("ListaProveedores", listaProveedores);
                request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idIngresoEliminarStr = request.getParameter("idIngreso");
                if (idIngresoEliminarStr != null && !idIngresoEliminarStr.isEmpty()) {
                    int idIngresoAEliminar = Integer.parseInt(idIngresoEliminarStr);
                    boolean eliminacionExitosa = ingresoDAO.eliminar(idIngresoAEliminar);
                    if (eliminacionExitosa) {
                        response.sendRedirect("ControladorIngreso?Op=Listar&mensaje=Ingreso+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorIngreso?Op=Listar&error=Hubo+un+error+al+eliminar+el+ingreso");
                    }
                } else {
                    response.sendRedirect("ControladorIngreso?Op=Listar&error=Hubo+un+error+al+eliminar+el+ingreso");
                }
                break;

            case "Buscar":

                break;

            default:
                listaIngresos = ingresoDAO.listar();
                request.setAttribute("ListaIngresos", listaIngresos);
                request.getRequestDispatcher("Ingreso.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String accion = request.getParameter("accion");
        IngresoDAO ingresoDAO = new IngresoDAO();

        switch (accion) {
            case "Agregar":
                Ingreso nuevoIngreso = new Ingreso();  
                Proveedor proveedorAgregar = new Proveedor();
                
                int idProveedorAgregar = Integer.parseInt(request.getParameter("idProveedor"));
                String tipoComprobanteAgregar = request.getParameter("tipoComprobante");
                int ultimoNumeroComprobante = ingresoDAO.obtenerUltimoNumeroComprobante(tipoComprobanteAgregar);
                String numComprobanteAgregar = nuevoIngreso.generarNuevoNumeroComprobante(ultimoNumeroComprobante, tipoComprobanteAgregar);
                Date fechaAgregar = Date.valueOf(request.getParameter("fecha"));
                double totalAgregar = Double.parseDouble(request.getParameter("total"));

                proveedorAgregar.setIdProveedor(idProveedorAgregar);
                nuevoIngreso.setIdProveedor(proveedorAgregar);
                nuevoIngreso.setTipoComprobante(tipoComprobanteAgregar);
                nuevoIngreso.setNumComprobante(numComprobanteAgregar);
                nuevoIngreso.setFecha(fechaAgregar);
                nuevoIngreso.setTotal(totalAgregar);

                int resultadoAgregar = ingresoDAO.agregar(nuevoIngreso);

                if (resultadoAgregar > 0) {
                    response.sendRedirect("ControladorIngreso?Op=Listar&mensaje=Ingreso+agregado+correctamente");
                } else {
                    response.sendRedirect("ControladorIngreso?Op=Listar&error=Error+al+agregar+el+ingreso");
                }
                break;

            case "Editar":
                int idIngresoEditar = Integer.parseInt(request.getParameter("idIngreso"));
                int idProveedorEditar = Integer.parseInt(request.getParameter("idProveedor"));
                String tipoComprobanteEditar = request.getParameter("tipoComprobante");
                String numComprobanteEditar = request.getParameter("numComprobante");
                Date fechaEditar = Date.valueOf(request.getParameter("fecha"));
                double totalEditar = Double.parseDouble(request.getParameter("total"));

                Ingreso ingresoEditar = new Ingreso();
                ingresoEditar.setIdIngreso(idIngresoEditar);
                Proveedor proveedorEditar = new Proveedor();
                proveedorEditar.setIdProveedor(idProveedorEditar);
                ingresoEditar.setIdProveedor(proveedorEditar);
                ingresoEditar.setTipoComprobante(tipoComprobanteEditar);
                ingresoEditar.setNumComprobante(numComprobanteEditar);
                ingresoEditar.setFecha(fechaEditar);
                ingresoEditar.setTotal(totalEditar);

                int resultadoEditar = ingresoDAO.actualizar(ingresoEditar);

                if (resultadoEditar > 0) {
                    response.sendRedirect("ControladorIngreso?Op=Listar&mensaje=Ingreso+actualizado+correctamente");
                } else {
                    response.sendRedirect("ControladorIngreso?Op=Listar&error=Error+al+actualizar+el+ingreso");
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
