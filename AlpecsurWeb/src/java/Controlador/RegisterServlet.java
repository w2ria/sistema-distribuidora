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
        String token = "";  // Genera un token si es necesario
        Timestamp expiracion = new Timestamp(new Date().getTime());  // Establece la fecha de expiración si es necesario

        Usuario us = new Usuario();
        us.setUsuario(usuario);
        us.setClave(clave);
        us.setToken(token);
        us.setExpiracion(expiracion);

        UsuarioDAO dao = new UsuarioDAO();
        int idUsuario = dao.agregar(us);

        if (idUsuario > 0) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
