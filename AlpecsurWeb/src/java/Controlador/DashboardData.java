/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Configuraciones.conexion;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piero
 */
public class DashboardData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DashboardData</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardData at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        conexion conn = new conexion();
        try (Connection con = conn.Conexion()) {
            int totalVentas = obtenerTotalVentas(con);
            int totalIngresos = obtenerTotalIngresos(con);
            int clientesRegistrados = obtenerClientesRegistrados(con);
            List<Map<String, Object>> ventasEIngresosDiarios = obtenerVentasEIngresosDiarios(con);

            double porcentajeVentas = calcularPorcentajeVentas(totalVentas);
            double porcentajeIngresos = calcularPorcentajeIngresos(totalIngresos);
            double porcentajeClientes = calcularPorcentajeClientes(clientesRegistrados);            
            
            Map<String, Object> data = new HashMap<>();
            data.put("totalVentas", totalVentas);
            data.put("totalIngresos", totalIngresos);
            data.put("clientesRegistrados", clientesRegistrados);
            data.put("ventasEIngresosDiarios", ventasEIngresosDiarios);
            data.put("porcentajeVentas", porcentajeVentas);
            data.put("porcentajeIngresos", porcentajeIngresos);
            data.put("porcentajeClientes", porcentajeClientes);

            Gson gson = new Gson();
            String jsonData = gson.toJson(data);

            PrintWriter out = response.getWriter();
            out.print(jsonData);
            out.flush();

        } catch (SQLException e) {
            e.printStackTrace();  // Añadimos el seguimiento de la pila de errores
            throw new ServletException("Error accessing database", e);
        }
    }

    private int obtenerTotalVentas(Connection conn) throws SQLException {
        String query = "SELECT COUNT(*) FROM pedido";
        try (PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    private int obtenerTotalIngresos(Connection conn) throws SQLException {
        String query = "SELECT COUNT(*) FROM ingreso";
        try (PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    private int obtenerClientesRegistrados(Connection conn) throws SQLException {
        String query = "SELECT COUNT(*) FROM cliente";
        try (PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    private List<Map<String, Object>> obtenerVentasEIngresosDiarios(Connection conn) throws SQLException {
        String query = "SELECT p.fecha, SUM(p.total) AS ingresos, SUM(dp.cantidad) AS cantidadVentas "
                + "FROM pedido p "
                + "JOIN detallepedido dp ON p.idPedido = dp.idPedido "
                + "GROUP BY p.fecha";
        try (PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            List<Map<String, Object>> dataList = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("fecha", rs.getString("fecha"));
                data.put("ventas", rs.getInt("cantidadVentas"));
                data.put("ingresos", rs.getDouble("ingresos"));
                dataList.add(data);
            }
            return dataList;
        }
    }

    // Métodos para calcular porcentajes (estos son solo ejemplos, ajusta según tu lógica de negocio)
    private double calcularPorcentajeVentas(int totalVentas) {
        // Implementa tu lógica para calcular el porcentaje de ventas
        return (totalVentas / 1000.0) * 100; // Ejemplo de cálculo
    }

    private double calcularPorcentajeIngresos(int totalIngresos) {
        // Implementa tu lógica para calcular el porcentaje de ingresos
        return (totalIngresos / 100.0) * 100; // Ejemplo de cálculo
    }

    private double calcularPorcentajeClientes(int clientesRegistrados) {
        // Implementa tu lógica para calcular el porcentaje de clientes
        return (clientesRegistrados / 500.0) * 100; // Ejemplo de cálculo
    }    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
