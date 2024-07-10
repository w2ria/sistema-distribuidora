
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Usuario"%>
<%@ page session="true" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<%@ include file="loader.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tienda Mayorista | AlpecSur Online</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="resources/css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/responsive.css?v=1.2" rel="stylesheet" type="text/css"/>
        <link href="resources/css/responsive2.css?v=1.1" rel="stylesheet" type="text/css"/>
        <link href="resources/css/index.css?v=1.2" rel="stylesheet" type="text/css"/>
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

        <div id="shopify-section-1547545324796" class="shopify-section section section_homepage section_image-with-text-overlay">
            <div class="section_wrap flexible_block__small">
                <div class="img_placeholder__wrap img_placeholder__small" style="background-image: url(resources/images/banner1.jpg);"></div>
                <div class="section_txt align_center full_width">
                    <div class="container">
                        <div class="caption_text inverted">
                            <h5>EN VENTA ESTE MES</h5>
                            <h2 class="title_animation" data-in-effect="pulse">
                                <span style="visibility: visible;">
                                    <span class="word1" style="display: inline-block; transform: translate3d(0px, 0px, 0px);">
                                        <span class="char1" style="display: inline-block; visibility: visible;">T</span>
                                        <span class="char2" style="display: inline-block; visibility: visible;">U</span>
                                        <span class="char3" style="display: inline-block; visibility: visible;">S</span>
                                        <span class="char4" style="display: inline-block; visibility: visible;"></span>
                                    </span>
                                    <span class="word2" style="display: inline-block; transform: translate3d(0px, 0px, 0px);">
                                        <span class="char1" style="display: inline-block; visibility: visible;">P</span>
                                        <span class="char2" style="display: inline-block; visibility: visible;">R</span>
                                        <span class="char3" style="display: inline-block; visibility: visible;">O</span>
                                        <span class="char4" style="display: inline-block; visibility: visible;">D</span>
                                        <span class="char5" style="display: inline-block; visibility: visible;">U</span>
                                        <span class="char6" style="display: inline-block; visibility: visible;">C</span>
                                        <span class="char7" style="display: inline-block; visibility: visible;">T</span>
                                        <span class="char8" style="display: inline-block; visibility: visible;">O</span>
                                        <span class="char9" style="display: inline-block; visibility: visible;">S</span>
                                    </span>
                                    <span class="word2" style="display: inline-block; transform: translate3d(0px, 0px, 0px);">
                                        <span class="char1" style="display: inline-block; visibility: visible;">F</span>
                                        <span class="char2" style="display: inline-block; visibility: visible;">A</span>
                                        <span class="char3" style="display: inline-block; visibility: visible;">V</span>
                                        <span class="char4" style="display: inline-block; visibility: visible;">O</span>
                                        <span class="char5" style="display: inline-block; visibility: visible;">R</span>
                                        <span class="char6" style="display: inline-block; visibility: visible;">I</span>
                                        <span class="char7" style="display: inline-block; visibility: visible;">T</span>
                                        <span class="char8" style="display: inline-block; visibility: visible;">O</span>
                                        <span class="char9" style="display: inline-block; visibility: visible;">S</span>
                                    </span>                                    
                                </span>
                                <ul class="texts" style="display: none;">
                                    <li class="current">TUS PRODUCTOS FAVORITOS</li>
                                </ul>
                            </h2>
                            <h4>Los encontraras aquí</h4>
                            <a href="controlador?accion=MostrarTodo" class="btn btn-outline-dark1">Comprar Ahora</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="shopify-section-1547482206888" class="shopify-section section section_homepage section_text-columns">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="text_columns__item">
                            <div class="item_img">
                                <img src="resources/images/caract1.jpg" alt=""/>
                            </div>
                            <div class="item_info text_center">
                                <h3>Variedad y Calidad</h3>
                                <p>Contamos con la mejor variedad de productos, de la más alta calidad.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="text_columns__item">
                            <div class="item_img">
                                <img src="resources/images/caract2.jpg" alt="">
                            </div>
                            <div class="item_info text_center">
                                <h3>Distribución Eficiente</h3>
                                <p>Contamos con una red de distribución bien organizada que nos permite ofrecer una cobertura amplia para las entregas eficientes.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="text_columns__item">
                            <div class="item_img">
                                <img src="resources/images/caract3.jpg" alt="">
                            </div>
                            <div class="item_info text_center">
                                <h3>Sostenibilidad</h3>
                                <p>Promovemos prácticas sostenibles en todas las operaciones, desde el abastecimiento de productos hasta el empaquetado y la distribución.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="shopify-section-1547545562625" class="shopify-section section section_homepage section_image-with-text">
            <div class="container">
                <div class="item_wrap image_left">
                    <div class="item_img">
                        <img src="resources/images/banner2.jpg" alt=""/>
                    </div>
                    <div class="item_txt">
                        <h3>ENVÍOS A NIVEL NACIONAL</h3>
                        <h4>REALIZA TU PEDIDO AHORA!</h4>
                        <p>Aprovecha nuestra campaña de descuento para envíos a toda Lima Metropolitana.</p>
                        <a class="btn btn-outline-dark" href="controlador?accion=MostrarTodo">Comprar Ahora</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div id="shopify-section-1547482926210" class="shopify-section section section_newsletter">
            <div class="container">
                <div class="index_newsletter_wrapper" style="background: url(resources/images/banner3.jpg);">
                    <div class="item__newsletter">
                        <h3>Newsletter</h3>
                        <form method="post" action="/contact#contact_form" id="newsletter_form" accept-charset="UTF-8" class="contact-form">
                            <input type="hidden" name="form_type" value="customer">
                            <input type="hidden" name="utf8" value="">
                            <p class="alert alert-success">¡Te has suscrito con éxito!</p>
                            <p class="form_text">Registrate para recibir nuestras ofertas y actualizaciones de la tienda.</p>
                            <input type="hidden" name="contact[tags]" value="Newsletter subscriber">
                            <div class="form_wrapper">
                                <input type="email" name="contact[email]" class="input-group__field newsletter__input" placeholder="Enter your email">
                                <p class="alert-inline" style="display: none;"></p>
                                <button class="btn btn-outline-dark1" type="submit">Subscribirse</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="shopify-section-footer" class="shopify-section">
            <footer style="background: rgba(0,0,0,0);">
                <div class="footer_row__1">
                    <div class="container">
                        <div class="row footer_main">
                            <div class="col-sm-3 footer_block footer_block__2_1">
                                <div class="footer_item footer_item__links">
                                    <h3>Categories</h3>
                                    <ul>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Papas fritas">Papas fritas</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks mixtos">Snacks mixtos</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Nachos">Nachos</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Tostadas">Tostadas</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de maiz">Snacks de maiz</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de vegetales">Snacks de vegetales</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de legumbres">Snacks de legumbres</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de mani">Snacks de mani</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-sm-3 footer_block">
                                <div class="footer_item footer_item__links">
                                    <h3>Home</h3>
                                    <ul>
                                        <li><a href="/">Home</a></li>
                                        <li><a href="/collections/all">Catalog</a></li>
                                        <li><a href="/blogs/blog">Blog</a></li>
                                        <li><a href="/collections">Collections</a></li>
                                        <li><a href="/pages/about-us">About Us</a></li>
                                        <li><a href="/pages/contact-us">Contact Us</a></li>
                                        <li><a href="/pages/faq">Pages</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-sm-3 footer_block footer_block__2_1">
                                <div class="footer_item footer_item__links">
                                    <h3>Information</h3>
                                    <ul>
                                        <li><a href="/pages/about-us">About Us</a></li>
                                        <li><a href="/collections/all">Catalog</a></li>
                                        <li><a href="/blogs/blog">Blog</a></li>
                                        <li><a href="/collections">Collections</a></li>
                                        <li><a href="/pages/contact-us">Contact Us</a></li>
                                        <li><a href="/pages/privacy-policy">Privacy Policy</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-sm-3 footer_block">
                                <div class="footer_item footer_item__links">
                                    <h3>Follow us</h3>
                                    <ul>
                                        <li><a href="https://www.facebook.com/zemezlab/">Facebook</a></li>
                                        <li><a href="https://twitter.com/zemezlab">Twitter</a></li>
                                        <li><a href="https://www.linkedin.com/company/18088573/">Linkedin</a></li>
                                        <li><a href="https://www.youtube.com/channel/UCPW43un8VFXHe9LxKpR_2Hg">Youtube</a></li>
                                        <li><a href="https://www.instagram.com/zemezlab">Instagram</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal de Compra Exitosa -->
                <div class="modal fade" id="compraExitosaModal" tabindex="-1" aria-labelledby="compraExitosaModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="compraExitosaModalLabel">Compra Exitosa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¡Tu compra ha sido realizada con éxito!
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer_row__2 bottom_inverted" style="background: #000000;">
                    <div class="container">
                        <div class="footer_wrap_1">
                            <div class="footer_wrap_2 footer_left">
                                ©Alpecsur. <a target="_blank" rel="nofollow" href="">Powered by UTP</a>
                            </div>

                            <div class="footer_wrap_2 footer_right">
                                <ul class="footer_payments">
                                    <li><i class="fa fa-cc-mastercard" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-cc-paypal" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-cc-visa" aria-hidden="true"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

            <style>
                #shopify-section-footer footer {
                    padding-top: 25px;
                }
            </style>
        </div>


        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- jQuery para manejo de AJAX y Bootstrap para estilos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/busqueda.js?<%= System.currentTimeMillis()%>"></script>
        <script>
            $(document).ready(function () {
                var compraExitosa = '<%= request.getParameter("compraExitosa")%>';
                if (compraExitosa && compraExitosa === 'true') {
                    $('#compraExitosaModal').modal('show');
                }
            });
        </script>

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

