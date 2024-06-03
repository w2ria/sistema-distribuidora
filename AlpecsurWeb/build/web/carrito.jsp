
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
        <title>Carrito | AlpecSur Online</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
                    <a href="controlador?accion=Carrito" class="text-white mx-2"><i class="bi bi-cart">(<label style="color:white;">${cont}</label>)</i></a>
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

        <div class="container-box-carrito">
            <div class="cart-table-container">
                <form class="cart-form" action="#" method="post">
                    <div class="cart-table-section">
                        <table class="shop-table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name">Producto</th>    
                                    <th class="product-price">Precio</th>
                                    <th class="product-quantity">Cantidad</th>   
                                    <th class="product-subtotal">Subtotal</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cart" items="${carrito}">
                                    <tr class="cart-item">
                                        <td class="product-thumbnail">
                                            ${cart.getItem()}
                                        </td>
                                        <td class="product-thumbnail">
                                            <a href="#" class="product-image-link">
                                                <img src="resources/images/productos/${cart.getImagen()}" alt="${cart.getDescripcion()}" decoding="async">
                                            </a>
                                        </td>
                                        <td class="product-name" data-title="Producto">
                                            <a href="#">${cart.getNombre()}</a>
                                        </td>
                                        <td class="product-price" data-title="Precio">
                                            <span class="price-amount"><bdi><span class="price-currency">S/</span>&nbsp${cart.getPrecio()}</bdi></span>
                                        </td>
                                        <td class="product-quantity" data-title="Cantidad">
                                            <div class="quantity">
                                                <input type="hidden" id="idpro" value="${cart.getIdProducto()}">
                                                <input type="number" id="Cantidad" value="${cart.getCantidad()}" class="text-center" min="1">
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Subtotal">
                                            <span class="price-amount"><bdi><span class="price-currency">S/</span>${cart.getSubTotal()}</bdi></span>
                                        </td>
                                        <td>
                                            <input type="hidden" id="idp" value="${cart.getIdProducto()}">
                                            <a href="#" id="btnDelete">eliminar</a>
                                        </td>
                                    </tr>                                    
                                </c:forEach>

                                <tr class="cart-action-row">
                                    <td colspan="6" class="actions">
                                        <div class="cart-actions">
                                            <div class="coupon-form">
                                                <label for="coupon_code">Cupón:</label>
                                                <input type="text" name="coupon_code" class="coupon-input" id="coupon_code" value="" placeholder="Código de cupón">
                                                <button type="submit" class="button apply-coupon" name="apply_coupon" value="Aplicar cupón">Aplicar cupón</button>
                                            </div>

                                            <input type="hidden" id="woocommerce-cart-nonce" name="woocommerce-cart-nonce" value="999af14140">
                                            <input type="hidden" name="_wp_http_referer" value="/carrito/?removed_item=1">
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <section class="cart-summary-section">
                <div class="container-cart">
                    <div class="column">
                        <div class="widget-wrap">
                            <div class="widget title-widget">
                                <div class="widget-container">
                                    <div class="title-wrapper text-left">
                                        <div class="liner-container">
                                            <h4 class="title">Total del carrito</h4> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget cart-totals-widget">
                                <div class="widget-container">
                                    <div class="cart-totals">
                                        <div class="cart-totals-inner">
                                            <h2>Totales del carrito</h2>
                                            <table class="shop-table">
                                                <tbody>
                                                    <tr class="shipping">
                                                        <th>Envío</th>
                                                        <td data-title="Envío">
                                                            <ul id="shipping_method" class="shipping-methods">
                                                                <li>
                                                                    <input type="radio" name="shipping_method[0]" id="shipping_method_0_costo" value="costo" class="shipping-method" checked="checked">
                                                                    <label for="shipping_method_0_costo">Envíos Lima</label>
                                                                </li>
                                                                <li>
                                                                    <input type="radio" name="shipping_method[0]" id="shipping_method_0_despacho" value="despacho" class="shipping-method">
                                                                    <label for="shipping_method_0_despacho">Envíos Provincia</label>
                                                                </li>
                                                            </ul>
                                                            <p class="shipping-destination">
                                                                <span class="shipping-estimate">Las opciones de envío se actualizarán durante el pago.</span>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr class="cart-subtotal">
                                                        <th>Subtotal</th>
                                                        <td data-title="Subtotal">
                                                            <span class="amount">
                                                                <bdi><span class="currency-symbol">S/</span>${totalPagar}</bdi>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr class="order-total">
                                                        <th>Total</th>
                                                        <td data-title="Total">
                                                            <strong><span class="amount"><bdi><span class="currency-symbol">S/</span>${totalPagar}</bdi></span></strong>
                                                            <small class="includes-tax">(incluye <span class="amount"><span class="currency-symbol">S/(${totalPagar})*0.18</span></span> IGV 18%)</small>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="proceed-to-checkout">
                                                <button type="button" class="checkout-button button alt wc-forward" data-bs-toggle="modal" data-bs-target="#paymentModal">Finalizar compra</button>
                                            </div>

                                            <!-- Modal para ingresar los datos de la tarjeta -->
                                            <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="paymentModalLabel">Información de Pago</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form id="paymentForm">
                                                                <div class="mb-3">
                                                                    <label for="cardNumber" class="form-label">Número de Tarjeta</label>
                                                                    <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="expiryDate" class="form-label">Fecha de Expiración</label>
                                                                    <input type="text" class="form-control" id="expiryDate" name="expiryDate" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="cvv" class="form-label">CVV</label>
                                                                    <input type="text" class="form-control" id="cvv" name="cvv" required>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                            <button type="button" class="btn btn-primary" id="finalizePurchaseButton">Terminar Compra</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- .cart-totals-inner -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>                                                      
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/funciones.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#finalizePurchaseButton').on('click', function () {
                    // Aquí podrías agregar validaciones adicionales si lo deseas
                    var cardNumber = $('#cardNumber').val();
                    var expiryDate = $('#expiryDate').val();
                    var cvv = $('#cvv').val();

                    if (cardNumber === "" || expiryDate === "" || cvv === "") {
                        alert("Por favor, complete todos los campos.");
                        return;
                    }

                    // Simular una espera para la validación (solo visual)
                    setTimeout(function () {
                        $('#paymentModal').modal('hide');
                        window.location.href = 'controlador?accion=GenerarPedido';
                    }, 500);
                });
            });
        </script>
    </body>
</html>
