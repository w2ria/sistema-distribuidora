<%-- 
    Document   : DetallePedido
    Created on : 14 jun. 2024, 17:36:43
    Author     : maria
--%>

<%@page import="Modelo.Producto"%>
<%@page import="Modelo.DetallesPedido"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<DetallesPedido> listaDetallesPedido = (List<DetallesPedido>) request.getAttribute("listaDetallesPedido");
    List<DetallesPedido> listaProductosDisponibles = (List<DetallesPedido>) request.getAttribute("listaProductosDisponibles");
    Map<Integer, String> mapaNombresProductos = (Map<Integer, String>) request.getAttribute("mapaNombresProductos");
    Map<Integer, String> mapaStockProductos = (Map<Integer, String>) request.getAttribute("mapaStockProductos");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <link rel="stylesheet" href="resources/css/styleTablaProducto.css">
        <script src="https://kit.fontawesome.com/26a3cc7edf.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Detalle de Pedido</title>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-4">Detalle de Pedido</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorPedido" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombreProveedor" class="form-control mr-sm-2" placeholder="Buscar por nombre de proveedor" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorPedido?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <div class="d-flex justify-content-start mb-3">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarDetallePedidoModal">Agregar Detalle Pedido</button>
                <a href="ControladorPedido?Op=Listar" class="btn btn-outline-secondary">Volver a Pedidos</a>
                <a href="MenuAdministrador.jsp" class="btn btn-outline-secondary">Volver al Menú Administrador</a>
            </div>
        </div>

        <!-- Mensajes de éxito o error -->
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

        <!-- Tabla de detalles de pedido -->
        <div class="container-fluid">
            <div class="col-12">
                <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                    <thead class="thead-dark">
                        <tr style="background-color:#fff; font-weight:bold;">
                            <td style="color:black;"><center>ID DETALLE PEDIDO</center></td>
                    <td style="color:black;"><center>ID PEDIDO</center></td>
                    <td style="color:black;"><center>PRODUCTO</center></td>
                    <td style="color:black;"><center>CANTIDAD</center></td>
                    <td style="color:black;"><center>PRECIO</center></td>
                    <td style="color:black;"><center>ACCIONES</center></td>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="detalle" items="${listaDetallesPedido}">
                            <tr data-product-id="${detalle.idProducto}" data-product-stock="${mapaStockProductos[detalle.idProducto]}">
                                <td><center>${detalle.idDetallePedido}</center></td>
                        <td><center>${detalle.idPedido}</center></td>
                        <td><center>${mapaNombresProductos.get(detalle.idProducto)}</center></td>
                        <td><center>${detalle.cantidad}</center></td>
                        <td><center>${detalle.precio}</center></td>
                        <td style="text-align: center;">
                            <div class="d-flex justify-content-center">
                                <a href="#" class="btn btn-warning editBtn" data-toggle="modal" data-target="#editarDetallePedidoModal" data-id="${detalle.idDetallePedido}">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <a href="ControladorDetallePedido?Op=Eliminar&idDetallePedido=${detalle.idDetallePedido}&idPedido=${detalle.idPedido}" class="btn btn-danger ml-2" onclick="return confirm('¿Estás seguro de que deseas eliminar este detalle de pedido? \nEste cambio también afectará al stock del producto');">
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

        <!-- Modal para agregar detalle de pedido -->
        <div class="modal fade" id="agregarDetallePedidoModal" tabindex="-1" role="dialog" aria-labelledby="agregarDetallePedidoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarDetallePedidoModalLabel">Agregar Detalle de Pedido</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="agregarDetallePedidoForm" action="ControladorDetallePedido" method="POST">
                            <div class="form-group">
                                <label for="addIdPedido">ID Pedido</label>
                                <input type="number" name="idPedido" id="addIdPedido" class="form-control" value="<%= request.getParameter("idPedido")%>" required readonly>
                            </div>
                            <div class="form-group">
                                <label for="addIdProducto">Producto</label>
                                <select name="idProducto" id="addIdProducto" class="form-control" required onchange="actualizarDatosProducto()">
                                    <option value="">Seleccionar producto</option>
                                    <c:forEach var="producto" items="${listaProductosDisponibles}">
                                        <option value="${producto.idProducto}" data-precio="${producto.precio}" data-stock="${producto.stock}">${producto.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="addCantidad">Cantidad</label>
                                <input type="number" name="cantidad" id="addCantidad" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label for="addPrecio">Precio unitario</label>
                                <input type="text" name="precio" id="addPrecio" class="form-control" required min="0" readonly>
                            </div>
                            <input type="hidden" name="stockActual" id="stockActual">
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para editar detalle de pedido -->
        <div class="modal fade" id="editarDetallePedidoModal" tabindex="-1" role="dialog" aria-labelledby="editarDetallePedidoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarDetallePedidoModalLabel">Editar Detalle de Pedido</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editarDetallePedidoForm" action="ControladorDetallePedido" method="POST">
                            <div class="form-group">
                                <label for="editIdPedido">ID Pedido</label>
                                <input type="number" name="idPedido" id="editIdPedido" class="form-control" required readonly>
                            </div>
                            <div class="form-group">
                                <label for="editNombreProducto">Producto</label>
                                <input type="text" id="editNombreProducto" name="nombreProducto" class="form-control" readonly>
                                <input type="hidden" name="idProducto" id="editIdProducto" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="editCantidad">Cantidad</label>
                                <input type="number" name="cantidad" id="editCantidad" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label for="editPrecio">Precio unitario</label>
                                <input type="text" name="precio" id="editPrecio" class="form-control" required min="0" readonly>
                            </div>
                            <input type="hidden" name="stockActual" id="editStockActual" class="form-control">
                            <input type="hidden" name="idDetallePedido" id="editIdDetallePedido" class="form-control">
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" name="accion" value="Editar" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function actualizarDatosProducto() {
                var selectProducto = document.getElementById('addIdProducto');
                var cantidadInput = document.getElementById('addCantidad');
                var stockInput = document.getElementById('stockActual');
                var precioInput = document.getElementById('addPrecio');

                var selectedOption = selectProducto.options[selectProducto.selectedIndex];
                var stock = selectedOption.getAttribute('data-stock');
                var precio = selectedOption.getAttribute('data-precio');

                cantidadInput.max = stock;
                stockInput.value = stock;
                precioInput.value = precio;

                if (cantidadInput.value > stock) {
                    cantidadInput.value = stock;
                }
            }
        </script>

        <script>
            $(document).ready(function () {
                $('.editBtn').on('click', function () {
                    var idDetallePedido = $(this).data('id');
                    var row = $(this).closest('tr');
                    var idPedido = row.find('td:eq(1)').text().trim();
                    var nombreProducto = row.find('td:eq(2)').text().trim();
                    var cantidad = parseInt(row.find('td:eq(3)').text().trim(), 10);
                    var precio = row.find('td:eq(4)').text().trim() / cantidad;
                    var idProducto = row.data('product-id');
                    var stockActual = row.data('product-stock');

                    $('#editIdDetallePedido').val(idDetallePedido);
                    $('#editIdPedido').val(idPedido);
                    $('#editIdProducto').val(idProducto);
                    $('#editNombreProducto').val(nombreProducto);
                    $('#editCantidad').val(cantidad);
                    $('#editPrecio').val(precio);
                    $('#editStockActual').val(stockActual);

                    actualizarCantidadMaxima(cantidad, stockActual);

                    $('#editarDetallePedidoModal').modal('show');
                });

                function actualizarCantidadMaxima(cantidadOriginal, stockActual) {
                    var cantidadInput = $('#editCantidad');
                    var maximoPermitido = cantidadOriginal + stockActual;
                    cantidadInput.attr('max', maximoPermitido);

                    cantidadInput.on('input', function () {
                        var cantidadIngresada = parseInt($(this).val(), 10);
                        if (cantidadIngresada > maximoPermitido) {
                            $('#cantidadError').show();
                            $(this).val(maximoPermitido);
                        } else {
                            $('#cantidadError').hide();
                        }
                    });
                }
            });
        </script>

    </body>
</html>

