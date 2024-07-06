<%-- 
    Document   : csac
    Created on : 6 jun. 2024, 01:27:44
    Author     : maria
--%>

<%@page import="Modelo.Administrador"%>
<%@page import="Modelo.Empleado"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Proveedor"%>
<%@page import="Modelo.Ingreso"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Ingreso> ListaIngresos = (List<Ingreso>) request.getAttribute("ListaIngresos");
    List<Proveedor> ListaProveedores = (List<Proveedor>) request.getAttribute("ListaProveedores");
    Usuario us = (Usuario) session.getAttribute("usuario");
    Empleado em = (Empleado) session.getAttribute("empleado");
    Administrador ad = (Administrador) session.getAttribute("admin");
    boolean esAdmin = us != null && (us.getUsuario().startsWith("A") || us.getUsuario().startsWith("a"));
    boolean esEmpleado = us != null && (us.getUsuario().startsWith("E") || us.getUsuario().startsWith("e"));
    String urlMenu = esAdmin ? "MenuAdministrador.jsp" : (esEmpleado ? "MenuEmpleado.jsp" : "login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <link rel="stylesheet" href="resources/css/styleTablaProducto.css">
        <script src="https://kit.fontawesome.com/26a3cc7edf.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Ingresos</title>
    </head>
    <body id="bodyId">
        
        <div class="container">
            <h1 class="mt-4">Gestión de Ingresos</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorIngreso" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombreProveedor" class="form-control mr-sm-2" placeholder="Buscar por nombre de proveedor" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorIngreso?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <!-- Botones para agregar ingreso y volver al menú -->
            <div class="d-flex justify-content-start mb-3">
                <div class="d-flex align-items-center">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarIngresoModal">Agregar Ingreso</button>
                <a href="<%= urlMenu %>" class="btn btn-outline-secondary mx-auto">Volver al Menú</a>
                </div>
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

        <!-- Tabla de ingresos -->
        <div class="container-fluid">
            <div class="col-12">
                <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                    <thead>
                        <tr style="background-color:#fff; font-weight:bold;">
                            <td style="color:black;"><center>ID</center></td>
                    <td style="color:black;"><center>PROVEEDOR</center></td>
                    <td style="color:black;"><center>TIPO COMPROBANTE</center></td>
                    <td style="color:black;"><center>N° COMPROBANTE</center></td>
                    <td style="color:black;"><center>FECHA</center></td>
                    <td style="color:black;"><center>TOTAL</center></td>
                    <td style="color:black;"><center>DETALLE INGRESO</center></td>
                    <td style="color:black;"><center>ACCIONES</center></td>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ingreso" items="${ListaIngresos}">
                            <tr>
                                <td><center>${ingreso.getIdIngreso()}</center></td>
                        <td><center>${ingreso.getIdProveedor().getNombre()}</center></td>
                        <td><center>${ingreso.getTipoComprobante()}</center></td>
                        <td><center>${ingreso.getNumComprobante()}</center></td>
                        <td><center>${ingreso.getFecha()}</center></td>
                        <td><center>${ingreso.getTotal()}</center></td>
                        <td><center><a href="ControladorDetalleIngreso?Op=Listar&idIngreso=${ingreso.getIdIngreso()}"><i class="fa-solid fa-eye"></i> Ver</a></center></td>
                        <td>
                            <div style="display: flex;">
                                <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${ingreso.getIdIngreso()}"><i class="fas fa-edit"></i> Editar</a>
                                <a href="#" class="btn btn-danger" style="margin-left: 5px;" data-toggle="modal" data-target="#confirmDeleteModal" data-id="${ingreso.getIdIngreso()}">
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

        <!-- Modal para agregar ingreso -->
        <div class="modal fade" id="agregarIngresoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Ingreso</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorIngreso" method="POST">
                            <div class="form-group">
                                <label for="editIdProveedor">Proveedor</label>
                                <select name="idProveedor" id="agregarIdProveedor" class="form-control" required>
                                    <option value="">Seleccionar proveedor</option>
                                    <% for (Proveedor proveedor : (List<Proveedor>) request.getAttribute("ListaProveedores")) {%>
                                    <option value="<%= proveedor.getIdProveedor()%>"><%= proveedor.getNombre()%></option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="agregarTxtTipoComprobante">Tipo de Comprobante</label>
                                <select name="tipoComprobante" id="agregarTxtTipoComprobante" class="form-control" required>
                                    <option value="Factura Electronica">Factura Electrónica (FE)</option>
                                    <option value="Boleta de Venta Electronica">Boleta de Venta Electrónica (BVE)</option>
                                    <option value="Nota de Credito Electronica">Nota de Crédito Electrónica (NCE)</option>
                                    <option value="Nota de Debito Electronica">Nota de Débito Electrónica (NDE)</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="txtFecha">Fecha</label>
                                <input type="date" name="fecha" id="txtFecha" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="txtTotal">Total</label>
                                <input type="number" name="total" id="txtTotal" class="form-control" value="0">
                            </div>
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para editar ingreso -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Ingreso</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" action="ControladorIngreso" method="POST">
                            <input type="hidden" name="idIngreso" id="editIdIngreso">
                            <div class="form-group">
                                <label for="editIdProveedor">Proveedor</label>
                                <select name="idProveedor" id="editIdProveedor" class="form-control" required>
                                    <option value="">Seleccionar proveedor</option>
                                    <% for (Proveedor proveedor : (List<Proveedor>) request.getAttribute("ListaProveedores")) {%>
                                    <option value="<%= proveedor.getIdProveedor()%>"><%= proveedor.getNombre()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="editTipoComprobante">Tipo de Comprobante</label>
                                <select name="tipoComprobante" id="editTipoComprobante" class="form-control" required>
                                    <option value="Factura Electronica">Factura Electrónica (FE)</option>
                                    <option value="Boleta de Venta Electronica">Boleta de Venta Electrónica (BVE)</option>
                                    <option value="Nota de Credito Electronica">Nota de Crédito Electrónica (NCE)</option>
                                    <option value="Nota de Debito Electronica">Nota de Débito Electrónica (NDE)</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="editNumComprobante">Número de Comprobante</label>
                                <input type="text" name="numComprobante" id="editNumComprobante" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="editFecha">Fecha</label>
                                <input type="date" name="fecha" id="editFecha" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="editTotal">Total</label>
                                <input type="number" name="total" id="editTotal" class="form-control" required readonly>
                            </div>
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" name="accion" value="Editar" class="btn btn-success">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Primer modal de confirmación -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="deleteForm" action="ControladorIngreso" method="POST">
                        <input type="hidden" id="idIngresoHiddenField" name="idIngreso">
                        <input type="hidden" id="detalleIngresoCount" name="detalleIngresoCount" value="0">
                        <div class="modal-body" id="modalBody">
                            ¿Está seguro de que desea eliminar este ingreso?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <input type="submit" name="Op" value="ContarDetalles" class="btn btn-danger">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Segundo modal de confirmación -->
        <div class="modal fade" id="confirmDeleteDetailsModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteDetailsModalLabel">Confirmar Eliminación de Detalles</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="deleteDetailsForm" action="ControladorIngreso" method="POST">
                        <input type="hidden" id="idIngresoHiddenFieldSecond" name="idIngreso">
                        <input type="hidden" id="detalleIngresoCountModal" name="detalleIngresoCount">
                        <div class="modal-body">
                            <p id="mensajeDetalles"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <input type="submit" name="accion" value="Eliminar" class="btn btn-danger">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('.editBtn').on('click', function () {
                    var id = $(this).data('id');
                    var idProveedor = $(this).closest('tr').find('td:eq(1)').text().trim();
                    var tipoComprobante = $(this).closest('tr').find('td:eq(2)').text().trim();
                    var numComprobante = $(this).closest('tr').find('td:eq(3)').text().trim();
                    var fecha = $(this).closest('tr').find('td:eq(4)').text().trim();
                    var total = $(this).closest('tr').find('td:eq(5)').text().trim();

                    $('#editIdIngreso').val(id);
                    $('#editIdProveedor option').filter(function () {
                        return $(this).text() === idProveedor;
                    }).prop('selected', true);
                    $('#editTipoComprobante').val(tipoComprobante);
                    $('#editNumComprobante').val(numComprobante);
                    $('#editFecha').val(fecha);
                    $('#editTotal').val(total);
                });
            });
        </script>

        <!-- Scripts para manejar los modals y las solicitudes AJAX -->
        <script>
            $(document).ready(function () {
                $('#confirmDeleteModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget);
                    var idIngreso = button.data('id');
                    $('#idIngresoHiddenField').val(idIngreso);
                });

                $('#confirmDeleteDetailsModal').on('show.bs.modal', function (event) {
                    var idIngreso = $('#idIngresoHiddenField').val();
                    $('#idIngresoHiddenFieldSecond').val(idIngreso);

                    // Obtener y establecer el valor de detalleIngresoCount
                    var detalleIngresoCount = $('#detalleIngresoCount').val();
                    $('#detalleIngresoCountModal').val(detalleIngresoCount);
                });

                $('#deleteForm').on('submit', function (event) {
                    event.preventDefault();
                    var idIngreso = $('#idIngresoHiddenField').val();
                    $.ajax({
                        url: 'ControladorIngreso',
                        method: 'GET',
                        data: {
                            Op: 'ContarDetalles',
                            idIngreso: idIngreso
                        },
                        success: function (response) {
                            var detalleIngresoCount = parseInt(response.detalleIngresoCount);
                            $('#detalleIngresoCount').val(detalleIngresoCount);
                            if (detalleIngresoCount > 0) {
                                $('#mensajeDetalles').text('Este ingreso contiene ' + detalleIngresoCount + ' detalle(s) de ingreso. ¿Está seguro de que desea eliminarlos también?');
                                $('#confirmDeleteDetailsModal').modal('show');
                            } else {
                                // AJAX para eliminar el ingreso
                                $.ajax({
                                    url: 'ControladorIngreso',
                                    method: 'POST',
                                    data: {
                                        accion: 'Eliminar',
                                        idIngreso: idIngreso
                                    },
                                    success: function (response) {
                                        $('#bodyId').empty();
                                        $('#bodyId').html(response);
                                    },
                                    error: function () {
                                        alert('Hubo un error al realizar otra operación. Por favor, inténtelo nuevamente.');
                                    }
                                });
                            }
                        },
                        error: function () {
                            alert('Hubo un error al contar los detalles de ingreso. Por favor, inténtelo nuevamente.');
                        }
                    });
                });
            });
        </script>

    </body>
</html>
