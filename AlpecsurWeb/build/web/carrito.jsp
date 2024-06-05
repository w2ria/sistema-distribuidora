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
        <link rel="stylesheet" href="resources/css/stylePago.css" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Raleway|Rock+Salt|Source+Code+Pro:300,400,600" rel="stylesheet">
    </head>
    <body class="fondo">
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
                                        <td class="product-thumbnail">${cart.getItem()}</td>
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
                                            <!-- Método de pago -->
                                            <div class="container mt-1" style="justify-content: center">
                                                <!-- Modal para ingresar los datos de la tarjeta -->
                                                <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="paymentModalLabel">Información de Pago</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <!-- Método de pago -->
                                                                <div class="container mt-1" style="justify-content: center">
                                                                    <div class="containerr preload">
                                                                        <div class="creditcard">
                                                                            <div class="front">
                                                                                <div id="ccsingle"></div>
                                                                                <svg version="1.1" id="cardfront" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                     x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                                                                                <g id="Front">
                                                                                <g id="CardBackground">
                                                                                <g id="Page-1_1_">
                                                                                <g id="amex_1_">
                                                                                <path id="Rectangle-1_1_" class="lightcolor grey" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                                                                                      C0,17.9,17.9,0,40,0z" />
                                                                                </g>
                                                                                </g>
                                                                                <path class="darkcolor greydark" d="M750,431V193.2c-217.6-57.5-556.4-13.5-750,24.9V431c0,22.1,17.9,40,40,40h670C732.1,471,750,453.1,750,431z" />
                                                                                </g>
                                                                                <text transform="matrix(1 0 0 1 60.106 295.0121)" id="svgnumber" class="st2 st3 st4">0123 4567 8910 1112</text>
                                                                                <text transform="matrix(1 0 0 1 54.1064 428.1723)" id="svgname" class="st2 st5 st6">JOHN DOE</text>
                                                                                <text transform="matrix(1 0 0 1 54.1074 389.8793)" class="st7 st5 st8">Nombre</text>
                                                                                <text transform="matrix(1 0 0 1 479.7754 388.8793)" class="st7 st5 st8">F. Expiración</text>
                                                                                <text transform="matrix(1 0 0 1 65.1054 241.5)" class="st7 st5 st8">Número de Tarjeta</text>
                                                                                <g>
                                                                                <text transform="matrix(1 0 0 1 574.4219 433.8095)" id="svgexpire" class="st2 st5 st9">01/23</text>
                                                                                <text transform="matrix(1 0 0 1 479.3848 417.0097)" class="st2 st10 st11">VALID</text>
                                                                                <text transform="matrix(1 0 0 1 479.3848 435.6762)" class="st2 st10 st11">THRU</text>
                                                                                <polygon class="st2" points="554.5,421 540.4,414.2 540.4,427.9" />
                                                                                </g>
                                                                                <g id="cchip">
                                                                                <g>
                                                                                <path class="st2" d="M168.1,143.6H82.9c-10.2,0-18.5-8.3-18.5-18.5V74.9c0-10.2,8.3-18.5,18.5-18.5h85.3
                                                                                      c10.2,0,18.5,8.3,18.5,18.5v50.2C186.6,135.3,178.3,143.6,168.1,143.6z" />
                                                                                </g>
                                                                                <g>
                                                                                <g>
                                                                                <rect x="82" y="70" class="st12" width="1.5" height="60" />
                                                                                </g>
                                                                                <g>
                                                                                <rect x="167.4" y="70" class="st12" width="1.5" height="60" />
                                                                                </g>
                                                                                <g>
                                                                                <path class="st12" d="M125.5,130.8c-10.2,0-18.5-8.3-18.5-18.5c0-4.6,1.7-8.9,4.7-12.3c-3-3.4-4.7-7.7-4.7-12.3
                                                                                      c0-10.2,8.3-18.5,18.5-18.5s18.5,8.3,18.5,18.5c0,4.6-1.7,8.9-4.7,12.3c3,3.4,4.7,7.7,4.7,12.3
                                                                                      C143.9,122.5,135.7,130.8,125.5,130.8z M125.5,70.8c-9.3,0-16.9,7.6-16.9,16.9c0,4.4,1.7,8.6,4.8,11.8l0.5,0.5l-0.5,0.5
                                                                                      c-3.1,3.2-4.8,7.4-4.8,11.8c0,9.3,7.6,16.9,16.9,16.9s16.9-7.6,16.9-16.9c0-4.4-1.7-8.6-4.8-11.8l-0.5-0.5l0.5-0.5
                                                                                      c3.1-3.2,4.8-7.4,4.8-11.8C142.4,78.4,134.8,70.8,125.5,70.8z" />
                                                                                </g>
                                                                                <g>
                                                                                <rect x="82.8" y="82.1" class="st12" width="25.8" height="1.5" />
                                                                                </g>
                                                                                <g>
                                                                                <rect x="82.8" y="117.9" class="st12" width="26.1" height="1.5" />
                                                                                </g>
                                                                                <g>
                                                                                <rect x="142.4" y="82.1" class="st12" width="25.8" height="1.5" />
                                                                                </g>
                                                                                <g>
                                                                                <rect x="142" y="117.9" class="st12" width="26.2" height="1.5" />
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                <g id="Back"></g>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="back">
                                                                                <svg version="1.1" id="cardback" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                     x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                                                                                <g id="Front">
                                                                                <line class="st0" x1="35.3" y1="10.4" x2="36.7" y2="11" />
                                                                                </g>
                                                                                <g id="Back">
                                                                                <g id="Page-1_2_">
                                                                                <g id="amex_2_">
                                                                                <path id="Rectangle-1_2_" class="darkcolor greydark" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                                                                                      C0,17.9,17.9,0,40,0z" />
                                                                                </g>
                                                                                </g>
                                                                                <rect y="61.6" class="st2" width="750" height="78" />
                                                                                <g>
                                                                                <path class="st3" d="M701.1,249.1H48.9c-3.3,0-6-2.7-6-6v-52.5c0-3.3,2.7-6,6-6h652.1c3.3,0,6,2.7,6,6v52.5
                                                                                      C707.1,246.4,704.4,249.1,701.1,249.1z" />
                                                                                <rect x="42.9" y="198.6" class="st4" width="664.1" height="10.5" />
                                                                                <rect x="42.9" y="224.5" class="st4" width="664.1" height="10.5" />
                                                                                <path class="st5" d="M701.1,184.6H618h-8h-10v64.5h10h8h83.1c3.3,0,6-2.7,6-6v-52.5C707.1,187.3,704.4,184.6,701.1,184.6z" />
                                                                                </g>
                                                                                <text transform="matrix(1 0 0 1 621.999 227.2734)" id="svgsecurity" class="st6 st7">985</text>
                                                                                <g class="st8">
                                                                                <text transform="matrix(1 0 0 1 518.083 280.0879)" class="st9 st6 st10">CVV</text>
                                                                                </g>
                                                                                <rect x="58.1" y="378.6" class="st11" width="375.5" height="13.5" />
                                                                                <rect x="58.1" y="405.6" class="st11" width="421.7" height="13.5" />
                                                                                <text transform="matrix(1 0 0 1 59.5073 228.6099)" id="svgnameback" class="st12 st13">John Doe</text>
                                                                                </g>
                                                                                </svg>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-containerr">
                                                                        <div class="field-containerr">
                                                                            <label for="name">Nombre</label>
                                                                            <input id="name" maxlength="20" type="text">
                                                                        </div>
                                                                        <div class="field-containerr">
                                                                            <label for="cardnumber">Número de Tarjeta</label><span id="generatecard">generar random</span>
                                                                            <input id="cardnumber" type="text" pattern="[0-9]*" inputmode="numeric">
                                                                            <svg id="ccicon" class="ccicon" width="600" height="321" viewBox="0 0  600 600" version="1.1"
                                                                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

                                                                            </svg>
                                                                        </div>
                                                                        <div class="field-containerr">
                                                                            <label for="expirationdate">F. Expiración (mm/yy)</label>
                                                                            <input id="expirationdate" type="text" pattern="[0-9]*" inputmode="numeric">
                                                                        </div>
                                                                        <div class="field-containerr">
                                                                            <label for="securitycode">CVV</label>
                                                                            <input id="securitycode" type="text" pattern="[0-9]*" inputmode="numeric">
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                                    <button type="button" class="btn btn-primary" id="realizarPagoBtn">Realizar Pago</button>
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
                            $('#realizarPagoBtn').on('click', function () {
                                // Aquí podrías agregar validaciones adicionales si lo deseas
                                var cardNumber = $('#cardnumber').val();
                                var expiryDate = $('#expirationdate').val();
                                var cvv = $('#securitycode').val();

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
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script>
                    <script src="resources/js/tarjeta.js"></script>
                    </body>
                    </html>
