
package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContadorVisitas extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private int contador;

    public ContadorVisitas() {
        super();
    }

    @Override
    public void init() throws ServletException {
        // Inicializa el contador a 0
        contador = 0;
    }

    // En tu servlet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        contador++;
        getServletContext().setAttribute("contadorVisitas", contador);
        System.out.println("Contador actualizado a: " + contador); // Añadir log

        response.sendRedirect("MenuAdministrador.jsp");
    }

}
