package Controlador;

import Modelo.Categoria;
import Modelo.CategoriaDAO;
import Modelo.Marca;
import Modelo.MarcaDAO;
import Modelo.Autos;
import Modelo.AutoDAO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 * Controlador para la gestión de autos.
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ControladorAuto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        AutoDAO autoDAO = new AutoDAO();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        MarcaDAO marcaDAO = new MarcaDAO();
        List<Categoria> listaCategorias = categoriaDAO.listar();
        List<Marca> listaMarcas = marcaDAO.listar();

        switch (opcion) {
            case "Listar":
                List<Autos> listaAutos = autoDAO.listarConMarcaYCategoria();
                request.setAttribute("ListaAutos", listaAutos);
                request.setAttribute("listaCategorias", listaCategorias);
                request.setAttribute("listaMarcas", listaMarcas);
                request.getRequestDispatcher("Auto.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idAutosEliminarStr = request.getParameter("idAutos");
                if (idAutosEliminarStr != null && !idAutosEliminarStr.isEmpty()) {
                    int idAutoAEliminar = Integer.parseInt(idAutosEliminarStr);
                    boolean eliminacionExitosa = autoDAO.eliminar(idAutoAEliminar);
                    if (eliminacionExitosa) {
                        response.sendRedirect("ControladorAuto?Op=Listar&mensaje=Auto+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorAuto?Op=Listar&error=Hubo+un+error+al+eliminar+el+auto");
                    }
                } else {
                    response.sendRedirect("ControladorAuto?Op=Listar&error=Hubo+un+error+al+eliminar+el+auto");
                }
                break;

            case "BuscarAuto":
                String nombreBuscar = request.getParameter("nombre");
                List<Autos> autosEncontrados = (List<Autos>) autoDAO.buscarPorNombre(nombreBuscar);
                request.setAttribute("ListaAutos", autosEncontrados);
                request.getRequestDispatcher("Auto.jsp").forward(request, response);
                break;    
            default:
                listaAutos = autoDAO.listar();
                request.setAttribute("ListaAutos", listaAutos);
                request.setAttribute("listaCategorias", listaCategorias);
                request.setAttribute("listaMarcas", listaMarcas);
                request.getRequestDispatcher("Auto.jsp").forward(request, response);
                break;
                
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        AutoDAO autoDAO = new AutoDAO();

        switch (accion) {
            case "Agregar":
                String nombre = request.getParameter("nombre");
                int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                double precio_dia = Double.parseDouble(request.getParameter("precio_dia"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                String año = request.getParameter("año");
                String placa = request.getParameter("placa");
                String color = request.getParameter("color");
                String kilometraje = request.getParameter("kilometraje");
                String ubicacion = request.getParameter("ubicacion");
                int idMarca = Integer.parseInt(request.getParameter("idMarca"));
                String descripcion = request.getParameter("descripcion");
                String estado = request.getParameter("estado");
                Part imagenPart = request.getPart("imagen");

                int ultimoNumeroImagen = autoDAO.obtenerUltimoNumeroImagen();
                String nuevoNombreImagen = autoDAO.generarNuevoNombreImagen(ultimoNumeroImagen);
                String extension = obtenerExtensionImagen(imagenPart);
                String rutaImagen = guardarImagen(imagenPart, nuevoNombreImagen, extension);

                Autos nuevoAuto = new Autos();
                Categoria categoria = new Categoria(idCategoria);
                Marca marca = new Marca(idMarca);
                nuevoAuto.setNombre(nombre);
                nuevoAuto.setCategoria(categoria);
                nuevoAuto.setPrecio_Dia(precio_dia);
                nuevoAuto.setStock(stock);
                nuevoAuto.setAño(año);
                nuevoAuto.setPlaca(placa);
                nuevoAuto.setColor(color);
                nuevoAuto.setKilometraje(kilometraje);
                nuevoAuto.setUbicacion(ubicacion);
                nuevoAuto.setMarca(marca);
                nuevoAuto.setDescripcion(descripcion);
                nuevoAuto.setEstado(estado);
                nuevoAuto.setImagen(nuevoNombreImagen + extension);

                int resultadoAgregar = autoDAO.agregar(nuevoAuto);
                if (resultadoAgregar > 0) {
                    try {
                        Thread.sleep(3000);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(ControladorAuto.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("ControladorAuto?Op=Listar&mensaje=Auto+agregado+correctamente");
                } else {
                    response.sendRedirect("ControladorAuto?Op=Listar&error=Error+al+agregar+el+auto");
                }
                break;

            case "Editar":
                int idAutos = Integer.parseInt(request.getParameter("idAutos"));
                String nombreEditar = request.getParameter("nombre");
                int idCategoriaEditar = Integer.parseInt(request.getParameter("idCategoria"));
                double precio_diaEditar = Double.parseDouble(request.getParameter("precio_dia"));
                int stockEditar = Integer.parseInt(request.getParameter("stock"));
                String añoEditar = request.getParameter("año");
                String placaEditar = request.getParameter("placa");
                String colorEditar = request.getParameter("color");
                String kilometrajeEditar = request.getParameter("kilometraje");
                String ubicacionEditar = request.getParameter("ubicacion");
                int idMarcaEditar = Integer.parseInt(request.getParameter("idMarca"));
                String descripcionEditar = request.getParameter("descripcion");
                String estadoEditar = request.getParameter("estado");
                Part imagenPartEditar = request.getPart("imagen");
                String imagenNombreEditar = getFilename(imagenPartEditar);
                if (!imagenNombreEditar.isEmpty()) {
                    // Se ha cargado una nueva imagen
                    int ultimoNumeroImagenEditar = autoDAO.obtenerUltimoNumeroImagen();
                    String nuevoNombreImagenEditar = autoDAO.generarNuevoNombreImagen(ultimoNumeroImagenEditar);
                    String extensionImagenEditar = obtenerExtensionImagen(imagenPartEditar);
                    String rutaImagenEditar = guardarImagen(imagenPartEditar, nuevoNombreImagenEditar, extensionImagenEditar);
                    // Actualizar la información del auto con la nueva imagen
                    Autos autoEditar = new Autos();
                    autoEditar.setIdAutos(idAutos);
                    Categoria categoriaEditar = new Categoria(idCategoriaEditar);
                    Marca marcaEditar = new Marca(idMarcaEditar);
                    autoEditar.setNombre(nombreEditar);
                    autoEditar.setCategoria(categoriaEditar);
                    autoEditar.setPrecio_Dia(precio_diaEditar);
                    autoEditar.setStock(stockEditar);
                    autoEditar.setAño(añoEditar);
                    autoEditar.setPlaca(placaEditar);
                    autoEditar.setColor(colorEditar);
                    autoEditar.setKilometraje(kilometrajeEditar);
                    autoEditar.setUbicacion(ubicacionEditar);
                    autoEditar.setMarca(marcaEditar);
                    autoEditar.setDescripcion(descripcionEditar);
                    autoEditar.setImagen(nuevoNombreImagenEditar + extensionImagenEditar);
                    autoEditar.setEstado(estadoEditar);
                    
                    // Actualizar el auto en la base de datos
                    int resultadoActualizar = autoDAO.actualizar(autoEditar);
                    if (resultadoActualizar > 0) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(ControladorAuto.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("ControladorAuto?Op=Listar&mensaje=Auto+actualizado+correctamente");
                    } else {
                        response.sendRedirect("ControladorAuto?Op=Listar&error=Error+al+actualizar+el+auto");
                    }
                } else {
                    // No se ha cargado una nueva imagen, mantener la imagen actual
                    String imagenActual = request.getParameter("imagenActual");
                    // Actualizar la información del auto sin cambiar la imagen
                    Autos autoEditar = new Autos();
                    autoEditar.setIdAutos(idAutos);
                    Categoria categoriaEditar = new Categoria(idCategoriaEditar);
                    Marca marcaEditar = new Marca(idMarcaEditar);
                    autoEditar.setNombre(nombreEditar);
                    autoEditar.setCategoria(categoriaEditar);
                    autoEditar.setPrecio_Dia(precio_diaEditar);
                    autoEditar.setStock(stockEditar);
                    autoEditar.setAño(añoEditar);
                    autoEditar.setPlaca(placaEditar);
                    autoEditar.setColor(colorEditar);
                    autoEditar.setKilometraje(kilometrajeEditar);
                    autoEditar.setUbicacion(ubicacionEditar);
                    autoEditar.setMarca(marcaEditar);
                    autoEditar.setDescripcion(descripcionEditar);
                    autoEditar.setImagen(imagenActual);
                    autoEditar.setEstado(estadoEditar);
                    // Actualizar el auto en la base de datos
                    int resultadoActualizar = autoDAO.actualizar(autoEditar);
                    if (resultadoActualizar > 0) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(ControladorAuto.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("ControladorAuto?Op=Listar&mensaje=Auto+actualizado+correctamente");
                    } else {
                        response.sendRedirect("ControladorAuto?Op=Listar&error=Error+al+actualizar+el+auto");
                    }
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

    private String getFilename(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private String obtenerExtensionImagen(Part part) {
        String fileName = getFilename(part);
        if (fileName != null) {
            return fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
        }
        return null;
    }

    private String guardarImagen(Part part, String nuevoNombreImagen, String extension) throws IOException {
        String directory = getServletContext().getRealPath("../../web/resources/images/productos/");
        Files.createDirectories(Paths.get(directory));
        Path filePath = Paths.get(directory, nuevoNombreImagen + extension);
        try (InputStream input = part.getInputStream()) {
            Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
        return filePath.toString();
    }

}
