<%-- 
    Document   : carrito
    Created on : 17/05/2024, 09:46:38 PM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito | Alpecsur</title>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/2f5c7bb71d.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="estilos.css?v=1.10">
    </head>
    <body>
        <header>
            <input type="checkbox" id="check">
            <div class="container">
                <div class="icon">ALPEC<b style="color: #ffdeff;">S</b>UR</div>
                <div class="search_box">
                    <input type="search" placeholder="Buscar Productos">
                    <span class="fa fa-search"></span>
                </div>
                <ol>
                    <li><a href="#">¿Necesitas Ayuda?<i class="fa-solid fa-chevron-down"></i></a></li>
                    <li><a href="#"><i class="fa-regular fa-user"></i></a></li>
                    <li><a href="#"><i class="fa-regular fa-eye"></i></a></li>
                    <li><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
                </ol>
                <label for="" class="bar">
                    <span class="fa fa-bars" id="bars"></span>
                    <span class="fa fa-times" id="times"></span>
                </label>
            </div>
            <div class="navbar">
                <ol>
                    <li><a href="productos.jsp"><i class="fa-solid fa-cookie-bite"></i> Producto</a></li>
                    <li><a href="#"><i class="fa-solid fa-tag"></i> Promociones</a></li>
                    <li><a href="#"><i class="fa-solid fa-book-open"></i> Catalogo</a></li>
                    <li><a href="#"><i class="fa-solid fa-users"></i> Nosotros</a></li>
                </ol>
                <ol class="ol2">
                    <li><a href="#"><i class="fa-solid fa-truck"></i> Ventas Mayoristas</a></li>
                    <li><a href="#"><i class="fa-solid fa-location-dot"></i> Zonas de Envio</a></li>
                    <li><a href="#"><i class="fa-solid fa-phone"></i> Contacto</a></li>
                </ol>
            </div>
        </header>
        <div class="container-box-carrito">
            <div class="cart-table-container">
                <form class="cart-form" action="#" method="post">
                    <div class="cart-table-section">
                        <table class="shop-table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name">Producto</th>
                                    <th class="product-price">Precio</th>
                                    <th class="product-quantity">Cantidad</th>
                                    <th class="product-subtotal">Subtotal</th>
                                    <th class="product-remove">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="cart-item">
                                    <td class="product-thumbnail">
                                        <a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/"><img loading="lazy" width="300" height="300" src="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg" class="product-image" alt="compra y venta de aceite de ajonjoli por mayor y menor peru envíos a todo lima y provincias" decoding="async"></a>
                                    </td>
                                    <td class="product-name" data-title="Producto">
                                        <a href="#">Aceite de Ajonjolí X 250 ml / unidad</a>
                                    </td>
                                    <td class="product-price" data-title="Precio">
                                        <span class="price-amount"><bdi><span class="price-currency">S/</span>&nbsp;16.00</bdi></span>
                                    </td>
                                    <td class="product-quantity" data-title="Cantidad">
                                        <div class="quantity">
                                            <input type="button" value="-" class="quantity-button minus">
                                            <label class="screen-reader-text" for="quantity_6648124f8e4d0"></label>
                                            <input type="number" id="quantity_6648124f8e4d0" class="quantity-input" value="1" aria-label="Cantidad de productos" min="0" name="cart[1fb2a1c37b18aa4611c3949d6148d0f8][qty]" step="1">
                                            <input type="button" value="+" class="quantity-button plus">
                                        </div>
                                    </td>
                                    <td class="product-subtotal" data-title="Subtotal">
                                        <span class="price-amount"><bdi><span class="price-currency">S/</span>&nbsp;16.00</bdi></span>
                                    </td>
                                    <td class="product-remove">
                                        <a href="#" class="remove" aria-label="Eliminar Aceite de Ajonjolí X 250 ml / unidad del carrito" data-product_id="2430" data-product_sku="AVGAJO/0250M">×</a>
                                    </td>
                                </tr>
                                <tr class="cart-action-row">
                                    <td colspan="6" class="actions">
                                        <div class="cart-actions">
                                            <div class="coupon-form">
                                                <label for="coupon_code">Cupón:</label>
                                                <input type="text" name="coupon_code" class="coupon-input" id="coupon_code" value="" placeholder="Código de cupón">
                                                <button type="submit" class="button apply-coupon" name="apply_coupon" value="Aplicar cupón">Aplicar cupón</button>
                                            </div>
                                            <button type="submit" class="button update-cart" name="update_cart" value="Actualizar carrito" disabled>Actualizar carrito</button>
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
                                                                    <bdi><span class="currency-symbol">S/</span>&nbsp;16.00</bdi>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr class="order-total">
                                                            <th>Total</th>
                                                            <td data-title="Total">
                                                                <strong><span class="amount"><bdi><span class="currency-symbol">S/</span>&nbsp;16.00</bdi></span></strong>
                                                                <small class="includes-tax">(incluye <span class="amount"><span class="currency-symbol">S/</span>&nbsp;2.44</span> IGV 18%)</small>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="proceed-to-checkout">
                                                    <a href="#" class="checkout-button button alt wc-forward">Finalizar compra</a>
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
        </div>
    </body>
</html>
