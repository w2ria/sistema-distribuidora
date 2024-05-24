<%-- 
    Document   : Producto
    Created on : 19 may. 2024, 12:50:42
    Author     : maria
--%>

<%@page import="Modelo.Marca"%>
<%@page import="Modelo.Categoria"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="Modelo.Producto"%>
<%@page import="Modelo.Autos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Autos> listaAutos = (List<Autos>) request.getAttribute("ListaAutos");
    List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");
    List<Marca> listaMarcas = (List<Marca>) request.getAttribute("listaMarcas");
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <link rel="stylesheet" href="resources/css/styleTablaProducto.css">
        <script src="https://kit.fontawesome.com/26a3cc7edf.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Autos | Alpecsur </title>
    </head>

    <body>
        
        <div id="btnAgregarContainer">
            <input type="button" value="Agregar Auto" class="btn btn-info" id="btnAgregar" data-toggle="modal" data-target="#agregarProductoModal">
            <a href="MenuAdministrador.jsp" class="btn btn-outline-secondary">Volver al Menu Administrador</a>
        </div>

        <div class="modal fade" id="agregarProductoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Auto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorAuto" method="POST" enctype="multipart/form-data">
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
                                <label for="txtPrecio">Precio Por Dia</label>
                                <input type="number" step="0.0001" name="precio_dia" id="txtPrecio" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label for="txtStock">Stock</label>
                                <input type="number" name="stock" id="txtStock" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Año</label>
                                <input type="text" name="nombre" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Placa</label>
                                <input type="text" name="placa" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Color</label>
                                <input type="text" name="color" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Kilometraje</label>
                                <input type="text" name="kilometraje" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Ubicacion</label>
                                <input type="text" name="ubicacion" id="txtNombre" class="form-control" required>
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

        <div class="d-flex">
            <div class="col-sm-12">
                <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                    <thead>
                        <tr style="background-color:#fff; font-weight:bold;">
                            <td style="color:black;"><center>ID</center></td>
                    <td style="color:black;"><center>NOMBRE</center></td>
                    <td style="color:black;"><center>CATEGORÍA</center></td>
                    <td style="color:black;"><center>PRECIO POR DIA</center></td>
                    <td style="color:black;"><center>STOCK</center></td>
                    <td style="color:black;"><center>AÑO</center></td>
                    <td style="color:black;"><center>PLACA</center></td>
                    <td style="color:black;"><center>COLOR</center></td>
                    <td style="color:black;"><center>KILOMETRAJE</center></td>
                    <td style="color:black;"><center>UBICACION</center></td>
                    <td style="color:black;"><center>MARCA</center></td>
                    <td style="color:black;"><center>DESCRIPCIÓN</center></td>
                    <td style="color:black;"><center>IMAGEN</center></td>
                    <td style="color:black;"><center>ESTADO</center></td>
                    <td style="color:black;"><center>ACCIONES</center></td>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="autos" items="${ListaAutos}">
                            <tr>
                                <td><center>${autos.getIdAutos()}</center></td>
                        <td><center>${autos.getNombre()}</center></td>
                        <td><center>${autos.getCategoria().getNombre()}</center></td> <!-- Accede al nombre de la categoría a través del objeto Categoria asociado -->
                        <td><center>${autos.getPrecio_Dia()}</center></td>
                        <td><center>${autos.getStock()}</center></td>
                        <td><center>${autos.getAño()}</center></td>
                        <td><center>${autos.getPlaca()}</center></td>
                        <td><center>${autos.getColor()}</center></td>
                        <td><center>${autos.getKilometraje()}</center></td>
                        <td><center>${autos.getUbicacion()}</center></td>
                        <td><center>${autos.getMarca().getNombre()}</center></td> <!-- Accede al nombre de la marca a través del objeto Marca asociado -->
                        <td><center>${autos.getDescripcion()}</center></td>
                        <td><center><img src="${pageContext.request.contextPath}/resources/images/productos/${autos.getImagen()}" alt="${autos.getNombre()}" class="imagen-producto"></center></td>
                        <td><center>${autos.getEstado()}</center></td>
                        <td>
                            <div style="display: flex;">
                                <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${producto.getIdAutos()}"
                                   data-nombre="${autos.getNombre()}" data-id-categoria="${autos.getCategoria().getIdCategoria()}"
                                   data-precio="${autos.getPrecio_Dia()}" data-stock="${autos.getStock()}"
                                   data-precio="${autos.getAño()}" data-stock="${autos.getPlaca()}"
                                   data-precio="${autos.getColor()}" 
                                   data-precio="${autos.getKilometraje()}" 
                                   data-precio="${autos.getUbicacion()}" 
                                   data-id-marca="${autos.getMarca().getIdMarca()}" data-descripcion="${autos.getDescripcion()}"
                                   data-imagen="${autos.getImagen()}" data-estado="${autos.getEstado()}"><i class="fas fa-edit"></i> Editar</a>
                                <a href="ControladorAuto?Op=Eliminar&idAutos=${autos.getIdAutos()}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('¿Estás seguro de que deseas eliminar este auto?');">
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

        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Auto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" action="ControladorProducto" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="idAutos" id="editIdAutos">
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
                                <label for="txtPrecio">Precio Por Dia</label>
                                <input type="number" step="0.0001" name="precio_dia" id="txtPrecio" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label for="txtStock">Stock</label>
                                <input type="number" name="stock" id="txtStock" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Año</label>
                                <input type="text" name="nombre" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Placa</label>
                                <input type="text" name="placa" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Color</label>
                                <input type="text" name="color" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Kilometraje</label>
                                <input type="text" name="kilometraje" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Ubicacion</label>
                                <input type="text" name="ubicacion" id="txtNombre" class="form-control" required>
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
                                <input type="submit" name="accion" value="Editar" class="btn btn-success">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('.editBtn').on('click', function () {
                    var id = $(this).data('id');
                    var nombre = $(this).data('nombre');
                    var idCategoria = $(this).data('idCategoria');
                    var precio = $(this).data('precio');
                    var stock = $(this).data('stock');
                    var año = $(this).data('año');
                    var placa = $(this).data('placa');
                    var color = $(this).data('color');
                    var kilometraje = $(this).data('kilometraje');
                    var ubicacion = $(this).data('ubicacion');
                    var idMarca = $(this).data('idMarca');
                    var descripcion = $(this).data('descripcion');
                    var imagen = $(this).data('imagen');
                    var estado = $(this).data('estado');

                    $('#editIdProducto').val(id);
                    $('#editNombre').val(nombre);
                    $('#editIdCategoria').val(idCategoria);
                    $('#editPrecio').val(precio);
                    $('#editStock').val(stock);
                    $('#editAño').val(año);
                    $('#editPlaca').val(placa);
                    $('#editColor').val(color);
                    $('#editKilometraje').val(kilometraje);
                    $('#editUbicacion').val(ubicacion);
                    $('#editIdMarca').val(idMarca);
                    $('#editDescripcion').val(descripcion);
                    $('#editImagenActual').val(imagen);
                    $('#editEstado').val(estado);
                });
            });
        </script>
    </body>
</html>