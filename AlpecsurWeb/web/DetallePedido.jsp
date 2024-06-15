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
    Map<Integer, String> mapaNombresProductos = (Map<Integer, String>) request.getAttribute("mapaNombresProductos");
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
                            <tr>
                                <td><center>${detalle.idDetallePedido}</center></td>
                        <td><center>${detalle.idPedido}</center></td>
                        <td><center>${mapaNombresProductos.get(detalle.idProducto)}</center></td>
                        <td><center>${detalle.cantidad}</center></td>
                        <td><center>${detalle.precio}</center></td>
                        <td>
                            <div style="display: flex;">
                                <!-- Aquí puedes agregar botones de acciones si es necesario -->
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

