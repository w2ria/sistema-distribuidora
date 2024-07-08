
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Usuario"%>
<%@ page session="true" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="resources/css/index.css?v=1.1"/>
        <title>Contacto | Tienda Mayorista AlpecSur Online</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Estilos Personalizados -->
        <link href="resources/css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/responsive2.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/estilos.css?v=1.1" rel="stylesheet" type="text/css"/>
        <link href="resources/css/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="resources/css/busqueda.css"/>
        <!-- Google Maps API -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=iniciarMap"></script>
        <script>
            function initMap() {
                var location = {lat: -12.0430232, lng: -77.1100735}; // Coordenadas de ejemplo (Lima, Perú)
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 15,
                    center: location
                });
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    title: 'Nuestra Ubicación'
                });

                marker.addListener('click', function () {
                    window.open('https://www.google.com/maps?q=' + location.lat + ',' + location.lng, '_blank');
                });
            }
        </script>
    </head>
    <body onload="initMap()">
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
        <nav class="py-2 borde">
            <div class="container d-flex justify-content-around">
                <a href="index.jsp" class="btn btn-outline-dark">Inicio</a>
                <a href="controlador?accion=productos" class="btn btn-outline-dark"><i class="bi bi-box"></i> Productos</a>
                <a href="nosotros.jsp" class="btn btn-outline-dark"><i class="bi bi-people"></i> Nosotros</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                <a href="contactanos.jsp" class="btn btn-outline-dark"><i class="bi bi-envelope"></i> Contacto</a>
            </div>
        </nav>

        <div class="main-content">
            <div class="template_contact">
                <div class="container">
                    <div id="shopify-section-template-contact" class="shopify-section section section_template__contact">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="contact_item item_address">
                                    <h3 class="item_title">Contactanos</h3>
                                    <div class="contact_address contact_element">
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="36" height="36" viewBox="0 0 20 20">
                                        <path d="M19.871 12.165l-8.829-9.758c-0.274-0.303-0.644-0.47-1.042-0.47-0 0 0 0 0 0-0.397 0-0.767 0.167-1.042 0.47l-8.829 9.758c-0.185 0.205-0.169 0.521 0.035 0.706 0.096 0.087 0.216 0.129 0.335 0.129 0.136 0 0.272-0.055 0.371-0.165l2.129-2.353v8.018c0 0.827 0.673 1.5 1.5 1.5h11c0.827 0 1.5-0.673 1.5-1.5v-8.018l2.129 2.353c0.185 0.205 0.501 0.221 0.706 0.035s0.221-0.501 0.035-0.706zM12 19h-4v-4.5c0-0.276 0.224-0.5 0.5-0.5h3c0.276 0 0.5 0.224 0.5 0.5v4.5zM16 18.5c0 0.276-0.224 0.5-0.5 0.5h-2.5v-4.5c0-0.827-0.673-1.5-1.5-1.5h-3c-0.827 0-1.5 0.673-1.5 1.5v4.5h-2.5c-0.276 0-0.5-0.224-0.5-0.5v-9.123l5.7-6.3c0.082-0.091 0.189-0.141 0.3-0.141s0.218 0.050 0.3 0.141l5.7 6.3v9.123z"></path>
                                        </svg>
                                        <h4>Dirección</h4>
                                        <p>Av Proceres</p>
                                    </div>
                                    <div class="contact_phone contact_element">
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="36" height="36" viewBox="0 0 20 20">
                                        <path d="M16 20c-1.771 0-3.655-0.502-5.6-1.492-1.793-0.913-3.564-2.22-5.122-3.78s-2.863-3.333-3.775-5.127c-0.988-1.946-1.49-3.83-1.49-5.601 0-1.148 1.070-2.257 1.529-2.68 0.661-0.609 1.701-1.32 2.457-1.32 0.376 0 0.816 0.246 1.387 0.774 0.425 0.394 0.904 0.928 1.383 1.544 0.289 0.372 1.73 2.271 1.73 3.182 0 0.747-0.845 1.267-1.739 1.816-0.346 0.212-0.703 0.432-0.961 0.639-0.276 0.221-0.325 0.338-0.333 0.364 0.949 2.366 3.85 5.267 6.215 6.215 0.021-0.007 0.138-0.053 0.363-0.333 0.207-0.258 0.427-0.616 0.639-0.961 0.55-0.894 1.069-1.739 1.816-1.739 0.911 0 2.81 1.441 3.182 1.73 0.616 0.479 1.15 0.958 1.544 1.383 0.528 0.57 0.774 1.011 0.774 1.387 0 0.756-0.711 1.799-1.319 2.463-0.424 0.462-1.533 1.537-2.681 1.537zM3.994 1c-0.268 0.005-0.989 0.333-1.773 1.055-0.744 0.686-1.207 1.431-1.207 1.945 0 6.729 8.264 15 14.986 15 0.513 0 1.258-0.465 1.944-1.213 0.723-0.788 1.051-1.512 1.056-1.781-0.032-0.19-0.558-0.929-1.997-2.037-1.237-0.952-2.24-1.463-2.498-1.469-0.018 0.005-0.13 0.048-0.357 0.336-0.197 0.251-0.408 0.594-0.613 0.926-0.56 0.911-1.089 1.772-1.858 1.772-0.124 0-0.246-0.024-0.363-0.071-2.624-1.050-5.729-4.154-6.779-6.779-0.126-0.315-0.146-0.809 0.474-1.371 0.33-0.299 0.786-0.579 1.228-0.851 0.332-0.204 0.676-0.415 0.926-0.613 0.288-0.227 0.331-0.339 0.336-0.357-0.007-0.258-0.517-1.261-1.469-2.498-1.108-1.439-1.847-1.964-2.037-1.997z"></path>
                                        </svg>
                                        <h4>Teléfono</h4>
                                        <a href="tel:+09123456789">(01) 458 25 145</a>
                                    </div>
                                    <div class="contact_hours contact_element">
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="36" height="36" viewBox="0 0 20 20">
                                        <path d="M16.32 17.113c1.729-1.782 2.68-4.124 2.68-6.613 0-2.37-0.862-4.608-2.438-6.355l0.688-0.688 0.647 0.646c0.098 0.098 0.226 0.146 0.353 0.146s0.256-0.049 0.353-0.146c0.195-0.195 0.195-0.512 0-0.707l-2-2c-0.195-0.195-0.512-0.195-0.707 0s-0.195 0.512 0 0.707l0.647 0.646-0.688 0.688c-1.747-1.576-3.985-2.438-6.355-2.438s-4.608 0.862-6.355 2.438l-0.688-0.688 0.646-0.646c0.195-0.195 0.195-0.512 0-0.707s-0.512-0.195-0.707 0l-2 2c-0.195 0.195-0.195 0.512 0 0.707 0.098 0.098 0.226 0.146 0.354 0.146s0.256-0.049 0.354-0.146l0.646-0.646 0.688 0.688c-1.576 1.747-2.438 3.985-2.438 6.355 0 2.489 0.951 4.831 2.68 6.613l-2.034 2.034c-0.195 0.195-0.195 0.512 0 0.707 0.098 0.098 0.226 0.147 0.354 0.147s0.256-0.049 0.354-0.147l2.060-2.059c1.705 1.428 3.836 2.206 6.087 2.206s4.382-0.778 6.087-2.206l2.059 2.059c0.098 0.098 0.226 0.147 0.354 0.147s0.256-0.049 0.353-0.147c0.195-0.195 0.195-0.512 0-0.707l-2.034-2.034zM1 10.5c0-4.687 3.813-8.5 8.5-8.5s8.5 3.813 8.5 8.5c0 4.687-3.813 8.5-8.5 8.5s-8.5-3.813-8.5-8.5z"></path>
                                        </svg>
                                        <h4>Horario</h4>
                                        <p>7:00 am A 10:00 pm de Lunes a Sabados</p>
                                    </div>
                                    <div class="contact_email contact_element">
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="36" height="36" viewBox="0 0 20 20">
                                        <path d="M3.5 14h13c0.827 0 1.5-0.673 1.5-1.5v-8c0-0.827-0.673-1.5-1.5-1.5h-13c-0.827 0-1.5 0.673-1.5 1.5v8c0 0.827 0.673 1.5 1.5 1.5zM3 4.5c0-0.276 0.224-0.5 0.5-0.5h13c0.276 0 0.5 0.224 0.5 0.5v8c0 0.276-0.224 0.5-0.5 0.5h-13c-0.276 0-0.5-0.224-0.5-0.5v-8z"></path>
                                        <path d="M19.5 15h-19c-0.276 0-0.5 0.224-0.5 0.5v1c0 0.827 0.673 1.5 1.5 1.5h17c0.827 0 1.5-0.673 1.5-1.5v-1c0-0.276-0.224-0.5-0.5-0.5zM18.5 17h-17c-0.276 0-0.5-0.224-0.5-0.5v-0.5h18v0.5c0 0.276-0.224 0.5-0.5 0.5z"></path>
                                        </svg>
                                        <h4>Email</h4>
                                        <a href="mailto:zemes@demolink.org">alpecsur@com.pe</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-4">
                                <div class="contact_item item_form">
                                    <h3 class="item_title">Déjanos un mensaje</h3>
                                    <form action="https://formsubmit.co/wspfernando789@gmail.com" method="POST" id="contact_form" accept-charset="UTF-8" class="contact-form" onsubmit="redirectAfterSubmit(event)">
                                        <input type="hidden" name="form_type" value="contact">
                                        <input type="hidden" name="utf8" value="">

                                        <div class="form-group">
                                            <input required="" type="text" id="contact_form__name" name="name" value="" placeholder="Nombre">
                                        </div>

                                        <div class="form-group">
                                            <input required="" type="email" id="contact_form__email" name="email" value="" placeholder="Email">
                                        </div>

                                        <div class="form-group">
                                            <textarea required="" id="contact_form__message" name="message" placeholder="Mensaje"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <button class="btn" type="submit">ENVIAR</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="contact_item item_follow">
                                    <h3 class="item_title">Síguenos</h3>
                                    <ul class="social_wrap">
                                        <li>
                                            <a href="">
                                                <i class="fa fa-facebook" aria-hidden="true"></i>
                                                <h4>Facebook</h4>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <i class="fa fa-twitter" aria-hidden="true"></i>
                                                <h4>Twitter</h4>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <i class="fa fa-instagram" aria-hidden="true"></i>
                                                <h4>Instagram</h4>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <i class="fa fa-youtube" aria-hidden="true"></i>
                                                <h4>YouTube</h4>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </div>

        <!-- Contenedor para el mapa -->
        <div id="map" style="height: 400px; width: 100%;"></div>

        <div id="shopify-section-footer" class="shopify-section">
            <footer style="background: rgba(0,0,0,0);">
                <div class="footer_row__1">
                    <div class="container">
                        <div class="row footer_main">
                            <div class="col-sm-3 footer_block footer_block__2_1">
                                <div class="footer_item footer_item__links">
                                    <h3>Categorías</h3>
                                    <ul>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Papas fritas">Papas fritas</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks mixtos">Snacks mixtos</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Nachos">Nachos</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Tostadas">Tostadas</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de maíz">Snacks de maíz</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de vegetales">Snacks de vegetales</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de legumbres">Snacks de legumbres</a></li>
                                        <li><a href="controlador?accion=FiltrarCategoria&categoria=Snacks de maní">Snacks de maní</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-sm-3 footer_block">
                                <div class="footer_item footer_item__links">
                                    <h3>Inicio</h3>
                                    <ul>
                                        <li><a href="/">Inicio</a></li>
                                        <li><a href="/collections/all">Catálogo</a></li>
                                        <li><a href="/blogs/blog">Blog</a></li>
                                        <li><a href="/collections">Colecciones</a></li>
                                        <li><a href="/pages/about-us">Sobre Nosotros</a></li>
                                        <li><a href="/pages/contact-us">Contacto</a></li>
                                        <li><a href="/pages/faq">Páginas</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-sm-3 footer_block footer_block__2_1">
                                <div class="footer_item footer_item__links">
                                    <h3>Información</h3>
                                    <ul>
                                        <li><a href="/pages/about-us">Sobre Nosotros</a></li>
                                        <li><a href="/collections/all">Catálogo</a></li>
                                        <li><a href="/blogs/blog">Blog</a></li>
                                        <li><a href="/collections">Colecciones</a></li>
                                        <li><a href="/pages/contact-us">Contacto</a></li>
                                        <li><a href="/pages/privacy-policy">Política de Privacidad</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-sm-3 footer_block">
                                <div class="footer_item footer_item__links">
                                    <h3>Síguenos</h3>
                                    <ul>
                                        <li><a href="https://www.facebook.com/zemezlab/">Facebook</a></li>
                                        <li><a href="https://twitter.com/zemezlab">Twitter</a></li>
                                        <li><a href="https://www.linkedin.com/company/18088573/">LinkedIn</a></li>
                                        <li><a href="https://www.youtube.com/channel/UCPW43un8VFXHe9LxKpR_2Hg">YouTube</a></li>
                                        <li><a href="https://www.instagram.com/zemezlab">Instagram</a></li>
                                    </ul>
                                </div>
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
        </div>
        <!-- jQuery para manejo de AJAX y Bootstrap para estilos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/busqueda.js?<%= System.currentTimeMillis()%>"></script>
     
    </body>
</html>

