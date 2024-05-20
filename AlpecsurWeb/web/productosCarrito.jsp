<%-- 
    Document   : pruebaproducto
    Created on : 19/05/2024, 06:30:19 PM
    Author     : piero
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a href="#" class="text-white mx-2">¿Necesitas Ayuda? <i class="bi bi-caret-down-fill"></i></a>
                    <a href="#" class="text-white mx-2"><i class="bi bi-person"></i></a>
                    <a href="#" class="text-white mx-2"><i class="bi bi-eye"></i></a>
                    <a href="controlador?accion=Carrito" class="text-white mx-2"><i class="bi bi-cart">(<label style="co">${cont}</label>)</i></a>
                </div>
            </div>
        </header>

        <!-- Barra de Navegación -->
        <nav class="py-2 borde">
            <div class="container d-flex justify-content-around">
                <a href="controlador?accion=productos" class="btn btn-outline-dark"><i class="bi bi-box"></i> Productos</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-tags"></i> Promociones</a>
                <a href="catalogo.jsp" class="btn btn-outline-dark"><i class="bi bi-book"></i> Catálogo</a>
                <a href="nosotros.jsp" class="btn btn-outline-dark"><i class="bi bi-people"></i> Nosotros</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-geo-alt"></i> Zonas de Envío</a>
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
                                    <a href="#">Aceite Vegetal</a>
                                    <span class="product-count">4</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Aceitunas y Derivados</a>
                                    <span class="product-count">5</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Cacao y Derivados</a>
                                    <span class="product-count">8</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Cereales y Granos</a>
                                    <span class="product-count">3</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Chocolates</a>
                                    <span class="product-count">10</span>
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
                                            <img src="resources/images/productos/${p.getImagen()}" alt="${p.getDescripcion()}" decoding="async" >
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
                                                <label class="screen-reader-text" for="quantity_2430"></label>
                                                <input type="number" id="quantity_2430" class="quantity-input" value="1" min="1" step="1">
                                                <input type="button" value="+" class="plus">
                                            </div>
                                            <a href="controlador?accion=AgregarCarrito&idProducto=${p.getIdProducto()}" class="button add-to-cart-button"><span>Agregar</span></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                </aside>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
