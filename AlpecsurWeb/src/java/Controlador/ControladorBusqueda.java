
package Controlador;

import Modelo.Producto;
import Modelo.ProductoDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorBusqueda", urlPatterns = {"/ControladorBusqueda"})
public class ControladorBusqueda extends HttpServlet {

    private ProductoDAO productoDAO = new ProductoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String query = request.getParameter("query");
        List<Producto> productos = productoDAO.BusquedaBarra(query);

        // Convertir la lista de productos a JSON
        String json = new Gson().toJson(productos);

        // Escribir el JSON en la respuesta
        response.getWriter().write(json);
        response.getWriter().flush();

        // Log para verificar el JSON
        System.out.println("JSON Output: " + json);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

