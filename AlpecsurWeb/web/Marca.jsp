<%-- 
    Document   : Marca
    Created on : 28 jun. 2024, 18:48:45
    Author     : maria
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelo.Marca"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Marca> ListaMarcas = (List<Marca>) request.getAttribute("ListaMarcas");
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
        <title>Marca</title>
    </head>
    <body>

        <div class="container">
            <h1 class="mt-4">Gestión de Marcas</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorMarca" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombre" class="form-control mr-sm-2" placeholder="Buscar por nombre" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorMarca?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <!-- Botones para agregar marca y mostrar todo -->
            <div class="d-flex justify-content-start mb-3">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarMarcaModal">Agregar Marca</button>
                <a href="MenuAdministrador.jsp" class="btn btn-outline-secondary">Volver al Menu Administrador</a>
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

        <!-- Tabla de marcas -->
        <div class="d-flex">
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
                        <c:forEach var="marca" items="${ListaMarcas}">
                            <tr>
                                <td><center>${marca.getIdMarca()}</center></td>
                        <td><center>${marca.getNombre()}</center></td>
                        <td><center>${marca.getDescripcion()}</center></td>
                        <td>
                            <div style="display: flex;">
                                <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${marca.getIdMarca()}"
                                   data-nombre="${marca.getNombre()}" data-descripcion="${marca.getDescripcion()}"><i class="fas fa-edit"></i> Editar</a>
                                <a href="ControladorMarca?Op=Eliminar&idMarca=${marca.getIdMarca()}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('¿Estás seguro de que deseas eliminar esta marca?');">
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

        <!-- Modal para agregar marca -->
        <div class="modal fade" id="agregarMarcaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Marca</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorMarca" method="POST">
                            <div class="form-group">
                                <label for="txtNombre">Nombre</label>
                                <input type="text" name="nombre" id="txtNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtDescripcion">Descripción</label>
                                <textarea name="descripcion" id="txtDescripcion" class="form-control" required></textarea>
                            </div>
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para editar marca -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Marca</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" action="ControladorMarca" method="POST">
                            <input type="hidden" name="idMarca" id="editIdMarca">
                            <div class="form-group">
                                <label for="editNombre">Nombre</label>
                                <input type="text" name="nombre" id="editNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="editDescripcion">Descripción</label>
                                <textarea name="descripcion" id="editDescripcion" class="form-control" required></textarea>
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

                    $('#editIdMarca').val(id);
                    $('#editNombre').val(nombre);
                    $('#editDescripcion').val(descripcion);
                });
            });
        </script>

        <script>
            function Editar() {
                document.getElementById('btnAgregar').style.display = 'none';
                document.getElementById('btnActualizar').style.display = 'block';
                document.getElementById('btnCancelarActualizacion').style.display = 'block';
            }
        </script>

    </body>
</html>
