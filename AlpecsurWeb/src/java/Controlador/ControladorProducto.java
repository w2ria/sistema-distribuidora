package Controlador;

import Modelo.Categoria;
import Modelo.CategoriaDAO;
import Modelo.Marca;
import Modelo.MarcaDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
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
 * Controlador para la gestión de productos.
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ControladorProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String opcion = request.getParameter("Op");
        ProductoDAO productoDAO = new ProductoDAO();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        MarcaDAO marcaDAO = new MarcaDAO();
        List<Categoria> listaCategorias = categoriaDAO.listar();
        List<Marca> listaMarcas = marcaDAO.listar();

        switch (opcion) {
            case "Listar":
                List<Producto> listaProductos = productoDAO.listarConMarcaYCategoria();
                request.setAttribute("ListaProductos", listaProductos);
                request.setAttribute("listaCategorias", listaCategorias);
                request.setAttribute("listaMarcas", listaMarcas);
                request.getRequestDispatcher("Producto.jsp").forward(request, response);
                break;

            case "Eliminar":
                String idProductoEliminarStr = request.getParameter("idProducto");
                if (idProductoEliminarStr != null && !idProductoEliminarStr.isEmpty()) {
                    int idProductoAEliminar = Integer.parseInt(idProductoEliminarStr);
                    boolean eliminacionExitosa = productoDAO.eliminar(idProductoAEliminar);
                    if (eliminacionExitosa) {
                        response.sendRedirect("ControladorProducto?Op=Listar&mensaje=Producto+eliminado+correctamente");
                    } else {
                        response.sendRedirect("ControladorProducto?Op=Listar&error=Hubo+un+error+al+eliminar+el+producto");
                    }
                } else {
                    response.sendRedirect("ControladorProducto?Op=Listar&error=Hubo+un+error+al+eliminar+el+producto");
                }
                break;

            case "Buscar":
                String nombreBuscar = request.getParameter("nombre");
                List<Producto> productosEncontrados = productoDAO.buscarPorNombre(nombreBuscar);
                request.setAttribute("ListaProductos", productosEncontrados);
                request.setAttribute("listaCategorias", listaCategorias);
                request.setAttribute("listaMarcas", listaMarcas);
                request.getRequestDispatcher("Producto.jsp").forward(request, response);
                break;

            default:
                listaProductos = productoDAO.listar();
                request.setAttribute("ListaProductos", listaProductos);
                request.setAttribute("listaCategorias", listaCategorias);
                request.setAttribute("listaMarcas", listaMarcas);
                request.getRequestDispatcher("Producto.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");
        ProductoDAO productoDAO = new ProductoDAO();

        switch (accion) {
            case "Agregar":
                String nombre = request.getParameter("nombre");
                int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                int idMarca = Integer.parseInt(request.getParameter("idMarca"));
                String descripcion = request.getParameter("descripcion");
                String estado = request.getParameter("estado");
                Part imagenPart = request.getPart("imagen");

                int ultimoNumeroImagen = productoDAO.obtenerUltimoNumeroImagen();
                String nuevoNombreImagen = productoDAO.generarNuevoNombreImagen(ultimoNumeroImagen);
                String extension = obtenerExtensionImagen(imagenPart);
                String rutaImagen = guardarImagen(imagenPart, nuevoNombreImagen, extension);

                Producto nuevoProducto = new Producto();
                Categoria categoria = new Categoria(idCategoria);
                Marca marca = new Marca(idMarca);
                nuevoProducto.setNombre(nombre);
                nuevoProducto.setCategoria(categoria);
                nuevoProducto.setPrecio(precio);
                nuevoProducto.setStock(stock);
                nuevoProducto.setMarca(marca);
                nuevoProducto.setDescripcion(descripcion);
                nuevoProducto.setImagen(nuevoNombreImagen + extension);
                nuevoProducto.setEstado(estado);

                int resultadoAgregar = productoDAO.agregar(nuevoProducto);
                if (resultadoAgregar > 0) {
                    try {
                        Thread.sleep(3000);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(ControladorProducto.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("ControladorProducto?Op=Listar&mensaje=Producto+agregado+correctamente");
                } else {
                    response.sendRedirect("ControladorProducto?Op=Listar&error=Error+al+agregar+el+producto");
                }
                break;

            case "Editar":
                int idProducto = Integer.parseInt(request.getParameter("idProducto"));
                String nombreEditar = request.getParameter("nombre");
                int idCategoriaEditar = Integer.parseInt(request.getParameter("idCategoria"));
                double precioEditar = Double.parseDouble(request.getParameter("precio"));
                int stockEditar = Integer.parseInt(request.getParameter("stock"));
                int idMarcaEditar = Integer.parseInt(request.getParameter("idMarca"));
                String descripcionEditar = request.getParameter("descripcion");
                String estadoEditar = request.getParameter("estado");
                Part imagenPartEditar = request.getPart("imagen");
                String imagenNombreEditar = getFilename(imagenPartEditar);
                if (!imagenNombreEditar.isEmpty()) {
                    // Se ha cargado una nueva imagen
                    int ultimoNumeroImagenEditar = productoDAO.obtenerUltimoNumeroImagen();
                    String nuevoNombreImagenEditar = productoDAO.generarNuevoNombreImagen(ultimoNumeroImagenEditar);
                    String extensionImagenEditar = obtenerExtensionImagen(imagenPartEditar);
                    String rutaImagenEditar = guardarImagen(imagenPartEditar, nuevoNombreImagenEditar, extensionImagenEditar);
                    // Actualizar la información del producto con la nueva imagen
                    Producto productoEditar = new Producto();
                    productoEditar.setIdProducto(idProducto);
                    Categoria categoriaEditar = new Categoria(idCategoriaEditar);
                    Marca marcaEditar = new Marca(idMarcaEditar);
                    productoEditar.setNombre(nombreEditar);
                    productoEditar.setCategoria(categoriaEditar);
                    productoEditar.setPrecio(precioEditar);
                    productoEditar.setStock(stockEditar);
                    productoEditar.setMarca(marcaEditar);
                    productoEditar.setDescripcion(descripcionEditar);
                    productoEditar.setImagen(nuevoNombreImagenEditar + extensionImagenEditar);
                    productoEditar.setEstado(estadoEditar);
                    // Actualizar el producto en la base de datos
                    int resultadoActualizar = productoDAO.actualizar(productoEditar);
                    if (resultadoActualizar > 0) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(ControladorProducto.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("ControladorProducto?Op=Listar&mensaje=Producto+actualizado+correctamente");
                    } else {
                        response.sendRedirect("ControladorProducto?Op=Listar&error=Error+al+actualizar+el+producto");
                    }
                } else {
                    // No se ha cargado una nueva imagen, mantener la imagen actual
                    String imagenActual = request.getParameter("imagenActual");
                    // Actualizar la información del producto sin cambiar la imagen
                    Producto productoEditar = new Producto();
                    productoEditar.setIdProducto(idProducto);
                    Categoria categoriaEditar = new Categoria(idCategoriaEditar);
                    Marca marcaEditar = new Marca(idMarcaEditar);
                    productoEditar.setNombre(nombreEditar);
                    productoEditar.setCategoria(categoriaEditar);
                    productoEditar.setPrecio(precioEditar);
                    productoEditar.setStock(stockEditar);
                    productoEditar.setMarca(marcaEditar);
                    productoEditar.setDescripcion(descripcionEditar);
                    productoEditar.setImagen(imagenActual);
                    productoEditar.setEstado(estadoEditar);
                    // Actualizar el producto en la base de datos
                    int resultadoActualizar = productoDAO.actualizar(productoEditar);
                    if (resultadoActualizar > 0) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(ControladorProducto.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("ControladorProducto?Op=Listar&mensaje=Producto+actualizado+correctamente");
                    } else {
                        response.sendRedirect("ControladorProducto?Op=Listar&error=Error+al+actualizar+el+producto");
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
