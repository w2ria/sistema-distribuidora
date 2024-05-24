/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.ReservaDAO;
import Modelo.Reserva;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piero
 */
public class ControladorReserva extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ReservaDAO reservaDAO = new ReservaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Reserva</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Reserva at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String accion = request.getParameter("accion");

        if (accion.equals("realizarReserva")) {
            try {
                realizarReserva(request, response);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

    private void realizarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        // Obtener los datos del formulario
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        int idPago = Integer.parseInt(request.getParameter("idPago"));
        String tipoComprobante = request.getParameter("tipoComprobante");
        String numComprobante = request.getParameter("numComprobante");
        String ubicacion = request.getParameter("ubicacion");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_inicio = sdf.parse(request.getParameter("fecha_inicio"));
        Date fecha_fin = sdf.parse(request.getParameter("fecha_fin"));
        String hora_inicio = request.getParameter("hora_inicio");
        String hora_fin = request.getParameter("hora_fin");
        double total = Double.parseDouble(request.getParameter("total"));
        int idEstadoReserva = Integer.parseInt(request.getParameter("idEstadoReserva"));

        // Crear el objeto Reserva
        Reserva reserva = new Reserva();
        reserva.setIdCliente(idCliente);
        reserva.setIdEmpleado(idEmpleado);
        reserva.setIdPago(idPago);
        reserva.setTipoComprobante(tipoComprobante);
        reserva.setNumComprobante(numComprobante);
        reserva.setUbicacion(ubicacion);
        reserva.setFecha_inicio(fecha_inicio);
        reserva.setFecha_fin(fecha_fin);
        reserva.setHora_inicio(hora_inicio);
        reserva.setHora_fin(hora_fin);
        reserva.setTotal(total);
        reserva.setIdEstadoReserva(idEstadoReserva);

        // Guardar la reserva en la base de datos
        reservaDAO.insertar(reserva);

        // Redirigir a la página de confirmación
        response.sendRedirect("confirmacion.jsp");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
