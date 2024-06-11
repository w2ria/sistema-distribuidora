<%-- 
    Document   : DetalleIngreso
    Created on : 6 jun. 2024, 16:29:02
    Author     : maria
--%>


<%@page import="Modelo.Producto"%>
<%@page import="Modelo.DetalleIngreso"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<DetalleIngreso> ListaDetalleIngresos = (List<DetalleIngreso>) request.getAttribute("ListaDetalleIngresos");
    List<Producto> ListaProductos = (List<Producto>) request.getAttribute("ListaProductos");
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <link rel="stylesheet" href="resources/css/styleTablaProducto.css">
        <script src="https://kit.fontawesome.com/26a3cc7edf.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Detalle de Ingreso</title>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-4">Detalle de Ingreso</h1>

            <!-- Formulario de búsqueda -->
            <form class="form-inline my-3" action="ControladorIngreso" method="GET">
                <input type="hidden" name="Op" value="Buscar">
                <input type="text" name="nombreProveedor" class="form-control mr-sm-2" placeholder="Buscar por nombre de proveedor" required>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Buscar</button>
                <a href="ControladorIngreso?Op=Listar" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Mostrar Todo</a>
            </form>

            <div class="d-flex justify-content-start mb-3">
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarIngresoModal">Agregar Detalle Ingreso</button>
                <a href="ControladorIngreso?Op=Listar" class="btn btn-outline-secondary">Volver a Ingresos</a>
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

        <!-- Tabla de detalle de ingresos -->
        <div class="container-fluid">
            <div class="col-12">
                <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
                    <thead>
                        <tr style="background-color:#fff; font-weight:bold;">
                            <td style="color:black;"><center>ID DETALLE</center></td>
                    <td style="color:black;"><center>ID INGRESO</center></td>
                    <td style="color:black;"><center>PRODUCTO</center></td>
                    <td style="color:black;"><center>CANTIDAD</center></td>
                    <td style="color:black;"><center>STOCK ACTUAL</center></td>
                    <td style="color:black;"><center>PRECIO</center></td>
                    <td style="color:black;"><center>FECHA VENCIMIENTO</center></td>
                    <td style="color:black;"><center>ACCIONES</center></td>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="detalle" items="${ListaDetalleIngresos}">
                            <tr>
                                <td><center>${detalle.getIdDetalleIngreso()}</center></td>
                        <td><center class="id-ingreso">${detalle.getIdIngreso().getIdIngreso()}</center></td>
                        <td><center>${detalle.getIdProducto().getNombre()}</center></td>
                        <td><center>${detalle.getCantidad()}</center></td>
                        <td><center>${detalle.getStockActual()}</center></td>
                        <td><center>${detalle.getPrecio()}</center></td>
                        <td><center>${detalle.getFechaVencimiento()}</center></td>
                        <td>
                            <div style="display: flex;">
                                <a class="btn btn-warning editBtn" data-toggle="modal" data-target="#editModal" data-id="${detalle.getIdDetalleIngreso()}"><i class="fas fa-edit"></i> Editar</a>
                                <a href="ControladorDetalleIngreso?Op=Eliminar&idDetalleIngreso=${detalle.getIdDetalleIngreso()}&idIngreso=${detalle.getIdIngreso().getIdIngreso()}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('¿Estás seguro de que deseas eliminar este detalle de ingreso? \nEste cambio también afectará al stock del producto');">
                                    <i class="fas fa-trash-alt"></i> Eliminar
                                </a>
                            </div>
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Modal para agregar detalle de ingreso -->
            <div class="modal fade" id="agregarIngresoModal" tabindex="-1" role="dialog" aria-labelledby="agregarIngresoModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="agregarIngresoModalLabel">Agregar Detalle de Ingreso</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="agregarForm" action="ControladorDetalleIngreso" method="POST">
                                <div class="form-group">
                                    <label for="addIdIngreso">ID Ingreso</label>
                                    <input type="number" name="idIngreso" id="addIdIngreso" class="form-control" required readonly>
                                </div>
                                <div class="form-group">
                                    <label for="addIdProducto">Producto</label>
                                    <select name="idProducto" id="addIdProducto" class="form-control" required>
                                        <option value="">Seleccionar producto</option>
                                        <% for (Producto producto : (List<Producto>) request.getAttribute("ListaProductos")) {%>
                                        <option value="<%= producto.getIdProducto()%>"><%= producto.getNombre()%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="addCantidad">Cantidad</label>
                                    <input type="number" name="cantidad" id="addCantidad" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="addPrecio">Precio</label>
                                    <input type="text" name="precio" id="addPrecio" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="addFechaVencimiento">Fecha Vencimiento</label>
                                    <input type="date" name="fechaVencimiento" id="addFechaVencimiento" class="form-control" required min="0">
                                </div>
                                <div style="display: flex; justify-content: center;">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal para editar detalle de ingreso -->
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Editar Detalle de Ingreso</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="editForm" action="ControladorDetalleIngreso" method="POST">
                                <input type="hidden" name="idDetalleIngreso" id="editIdDetalleIngreso">
                                <input type="hidden" name="idIngreso" value="<%= request.getParameter("idIngreso")%>">
                                <div class="form-group">
                                    <label for="editIdProducto">Producto</label>
                                    <select name="idProducto" id="editIdProducto" class="form-control" required readonly>
                                        <option value="">Seleccionar producto</option>
                                        <% for (Producto producto : (List<Producto>) request.getAttribute("ListaProductos")) {%>
                                        <option value="<%= producto.getIdProducto()%>"><%= producto.getNombre()%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editCantidad">Cantidad</label>
                                    <input type="number" name="cantidad" id="editCantidad" class="form-control" required min="0" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="editStockActual">Stock Actual</label>
                                    <input type="number" name="stockActual" id="editStockActual" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="editPrecio">Precio</label>
                                    <input type="text" name="precio" id="editPrecio" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label for="editFechaVencimiento">Fecha Vencimiento</label>
                                    <input type="date" name="fechaVencimiento" id="editFechaVencimiento" class="form-control" required>
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
                        var idProducto = $(this).closest('tr').find('td:eq(2)').text().trim();
                        var cantidad = $(this).closest('tr').find('td:eq(3)').text().trim();
                        var stockActual = $(this).closest('tr').find('td:eq(4)').text().trim();
                        var precio = $(this).closest('tr').find('td:eq(5)').text().trim();
                        var fechaVencimiento = $(this).closest('tr').find('td:eq(6)').text().trim();

                        $('#editIdDetalleIngreso').val(id);
                        $('#editCantidad').val(cantidad);
                        $('#editStockActual').val(stockActual);
                        $('#editPrecio').val(precio);
                        $('#editFechaVencimiento').val(fechaVencimiento);

                        // Encuentra el option en el select que tiene el nombre del producto y selecciónalo
                        $('#editIdProducto option').filter(function () {
                            return $(this).text().trim() === idProducto;
                        }).prop('selected', true);
                    });
                });
            </script>

            <script>
                $(document).ready(function () {
                    function getParameterByName(name) {
                        let url = new URL(window.location.href);
                        return url.searchParams.get(name);
                    }

                    let idIngreso = getParameterByName('idIngreso');

                    $('#btnAgregar').on('click', function () {
                        if (idIngreso) {
                            $('#addIdIngreso').val(idIngreso);
                        }
                    });
                });
            </script>

            <script>
                var cantidadInput = document.getElementById('editCantidad');
                var stockActualInput = document.getElementById('editStockActual');

                stockActualInput.addEventListener('change', function () {
                    var cantidad = parseFloat(cantidadInput.value);
                    var stockActual = parseFloat(stockActualInput.value);

                    if (stockActual > cantidad) {
                        alert('El stock actual no puede ser mayor que la cantidad.');
                        stockActualInput.value = '';
                        stockActualInput.focus();
                    }
                });
            </script>

    </body>
</html>
