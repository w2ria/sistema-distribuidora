/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String nombre = request.getParameter("nombre");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String numDocumento = request.getParameter("numDocumento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String token = "";  // Genera un token si es necesario
        Timestamp expiracion = new Timestamp(new Date().getTime());  // Establece la fecha de expiración si es necesario

        Usuario us = new Usuario();
        us.setUsuario(usuario);
        us.setClave(clave);
        us.setToken(token);
        us.setExpiracion(expiracion);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int idUsuario = usuarioDAO.agregar(us);

        if (idUsuario > 0) {
            Cliente cli = new Cliente();
            cli.setIdUsuario(idUsuario);
            cli.setNombre(nombre);
            cli.setTipoDocumento(tipoDocumento);
            cli.setNumDocumento(numDocumento);
            cli.setDireccion(direccion);
            cli.setTelefono(telefono);
            cli.setEmail(email);

            ClienteDAO clienteDAO = new ClienteDAO();
            int resultado = clienteDAO.agregar(cli);

            if (resultado > 0) {
                response.sendRedirect("login.jsp?success=true");
            } else {
                usuarioDAO.eliminar(idUsuario); // Si falla, elimina el usuario creado
                response.sendRedirect("register.jsp?error=true");
            }
        } else {
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
