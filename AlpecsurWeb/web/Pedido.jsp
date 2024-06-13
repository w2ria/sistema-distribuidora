<%-- 
    Document   : Pedido
    Created on : 11 jun. 2024, 02:02:48
    Author     : maria
--%>

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
    <body>

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
                <button type="button" class="btn btn-info mr-2" id="btnAgregar" data-toggle="modal" data-target="#agregarIngresoModal">Agregar Ingreso</button>
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

        <div class="container-fluid">
            <div class="col-12">
                <table class="table table-hover" border="1" style="border-radius:20px; margin-top:15px;">
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
                            <tr>
                                <td>${pedido.getIdPedido()}</td>
                                <td>${mapaClientes[pedido.getIdCliente()].getNombre()}</td>
                                <td>${mapaClientes[pedido.getIdCliente()].getDireccion()}</td>
                                <td>${mapaEmpleados[pedido.getIdEmpleado()].getNombre()}</td>
                                <td>${pedido.getTipoComprobante()}</td>
                                <td>${pedido.getNumComprobante()}</td>
                                <td>${pedido.getFecha()}</td>
                                <td>${pedido.getTotal()}</td>
                                <td>${mapaEstados[pedido.getIdEstadoPedido()].getNombre()}</td>
                                <td><center><a href="ControladorDetallePedido?Op=Listar&idPedido=${pedido.getIdPedido()}"><i class="fa-solid fa-eye"></i> Ver</a></center></td>
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

    </body>
</html>
