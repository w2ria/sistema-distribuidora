
<%@page import="Modelo.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");

    if (usuario == null || cliente == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nosotros | Tienda Mayorista AlpecSur Online</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Estilos Personalizados -->
        <link rel="stylesheet" href="resources/css/index.css"/>
        <link rel="stylesheet" href="resources/css/busqueda.css"/>
        <link rel="stylesheet" href="resources/css/navegacion.css"/>
    </head>
    <body>
        <!-- Header de Presentación -->
        <header class="py-3">
            <div class="container d-flex align-items-center justify-content-between">
                <a href="index.jsp">
                    <img src="resources/images/Recurso 1.png" alt="Logo" class="img-fluid" style="max-height: 60px;">
                </a>
                <div class="position-relative flex-grow-1 mx-3">
                    <input class="form-control me-2" type="search" id="searchInput" placeholder="Buscar Productos" aria-label="Buscar Productos">
                    <div id="searchResults" class="search-results"></div>
                </div>
                <div>
                    <% if (usuario != null && cliente != null) {%>
                    <span class="text-white mx-2">Bienvenido, <%= cliente.getNombre()%></span>
                    <a href="logout.jsp" class="btn btn-outline-light">Cerrar Sesión</a>
                    <% } else { %>
                    <a href="login.jsp" class="text-white mx-2"><i class="bi bi-person"></i></a>
                        <% }%>
                    <a href="#" class="text-white mx-2"><i class="bi bi-eye"></i></a>
                        <% Integer contadorCarrito = (Integer) session.getAttribute("contadorCarrito");%>
                    <a href="controlador?accion=Carrito" class="text-white mx-2"><i class="bi bi-cart">(<label style="color:white;">${contadorCarrito != null ? contadorCarrito : 0}</label>)</i></a>
                </div>
            </div>
        </header>

        <!-- Barra de Navegación -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light py-2 borde">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Inicio</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link p-2" href="controlador?accion=productos"><i class="bi bi-box"></i> Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-2" href="nosotros.jsp"><i class="bi bi-people"></i> Nosotros</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-2" href="contactanos.jsp"><i class="bi bi-envelope"></i> Contacto</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!--CARRITO DE PRODUCTOS-->
        <div class="container mt-4">
            <h1 class="text-center mb-4">Tienda</h1>
            <div class="row mb-4 align-items-center">
                <div class="col-md-2">
                    <h2 class="mb-0">Filtro:</h2>
                </div>
                <div class="col-md-10 d-flex justify-content-start">
                    <div class="dropdown me-3">
                        <a class="btn btn-secondary dropdown-toggle" href="#" id="dropdownCategoria" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Categoría
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownCategoria">
                            <c:forEach var="categoria" items="${listaCategorias}">
                                <li><a class="dropdown-item" href="controlador?accion=FiltrarCategoria&categoria=${categoria.getNombre()}">${categoria.getNombre()}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" id="dropdownMarca" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Marca
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMarca">
                            <c:forEach var="marca" items="${listaMarcas}">
                                <li><a class="dropdown-item pl-2" href="controlador?accion=FiltrarMarca&marca=${marca.getNombre()}">${marca.getNombre()}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <a href="controlador?accion=MostrarTodo" class="btn btn-primary" style="margin-left: 15px">Mostrar Todo</a>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                <c:forEach var="p" items="${productos}">
                    <c:if test="${p.stock > 0}">
                        <div class="col">
                            <div class="card h-100">
                                <div class="image-container">
                                    <img src="resources/images/productos/${p.getImagen()}" class="card-img-top product-image" alt="${p.getDescripcion()}" style="width: auto; height: 150px; margin: 10px 28%;">
                                </div>
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div>
                                        <h5 class="card-title text-center">${p.getNombre()}</h5>
                                        <p class="card-text text-center">S/${p.getPrecio()}</p>
                                    </div>
                                    <div class="add-to-cart-container d-flex justify-content-center align-items-center mt-2">
                                        <div class="d-flex align-items-center quantity">
                                            <button class="btn btn-outline-secondary minus" type="button">-</button>
                                            <input type="number" id="quantity_${p.getIdProducto()}" class="form-control text-center mx-2 quantity-input" value="1" min="1" step="1" data-stock="${p.getStock()}">
                                            <button class="btn btn-outline-secondary plus" type="button">+</button>
                                        </div>
                                        <a href="#" class="btn btn-primary ms-2" onclick="agregarCarrito(${p.getIdProducto()}, ${p.getStock()})">Agregar</a>
                                    </div>
                                    <div id="error_${p.getIdProducto()}" class="text-danger mt-2 text-center" style="display:none;">Máxima cantidad: ${p.getStock()}</div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <!--CARRITO DE PRODUCTOS-->


        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <script>
                                    $(document).ready(function () {
                                        $('.minus').click(function () {
                                            var input = $(this).siblings('.quantity-input');
                                            var stock = input.data('stock');
                                            var currentValue = parseInt(input.val());
                                            if (currentValue > 1) {
                                                input.val(currentValue - 1);
                                                $('#error_' + input.attr('id').split('_')[1]).hide();
                                            }
                                        });

                                        $('.plus').click(function () {
                                            var input = $(this).siblings('.quantity-input');
                                            var stock = input.data('stock');
                                            var currentValue = parseInt(input.val());
                                            if (currentValue < stock) {
                                                input.val(currentValue + 1);
                                                $('#error_' + input.attr('id').split('_')[1]).hide();
                                            } else {
                                                $('#error_' + input.attr('id').split('_')[1]).show();
                                            }
                                        });

                                        $('.quantity-input').on('input', function () {
                                            var stock = $(this).data('stock');
                                            var currentValue = parseInt($(this).val());
                                            if (currentValue > stock) {
                                                $(this).val(stock);
                                                $('#error_' + $(this).attr('id').split('_')[1]).show();
                                            } else {
                                                $('#error_' + $(this).attr('id').split('_')[1]).hide();
                                            }
                                        });
                                    });

                                    function agregarCarrito(idProducto, stock) {
                                        var cantidad = $('#quantity_' + idProducto).val();
                                        if (parseInt(cantidad) > stock) {
                                            $('#error_' + idProducto).show();
                                            return;
                                        }

                                        window.location.href = 'controlador?accion=AgregarCarrito&idProducto=' + idProducto + '&cantidad=' + cantidad;
                                    }
        </script>
        <script src="resources/js/busqueda.js?<%= System.currentTimeMillis()%>"></script>

        <!-- Chat Bot -->
        <script>
                                    window.addEventListener('mouseover', initLandbot, {once: true});
                                    window.addEventListener('touchstart', initLandbot, {once: true});
                                    var myLandbot;
                                    function initLandbot() {
                                        if (!myLandbot) {
                                            var s = document.createElement('script');
                                            s.type = 'text/javascript';
                                            s.async = true;
                                            s.addEventListener('load', function () {
                                                var myLandbot = new Landbot.Livechat({
                                                    configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-2543729-VQHPO033CSVXL7PK/index.json',
                                                });
                                            });
                                            s.src = 'https://cdn.landbot.io/landbot-3/landbot-3.0.0.js';
                                            var x = document.getElementsByTagName('script')[0];
                                            x.parentNode.insertBefore(s, x);
                                        }
                                    }
        </script>
    </body>
</html>
