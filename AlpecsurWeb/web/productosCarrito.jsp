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
    </head>
    <body>
        <!-- Header de Presentación -->
        <header class="py-3">
            <div class="container d-flex align-items-center justify-content-between">
                <a href="index.jsp">
                    <img src="https://via.placeholder.com/150" alt="Logo" class="img-fluid" style="max-height: 60px;">
                </a>
                <form class="d-flex flex-grow-1 mx-3">
                    <input class="form-control me-2" type="search" placeholder="Buscar Productos" aria-label="Buscar Productos">
                    <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
                </form>
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
        <nav class="py-2 borde">
            <div class="container d-flex justify-content-around">
                <a href="controlador?accion=productos" class="btn btn-outline-dark"><i class="bi bi-box"></i> Productos</a>
                <a href="catalogo.jsp" class="btn btn-outline-dark"><i class="bi bi-book"></i> Catálogo</a>
                <a href="nosotros.jsp" class="btn btn-outline-dark"><i class="bi bi-people"></i> Nosotros</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                <a href="contactanos.jsp" class="btn btn-outline-dark"><i class="bi bi-envelope"></i> Contacto</a>
            </div>
        </nav>

        <div class="container-carrito">
            <div class="cont-carrito-main">
                <div class="content-wrapper">
                    <main class="main-content">
                        <section class="product-categories-section">
                            <div class="section-header">
                                <h2>Categorías de Producto</h2>
                            </div>
                            <ul class="product-categories">
                                <li class="category-item">
                                    <a href="controlador?accion=MostrarTodo">Mostrar Todo</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Papas Fritas">Papas Fritas</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Cereales">Cereales</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Pan">Pan</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Galletas">Galletas</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Tostadas">Tostadas</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Chupetines">Chupetines</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Bizcochos">Bizcochos</a>
                                </li>
                                <li class="category-item">
                                    <a href="controlador?accion=FiltrarCategoria&categoria=Snacks Salados">Snacks Salados</a>
                                </li>
                            </ul>
                        </section>
                    </main>
                </div>
                <aside class="shop-section">
                    <div class="shop-header">
                        <h1 class="shop-title">Tienda</h1>
                    </div>
                    <div class="products-wrapper">
                        <c:forEach var="p" items="${productos}">
                            <div class="product-item">
                                <div class="product-image" style="margin-bottom: 0;"></div>
                                <div class="product-top">
                                    <a href="#" class="product-image-link">
                                        <img src="resources/images/productos/${p.getImagen()}" alt="${p.getDescripcion()}" decoding="async" style="width:200px; height:220px;" >
                                    </a>
                                </div>

                                <div class="product-bottom">
                                    <h3 class="product-title"><a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/">${p.getNombre()}</a></h3>
                                    <div class="price-wrapper">
                                        <span class="price">S/${p.getPrecio()}</span>
                                    </div>
                                    <div class="add-to-cart">
                                        <div class="quantity">
                                            <input type="button" value="-" class="minus">
                                            <label class="screen-reader-text" for="quantity_${p.getIdProducto()}"></label>
                                            <input type="number" id="quantity_${p.getIdProducto()}" class="quantity-input" value="1" min="1" step="1" data-stock="${p.getStock()}">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                        <a href="#" class="button add-to-cart-button" onclick="agregarCarrito(${p.getIdProducto()}, ${p.getStock()})"><span>Agregar</span></a>
                                    </div>
                                    <div id="error_${p.getIdProducto()}" class="text-danger" style="display:none;">Máxima cantidad: ${p.getStock()}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </aside>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    </body>
</html>
