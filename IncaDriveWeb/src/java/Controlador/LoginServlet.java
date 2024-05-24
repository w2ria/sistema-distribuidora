/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;


import Modelo.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario us = usuarioDAO.validar(usuario, clave);

        if (us.getUsuario() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", us);

            // Verificar si el usuario es un administrador, empleado o un cliente
            AdministradorDAO administradorDAO = new AdministradorDAO();
            Administrador admin = administradorDAO.listarPorId(us.getIdUsuario());

            if (admin != null && admin.getNombre() != null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("MenuAdministrador.jsp");
            } else {
                EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                Empleado empleado = empleadoDAO.listarPorId(us.getIdUsuario());
                if (empleado != null && empleado.getNombre() != null) {
                    session.setAttribute("empleado", empleado);
                    response.sendRedirect("MenuEmpleado.jsp");
                } else {
                    ClienteDAO clienteDAO = new ClienteDAO();
                    Cliente cliente = clienteDAO.listarPorId(us.getIdUsuario());
                    if (cliente != null && cliente.getNombre() != null) {
                        session.setAttribute("cliente", cliente);
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=true");
                    }
                }
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}