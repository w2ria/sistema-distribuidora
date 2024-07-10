
package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean nuevaVisita = true;

        // Revisa si ya existe la cookie de "visitanteUnico"
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visitanteUnico")) {
                    nuevaVisita = false;
                    break;
                }
            }
        }

        if (nuevaVisita) {
            // Incrementa el contador
            contador++;
            getServletContext().setAttribute("contadorVisitas", contador);

            // Crea una cookie que expire en un año
            Cookie nuevaCookie = new Cookie("visitanteUnico", "true");
            nuevaCookie.setMaxAge(365 * 24 * 60 * 60); // 1 año
            response.addCookie(nuevaCookie);
        }

        // Redirige al índice si no es una nueva visita
        if (!nuevaVisita) {
            response.sendRedirect("index.jsp");
        }
    }
}
