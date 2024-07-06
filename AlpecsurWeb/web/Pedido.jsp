<%-- 
    Document   : Pedido
    Created on : 11 jun. 2024, 02:02:48
    Author     : maria
--%>

<%@page import="Modelo.Administrador"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.Map"%>
<%@page import="Modelo.Pedido"%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Empleado"%>
<%@page import="Modelo.EstadoPedido"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Pedido> listaPedidos = (List<Pedido>) request.getAttribute("listaPedidos");
    Map<Integer, Cliente> mapaClientes = (Map<Integer, Cliente>) request.getAttribute("mapaClientes");
    Map<Integer, Empleado> mapaEmpleados = (Map<Integer, Empleado>) request.getAttribute("mapaEmpleados");
    Map<Integer, EstadoPedido> mapaEstados = (Map<Integer, EstadoPedido>) request.getAttribute("mapaEstados");
    Usuario us = (Usuario) session.getAttribute("usuario");
    Empleado em = (Empleado) session.getAttribute("empleado");
    Administrador ad = (Administrador) session.getAttribute("admin");

    String tipoUsuario = "", nombreUsuario = "";
    Boolean esAdmin = false, esEmpleado = false;
    if (us != null) {
        if (us.getUsuario().startsWith("A") || us.getUsuario().startsWith("a")) {
            tipoUsuario = "admin";
            nombreUsuario = ad != null ? ad.getNombre() : "";
            esAdmin = true;
        } else if (us.getUsuario().startsWith("E") || us.getUsuario().startsWith("e")) {
            tipoUsuario = "empleado";
            nombreUsuario = em != null ? em.getNombre() : "";
            esEmpleado = true;
        }
    }
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
        <title>Pedidos</title>
    </head>
    <body id="bodyId">

        <div class="container">
            <h1 class="mt-4">Gestión de Pedidos</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" id="busquedaForm">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" id="buscador" name="nombreProveedor" class="form-control mr-sm-2" placeholder="Buscar por nombre de cliente" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorPedido?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <!-- Botones para agregar Pedido y volver al menú -->
            <div class="d-flex justify-content-start mb-3">
                <div class="d-flex align-items-center justify-content-center" >
                    <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarPedidoModal">Agregar Pedido</button>
                    <a href="<%= urlMenu%>" class="btn btn-outline-secondary">Volver al Menú</a>
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

        <!-- Definir datos del usuario en un elemento HTML -->
        <div id="userData" "
             data-tipo-usuario="<%= tipoUsuario%>"
             data-nombre-usuario="<%= nombreUsuario%>"
    </div>

    <div class="container-fluid">
        <div class="col-12">
            <br>
            <% if ("empleado".equals(tipoUsuario)) {%>
            <h2>Listado de Pedidos para <%= em.getNombre()%></h2>
            <% } %>
            <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;" id="tablaPedidos">
                <thead>
                    <tr style="background-color: #fff; font-weight: bold;">
                        <td style="color: black;"><center>ID Pedido</center></td>
                <td style="color: black;"><center>Cliente</center></td>
                <td style="color: black;"><center>Dirección</center></td>
                <td style="color: black;"><center>Empleado</center></td>
                <td style="color: black;"><center>Tipo Comprobante</center></td>
                <td style="color: black;"><center>Número Comprobante</center></td>
                <td style="color: black;"><center>Fecha</center></td>
                <td style="color: black;"><center>Total</center></td>
                <td style="color: black;"><center>Estado</center></td>
                <td style="color: black;"><center>Detalle de Pedido</center></td>
                <td style="color: black;"><center>Acciones</center></td>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="pedido" items="${listaPedidos}">
                        <tr class="articulos">
                            <td>${pedido.getIdPedido()}</td>
                            <td data-id="${pedido.getIdCliente()}">${mapaClientes[pedido.getIdCliente()].getNombre()}</td>
                            <td>${mapaClientes[pedido.getIdCliente()].getDireccion()}</td>
                            <td data-id="${pedido.getIdEmpleado()}">${mapaEmpleados[pedido.getIdEmpleado()].getNombre()}</td>
                            <td>${pedido.getTipoComprobante()}</td>
                            <td>${pedido.getNumComprobante()}</td>
                            <td>${pedido.getFecha()}</td>
                            <td>${pedido.getTotal()}</td>
                            <td data-id="${pedido.getIdEstadoPedido()}">${mapaEstados[pedido.getIdEstadoPedido()].getNombre()}</td>
                            <td><center><a href="ControladorDetallePedido?Op=Listar&idPedido=${pedido.getIdPedido()}"><i class="fa-solid fa-eye"></i> Ver</a></center></td>
                    <td>
                        <div style="display: flex;">
                            <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal"><i class="fas fa-edit"></i> Editar</a>
                            <a href="#" class="btn btn-danger" style="margin-left: 5px;" data-toggle="modal" data-target="#confirmDeleteModal" data-id="${pedido.getIdPedido()}">
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

    <!-- Modal para agregar pedido -->
    <div class="modal fade" id="agregarPedidoModal" tabindex="-1" role="dialog" aria-labelledby="agregarPedidoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="agregarPedidoModalLabel">Agregar Pedido</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ControladorPedido" method="POST">
                        <input type="hidden" name="accion" value="Agregar">
                        <div class="form-group">
                            <label for="agregarCliente">Cliente</label>
                            <select name="cliente" id="agregarCliente" class="form-control" required>
                                <option value="">Seleccionar cliente</option>
                                <% for (Map.Entry<Integer, Cliente> entry : mapaClientes.entrySet()) {
                                        Cliente cliente = entry.getValue();
                                %>
                                <option value="<%= cliente.getIdCliente()%>"><%= cliente.getNombre()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="agregarEmpleado">Empleado</label>
                            <select name="empleado" id="agregarEmpleado" class="form-control">
                                <option value="0">Seleccionar empleado</option>
                                <% for (Map.Entry<Integer, Empleado> entry : mapaEmpleados.entrySet()) {%>
                                <option value="<%= entry.getValue().getIdEmpleado()%>"><%= entry.getValue().getNombre()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="agregarTipoComprobante">Tipo de Comprobante</label>
                            <select name="tipoComprobante" id="agregarTipoComprobante" class="form-control" required>
                                <option value="Factura Electronica">Factura Electrónica (FE)</option>
                                <option value="Boleta de Venta Electronica">Boleta de Venta Electrónica (BVE)</option>
                                <option value="Nota de Credito Electronica">Nota de Crédito Electrónica (NCE)</option>
                                <option value="Nota de Debito Electronica">Nota de Débito Electrónica (NDE)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="agregarFecha">Fecha</label>
                            <input type="date" name="fecha" id="agregarFecha" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="agregarTotal">Total</label>
                            <input type="number" step="1.0000" name="total" id="agregarTotal" class="form-control" value="0" min="0" required>
                        </div>
                        <div class="form-group">
                            <label for="agregarEstado">Estado</label>
                            <select name="estado" id="agregarEstado" class="form-control" required>
                                <% for (Map.Entry<Integer, EstadoPedido> entry : mapaEstados.entrySet()) {
                                        EstadoPedido estado = entry.getValue();
                                %>
                                <option value="<%= estado.getIdEstadoPedido()%>"><%= estado.getNombre()%></option>
                                <% }%>
                            </select>
                        </div>
                        <div style="display: flex; justify-content: center;">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para editar pedido -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Editar Pedido</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ControladorPedido" method="POST">
                        <input type="hidden" name="accion" value="Editar">
                        <input type="hidden" name="idPedido" id="editIdPedido">
                        <div class="form-group">
                            <label for="editCliente">Cliente</label>
                            <select name="cliente" id="editCliente" class="form-control" required>
                                <option value="">Seleccionar cliente</option>
                                <% for (Map.Entry<Integer, Cliente> entry : mapaClientes.entrySet()) {
                                        Cliente cliente = entry.getValue();
                                %>
                                <option value="<%= cliente.getIdCliente()%>"><%= cliente.getNombre()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="editEmpleado">Empleado</label>
                            <select name="empleado" id="editEmpleado" class="form-control">
                                <option value="0">Seleccionar empleado</option>
                                <% for (Map.Entry<Integer, Empleado> entry : mapaEmpleados.entrySet()) {%>
                                <option value="<%= entry.getValue().getIdEmpleado()%>"><%= entry.getValue().getNombre()%></option>
                                <% } %>
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
                            <input type="number" step="1.0000" name="total" id="editTotal" class="form-control" value="0" min="0" required readonly>
                        </div>
                        <div class="form-group">
                            <label for="editEstado">Estado</label>
                            <select name="estado" id="editEstado" class="form-control" required>
                                <% for (Map.Entry<Integer, EstadoPedido> entry : mapaEstados.entrySet()) {
                                        EstadoPedido estado = entry.getValue();
                                %>
                                <option value="<%= estado.getIdEstadoPedido()%>"><%= estado.getNombre()%></option>
                                <% }%>
                            </select>
                        </div>
                        <div style="display: flex; justify-content: center;">
                            <input type="submit" name="accion" value="Editar" class="btn btn-info">
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
                <form id="deleteForm" action="ControladorPedido" method="POST">
                    <input type="hidden" id="idPedidoHiddenField" name="idPedido">
                    <input type="hidden" id="detallePedidoCount" name="detallePedidoCount" value="0">
                    <div class="modal-body" id="modalBody">
                        ¿Está seguro de que desea eliminar este pedido?
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
                <form id="deleteDetailsForm" action="ControladorPedido" method="POST">
                    <input type="hidden" id="idPedidoHiddenFieldSecond" name="idPedido">
                    <input type="hidden" id="detallePedidooCountModal" name="detallePedidoCount">
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
                var row = $(this).closest('tr');
                var idPedido = row.find('td:eq(0)').text().trim();
                var clienteNombre = row.find('td:eq(1)').text().trim();
                var empleadoNombre = row.find('td:eq(3)').text().trim();
                var tipoComprobante = row.find('td:eq(4)').text().trim();
                var numComprobante = row.find('td:eq(5)').text().trim();
                var fecha = row.find('td:eq(6)').text().trim();
                var total = row.find('td:eq(7)').text().trim();
                var estadoNombre = row.find('td:eq(8)').text().trim();

                $('#editIdPedido').val(idPedido);

                $('#editCliente option').each(function () {
                    if ($(this).text().trim() == clienteNombre) {
                        $(this).prop('selected', true);
                    }
                });

                $('#editEmpleado option').each(function () {
                    if ($(this).text().trim() == empleadoNombre) {
                        $(this).prop('selected', true);
                    }
                });

                $('#editTipoComprobante option').each(function () {
                    if ($(this).text().trim().includes(tipoComprobante)) {
                        $(this).prop('selected', true);
                    }
                });
                $('#editNumComprobante').val(numComprobante);
                $('#editFecha').val(fecha);
                $('#editTotal').val(total);

                $('#editEstado option').each(function () {
                    if ($(this).text().trim() == estadoNombre) {
                        $(this).prop('selected', true);
                    }
                });

                $('#editModal').modal('show');
            });
        });
    </script>

    <!-- Scripts para manejar los modals y las solicitudes AJAX -->
    <script>
        $(document).ready(function () {
            $('#confirmDeleteModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var idPedido = button.data('id');
                $('#idPedidoHiddenField').val(idPedido);
            });

            $('#confirmDeleteDetailsModal').on('show.bs.modal', function (event) {
                var idPedido = $('#idPedidoHiddenField').val();
                $('#idPedidoHiddenFieldSecond').val(idPedido);

                // Obtener y establecer el valor de detallePedidoCount
                var detallePedidoCount = $('#detallePedidoCount').val();
                $('#detallePedidoCountModal').val(detallePedidoCount);
            });

            $('#deleteForm').on('submit', function (event) {
                event.preventDefault();
                var idPedido = $('#idPedidoHiddenField').val();
                $.ajax({
                    url: 'ControladorPedido',
                    method: 'GET',
                    data: {
                        Op: 'ContarDetalles',
                        idPedido: idPedido
                    },
                    success: function (response) {
                        var detallePedidoCount = parseInt(response.detallePedidoCount);
                        $('#detallePedidoCount').val(detallePedidoCount);
                        if (detallePedidoCount > 0) {
                            $('#mensajeDetalles').text('Este pedido contiene ' + detallePedidoCount + ' detalle(s) de pedido. ¿Está seguro de que desea eliminarlos también?');
                            $('#confirmDeleteDetailsModal').modal('show');
                        } else {
                            // AJAX para eliminar el pedido
                            $.ajax({
                                url: 'ControladorPedido',
                                method: 'POST',
                                data: {
                                    accion: 'Eliminar',
                                    idPedido: idPedido
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
                        alert('Hubo un error al contar los detalles del pedido. Por favor, inténtelo nuevamente.');
                    }
                });
            });
        });
    </script>

    <script src="resources/js/filtrarListadoPedidos.js"></script>
</body>
</html>
