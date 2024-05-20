
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Administrador> ListaAdministradores = (List<Administrador>) request.getAttribute("ListaAdministradores");
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
        <title>Administrador</title>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-4">Gestión de Administrador</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorAdministrador" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombre" class="form-control mr-sm-2" placeholder="Buscar por nombre" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorAdministrador?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <!-- Botones para agregar administrador, mostrar todo y navegar al menú de administrador -->
            <div class="d-flex justify-content-start mb-3">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarAdministradorModal">Agregar Administrador</button>
                <a href="MenuAdministrador.jsp" class="btn btn-outline-secondary">Volver a Menu Administrador</a>
            </div>

            <!-- Tabla de administradores -->
            <div class="d-flex">
                <div class="col-sm-12">
                    <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                        <thead>
                            <tr style="background-color:#fff; font-weight:bold;">
                                <td style="color:black;"><center>ID</center></td>
                        <td style="color:black;"><center>NOMBRES</center></td>
                        <td style="color:black;"><center>TIPO DOCUMENTO</center></td>
                        <td style="color:black;"><center>N° DOCUMENTO</center></td>
                        <td style="color:black;"><center>DIRECCIÓN</center></td>
                        <td style="color:black;"><center>TELÉFONO</center></td>
                        <td style="color:black;"><center>EMAIL</center></td>
                        <td style="color:black;"><center>ACCIONES</center></td>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="administrador" items="${ListaAdministradores}">
                                <tr>
                                    <td><center>${administrador.getIdAdministrador()}</center></td>
                            <td><center>${administrador.getNombre()}</center></td>
                            <td><center>${administrador.getTipoDocumento()}</center></td>
                            <td><center>${administrador.getNumDocumento()}</center></td>
                            <td><center>${administrador.getDireccion()}</center></td>
                            <td><center>${administrador.getTelefono()}</center></td>
                            <td><center>${administrador.getEmail()}</center></td>
                            <td>
                                <div style="display: flex;">
                                    <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${administrador.getIdAdministrador()}"
                                       data-nombre="${administrador.getNombre()}" data-tipo-documento="${administrador.getTipoDocumento()}"
                                       data-num-documento="${administrador.getNumDocumento()}" data-direccion="${administrador.getDireccion()}"
                                       data-telefono="${administrador.getTelefono()}" data-email="${administrador.getEmail()}"><i class="fas fa-edit"></i> Editar</a>
                                    <a href="ControladorAdministrador?Op=Eliminar&idAdministrador=${administrador.getIdAdministrador()}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('¿Estás seguro de que deseas eliminar este administrador?');">
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

            <!-- Modal para agregar administrador -->
            <div class="modal fade" id="agregarAdministradorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Administrador</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ControladorAdministrador" method="POST">
                                <div class="form-group">
                                    <label for="txtUsuario">Usuario</label>
                                    <input type="text" name="usuario" id="txtUsuario" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtClave">Clave</label>
                                    <input type="password" name="clave" id="txtClave" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtNombre">Nombre</label>
                                    <input type="text" name="nombre" id="txtNombre" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtTipoDocumento">Tipo de Documento</label>
                                    <input type="text" name="tipoDocumento" id="txtTipoDocumento" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtNumDocumento">Número de Documento</label>
                                    <input type="text" name="numDocumento" id="txtNumDocumento" class="form-control" required pattern="[0-9]+" title="Por favor, introduce solo números">
                                </div>
                                <div class="form-group">
                                    <label for="txtDireccion">Dirección</label>
                                    <input type="text" name="direccion" id="txtDireccion" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtTelefono">Teléfono</label>
                                    <input type="text" name="telefono" id="txtTelefono" class="form-control" pattern="[0-9]+" title="Por favor, introduce solo números">
                                </div>
                                <div class="form-group">
                                    <label for="txtEmail">Email</label>
                                    <input type="email" name="email" id="txtEmail" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Por favor, introduce una dirección de correo electrónico válida" required>
                                </div>
                                <div style="display: flex; justify-content: center;">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal para editar administrador -->
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Editar Administrador</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="editForm" action="ControladorAdministrador" method="POST">
                                <input type="hidden" name="idAdministrador" id="editIdAdministrador">
                                <div class="form-group">
                                    <label for="editNombre">Nombre</label>
                                    <input type="text" name="nombre" id="editNombre" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="editTipoDocumento">Tipo de Documento</label>
                                    <input type="text" name="tipoDocumento" id="editTipoDocumento" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="editNumDocumento">Número de Documento</label>
                                    <input type="text" name="numDocumento" id="editNumDocumento" class="form-control" required pattern="[0-9]+" title="Por favor, introduce solo números">
                                </div>
                                <div class="form-group">
                                    <label for="editDireccion">Dirección</label>
                                    <input type="text" name="direccion" id="editDireccion" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="editTelefono">Teléfono</label>
                                    <input type="text" name="telefono" id="editTelefono" class="form-control" pattern="[0-9]+" title="Por favor, introduce solo números">
                                </div>
                                <div class="form-group">
                                    <label for="editEmail">Email</label>
                                    <input type="email" name="email" id="editEmail" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Por favor, introduce una dirección de correo electrónico válida" required>
                                </div>
                                <div style="display: flex; justify-content: center;">
                                    <input type="submit" name="accion" value="Editar" class="btn btn-success">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Scripts de JavaScript -->
            <script>
                $(document).ready(function () {
                    $('.editBtn').on('click', function () {
                        var id = $(this).data('id');
                        var nombre = $(this).data('nombre');
                        var tipoDocumento = $(this).data('tipo-documento');
                        var numDocumento = $(this).data('num-documento');
                        var direccion = $(this).data('direccion');
                        var telefono = $(this).data('telefono');
                        var email = $(this).data('email');

                        $('#editIdAdministrador').val(id);
                        $('#editNombre').val(nombre);
                        $('#editTipoDocumento').val(tipoDocumento);
                        $('#editNumDocumento').val(numDocumento);
                        $('#editDireccion').val(direccion);
                        $('#editTelefono').val(telefono);
                        $('#editEmail').val(email);
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
        </div>
    </body>
</html>
