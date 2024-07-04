<%-- 
    Document   : Producto
    Created on : 19 may. 2024, 12:50:42
    Author     : maria
--%>

<%@page import="Modelo.Marca"%>
<%@page import="Modelo.Categoria"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="Modelo.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Producto> listaProductos = (List<Producto>) request.getAttribute("ListaProductos");
    List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");
    List<Marca> listaMarcas = (List<Marca>) request.getAttribute("listaMarcas");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/26a3cc7edf.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <link rel="stylesheet" href="resources/css/alerta.css">
        <title>Productos</title>
    </head>

    <body>
        <div class="container">
            <h1 class="mt-4">Gestión de Productos</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorProducto" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombre" class="form-control mr-sm-2" placeholder="Buscar por nombre" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorProducto?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <!-- Botones para agregar producto y volver al menú -->
            <div class="d-flex justify-content-start mb-3">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarProductoModal">Agregar Producto</button>
                <a href="MenuAdministrador.jsp" class="btn btn-outline-secondary">Volver al Menú Administrador</a>
            </div>

            <!-- Tabla de productos -->
            <div class="d-flex">
                <div class="col-sm-12">
                    <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                        <thead>
                            <tr style="background-color:#fff; font-weight:bold;">
                                <td style="color:black;"><center>ID</center></td>
                        <td style="color:black;"><center>NOMBRE</center></td>
                        <td style="color:black;"><center>CATEGORÍA</center></td>
                        <td style="color:black;"><center>PRECIO</center></td>
                        <td style="color:black;"><center>STOCK</center></td>
                        <td style="color:black;"><center>MARCA</center></td>
                        <td style="color:black;"><center>DESCRIPCIÓN</center></td>
                        <td style="color:black;"><center>IMAGEN</center></td>
                        <td style="color:black;"><center>ESTADO</center></td>
                        <td style="color:black;"><center>ACCIONES</center></td>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="producto" items="${ListaProductos}">
                                <tr>
                                    <td><center>${producto.getIdProducto()}</center></td>
                            <td><center>${producto.getNombre()}</center></td>
                            <td><center>${producto.getCategoria().getNombre()}</center></td>
                            <td><center>${producto.getPrecio()}</center></td>
                            <td><center>${producto.getStock()}</center></td>
                            <td><center>${producto.getMarca().getNombre()}</center></td>
                            <td><center>${producto.getDescripcion()}</center></td>
                            <td><center><img src="${pageContext.request.contextPath}/resources/images/productos/${producto.getImagen()}" alt="${producto.getNombre()}" class="imagen-producto"></center></td>
                            <td><center>${producto.getEstado()}</center></td>
                            <td>
                                <div style="display: flex;">
                                    <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${producto.getIdProducto()}"
                                       data-nombre="${producto.getNombre()}" data-id-categoria="${producto.getCategoria().getIdCategoria()}"
                                       data-precio="${producto.getPrecio()}" data-stock="${producto.getStock()}"
                                       data-id-marca="${producto.getMarca().getIdMarca()}" data-descripcion="${producto.getDescripcion()}"
                                       data-imagen="${producto.getImagen()}" data-estado="${producto.getEstado()}"><i class="fas fa-edit"></i> Editar</a>
                                    <a href="ControladorProducto?Op=Eliminar&idProducto=${producto.getIdProducto()}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?');">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </a>
                                </div>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal para agregar producto -->
            <div class="modal fade" id="agregarProductoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Producto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ControladorProducto" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="txtNombre">Nombre</label>
                                    <input type="text" name="nombre" id="txtNombre" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="cmbCategoria">Categoría</label>
                                    <select name="idCategoria" id="cmbCategoria" class="form-control" required>
                                        <option value="">Seleccionar categoría</option>
                                        <% for (Categoria categoria : listaCategorias) {%>
                                        <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getNombre()%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="txtPrecio">Precio</label>
                                    <input type="number" step="0.0001" name="precio" id="txtPrecio" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="txtStock">Stock</label>
                                    <input type="number" name="stock" id="txtStock" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="cmbMarca">Marca</label>
                                    <select name="idMarca" id="cmbMarca" class="form-control" required>
                                        <option value="">Seleccionar marca</option>
                                        <% for (Marca marca : listaMarcas) {%>
                                        <option value="<%= marca.getIdMarca()%>"><%= marca.getNombre()%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="txtDescripcion">Descripción</label>
                                    <textarea name="descripcion" id="txtDescripcion" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="txtImagen">Imagen</label>
                                    <input type="file" name="imagen" id="txtImagen" class="form-control" required>
                                </div>
                                <select name="estado" id="estado" class="form-control">
                                    <option value="activo" selected>Activo</option>
                                    <option value="inactivo">Inactivo</option>
                                </select>
                                <div style="display: flex; justify-content: center;">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <% String mensaje = request.getParameter("mensaje");
                String error = request.getParameter("error"); %>

            <% if (mensaje != null) {%>
            <div class="alert alert-success" role="alert">
                <%= mensaje%>
            </div>
            <% } else if (error != null) {%>
            <div class="alert alert-danger" role="alert">
                <%= error%>
            </div>
            <% }%>

            <!-- Modal para editar producto -->
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Editar Producto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="editForm" action="ControladorProducto" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="idProducto" id="editIdProducto">
                                <div class="form-group">
                                    <label for="editNombre">Nombre</label>
                                    <input type="text" name="nombre" id="editNombre" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="editIdCategoria">Categoría</label>
                                    <select name="idCategoria" id="editIdCategoria" class="form-control" required>
                                        <% for (Categoria categoria : listaCategorias) {%>
                                        <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getNombre()%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editPrecio">Precio</label>
                                    <input type="number" step="0.0001" name="precio" id="editPrecio" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="editStock">Stock</label>
                                    <input type="number" name="stock" id="editStock" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="editIdMarca">Marca</label>
                                    <select name="idMarca" id="editIdMarca" class="form-control" required>
                                        <% for (Marca marca : listaMarcas) {%>
                                        <option value="<%= marca.getIdMarca()%>"><%= marca.getNombre()%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editDescripcion">Descripción</label>
                                    <textarea name="descripcion" id="editDescripcion" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="editImagen">Imagen</label>
                                    <input type="file" name="imagen" id="editImagen" class="form-control">
                                    <input type="hidden" name="imagenActual" id="editImagenActual">
                                </div>
                                <div class="form-group">
                                    <label for="editEstado">Estado</label>
                                    <select name="estado" id="editEstado" class="form-control">
                                        <option value="activo">Activo</option>
                                        <option value="inactivo">Inactivo</option>
                                    </select>
                                </div>
                                <div style="display: flex; justify-content: center;">
                                    <input type="submit" name="accion" value="Editar" class="btn btn-success">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('.editBtn').on('click', function () {
                    var id = $(this).data('id');
                    var nombre = $(this).data('nombre');
                    var idCategoria = $(this).data('id-categoria');
                    var precio = $(this).data('precio');
                    var stock = $(this).data('stock');
                    var idMarca = $(this).data('id-marca');
                    var descripcion = $(this).data('descripcion');
                    var imagen = $(this).data('imagen');
                    var estado = $(this).data('estado');

                    $('#editIdProducto').val(id);
                    $('#editNombre').val(nombre);
                    $('#editIdCategoria').val(idCategoria);
                    $('#editPrecio').val(precio);
                    $('#editStock').val(stock);
                    $('#editIdMarca').val(idMarca);
                    $('#editDescripcion').val(descripcion);
                    $('#editImagenActual').val(imagen);
                    $('#editEstado').val(estado);
                });
            });

        </script>
        <script>
            $(document).ready(function () {
                setTimeout(function () {
                    $('.alert').fadeOut('slow');
                }, 5000); // La alerta desaparecerá después de 5 segundos
            });
        </script>

    </body>
</html>
