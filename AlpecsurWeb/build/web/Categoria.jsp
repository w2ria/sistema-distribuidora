<%-- 
    Document   : Categoria
    Created on : 28 jun. 2024, 20:29:20
    Author     : maria
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Categoria> ListaCategorias = (List<Categoria>) request.getAttribute("ListaCategorias");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <script src="https://kit.fontawesome.com/26a3cc7edf.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Categoría</title>
    </head>
    <body>

        <div class="container">
            <h1 class="mt-4">Gestión de Categorías</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorCategoria" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombre" class="form-control mr-sm-2" placeholder="Buscar por nombre" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorCategoria?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <!-- Botones para agregar categoría y mostrar todo -->
            <div class="d-flex justify-content-start mb-3">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarCategoriaModal">Agregar Categoría</button>
                <a href="MenuAdministrador.jsp" class="btn btn-outline-secondary">Volver al Menú Administrador</a>
            </div>
        </div>

        <div id="mensajeSection">
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
        </div>

        <!-- Tabla de Categorías -->
        <div class="col-sm-12">
            <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                <thead>
                    <tr style="background-color:#fff; font-weight:bold;">
                        <td style="color:black;"><center>ID</center></td>
                <td style="color:black;"><center>NOMBRE</center></td>
                <td style="color:black;"><center>DESCRIPCIÓN</center></td>
                <td style="color:black;"><center>ACCIONES</center></td>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="categoria" items="${ListaCategorias}">
                        <tr>
                            <td><center>${categoria.getIdCategoria()}</center></td>
                    <td><center>${categoria.getNombre()}</center></td>
                    <td><center>${categoria.getDescripcion()}</center></td>
                    <td>
                        <div style="display: flex;">
                            <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${categoria.getIdCategoria()}"
                               data-nombre="${categoria.getNombre()}" data-descripcion="${categoria.getDescripcion()}"><i class="fas fa-edit"></i> Editar</a>
                            <a href="ControladorCategoria?Op=Eliminar&idCategoria=${categoria.getIdCategoria()}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('¿Estás seguro de que deseas eliminar esta categoría?');">
                                <i class="fas fa-trash-alt"></i> Eliminar
                            </a>
                        </div>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>


        <!-- Modal para agregar categoría -->
        <div class="modal fade" id="agregarCategoriaModal" tabindex="-1" role="dialog" aria-labelledby="agregarCategoriaModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarCategoriaModalLabel">Agregar Categoría</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="agregarCategoriaForm" action="ControladorCategoria" method="POST">
                            <div class="form-group">
                                <label for="nombreCategoria">Nombre</label>
                                <input type="text" name="nombre" id="nombreCategoria" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="descripcionCategoria">Descripción</label>
                                <textarea name="descripcion" id="descripcionCategoria" class="form-control" required></textarea>
                            </div>
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-success">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para editar categoría -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Categoría</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" action="ControladorCategoria" method="POST">
                            <input type="hidden" name="idCategoria" id="editIdCategoria">
                            <div class="form-group">
                                <label for="editNombreCategoria">Nombre</label>
                                <input type="text" name="nombre" id="editNombreCategoria" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="editDescripcionCategoria">Descripción</label>
                                <textarea name="descripcion" id="editDescripcionCategoria" class="form-control" required></textarea>
                            </div>
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
                    var descripcion = $(this).data('descripcion');

                    $('#editIdCategoria').val(id);
                    $('#editNombreCategoria').val(nombre);
                    $('#editDescripcionCategoria').val(descripcion);
                });
            });

            function Editar() {
                document.getElementById('btnAgregar').style.display = 'none';
                document.getElementById('btnActualizar').style.display = 'block';
                document.getElementById('btnCancelarActualizacion').style.display = 'block';
            }
        </script>


    </body>
</html>
