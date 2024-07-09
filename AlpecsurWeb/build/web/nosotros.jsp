
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Usuario"%>
<%@ page session="true" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nosotros | Tienda Mayorista AlpecSur Online</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Estilos Personalizados -->
        <link href="resources/css/nosotros.css?v=1.5" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="resources/css/index.css"/>
        <link rel="stylesheet" href="resources/css/busqueda.css"/>
        <link rel="stylesheet" href="resources/css/navegacion.css"/>
    </head>
    <a href="resources/images/circle-border.svg"></a>
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
                            <a class="nav-link p-2" href="#"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-2" href="contactanos.jsp"><i class="bi bi-envelope"></i> Contacto</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Contenido Principal -->
        <div class="page-title-area">
            <div class="d-table">
                <div class="d-table-cell">
                    <div class="container">
                        <div class="page-title-content">
                            <ul>
                                <li><a href="index.jsp">Inicio</a></li>
                                <li>Nosotros</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="about-area section-padding">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-12">
                        <div class="about-content">
                            <h6>NOSOTROS</h6>
                            <h2>Distribuyendo Momentos Dulces desde hace más de 10 Años</h2>
                            <p>Alpecsur es tu distribuidor de confianza, llevando alegría a hogares en todo el Perú con servicios de entrega locales y a nivel nacional. Con más de una década de experiencia, priorizamos la calidad y seguridad en cada producto que ofrecemos.</p>
                            <p><strong>NUESTRA MISIÓN</strong></p>
                            <ul class="feature-list-box">
                                <li><i class="fa fa-caret-right"></i> <span class="color-text"> Calidad Primero:</span> Garantizamos los más altos estándares.</li>
                                <li><i class="fa fa-caret-right"></i> <span class="color-text"> Alcance Nacional:</span> Desde entregas locales hasta envíos a nivel nacional.</li>
                                <li><i class="fa fa-caret-right"></i> <span class="color-text"> Satisfacción del Cliente:</span> Tu felicidad es nuestra prioridad.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="about-image">
                            <img src="resources/images/nosotros.jpg" alt="about images">
                            <a href="https://www.youtube.com/watch?v=dXehgt05g8Q" class="video-btn popup-youtube"> <i class="fa fa-play"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="about-inner-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="about-page-content">
                                <h3>Distribución de Golosinas y Snacks</h3>
                                <p>En Alpecsur nos dedicamos principalmente a la distribución de golosinas y snacks, ofreciendo envíos locales y a todo el Perú.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="about-page-content">
                                <h3>Diseño Único y Minimalista</h3>
                                <p>En Alpecsur, diseñamos con un enfoque único y minimalista que refleja nuestra pasión por la elegancia y la simplicidad.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="about-page-content">
                                <h3>Eficiencia y Responsabilidad</h3>
                                <p>En Alpecsur, nos comprometemos con la eficiencia y la responsabilidad en cada aspecto de nuestro trabajo.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>       
        
        <section class="workprocess-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="section-title">
                            <h6>3 PUNTOS</h6>
                            <h2>NUESTRA VISÍON</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="workprocess-single-item">
                            <div class="workprocess-icon-box">
                                <span class="workprocess-icon-number"></span>
                            </div>
                            <div class="workprocess-info">
                                <h3>Excelencia en la Distribución</h3>
                                <p>Ser reconocidos como líderes en nuestro rubro, destacándonos por nuestra amplia cobertura nacional y compromiso con la calidad.</p>
                            </div>
                            <div class="workprocess-number-bg"><span>1</span></div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="workprocess-single-item">
                            <div class="workprocess-icon-box">
                                <span class="workprocess-icon-number"></span>
                            </div>
                            <div class="workprocess-info">
                                <h3>Innovación y Creatividad</h3>
                                <p>Impulsar constantemente nuevas ideas y soluciones creativas, adaptándonos a las necesidades cambiantes del mercado.</p>
                            </div>
                            <div class="workprocess-number-bg"><span>2</span></div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="workprocess-single-item">
                            <div class="workprocess-icon-box">
                                <span class="workprocess-icon-number"></span>
                            </div>
                            <div class="workprocess-info">
                                <h3>Confianza y Seguridad</h3>
                                <p>Construir relaciones sólidas basadas en la confianza y seguridad, ofreciendo productos que satisfacen las expectativas de nuestros clientes.</p>
                            </div>
                            <div class="workprocess-number-bg"><span>3</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </section> 
        <section class="whychoose-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="section-title">
                            <h6>¿POR QUÉ ALPECSUR?</h6>
                            <h2>¿POR QUÉ ELEGIRNOS SOBRE LA COMPETENCIA?</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="whychoose-single-item">
                            <div class="whychoose-icon-box">
                                <img src="resources/images/nc1.png" alt=""/>
                            </div>
                            <div class="whychoose-info">
                                <h3>Variedad Excepcional de Productos:</h3>
                                <p>Ofrecemos una amplia gama de golosinas y snacks de alta calidad, garantizando opciones para todos los gustos y preferencias.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="whychoose-single-item">
                            <div class="whychoose-icon-box">
                                <img src="resources/images/nc2.png" alt=""/>
                            </div>
                            <div class="whychoose-info">
                                <h3>Servicio Personalizado:</h3>
                                <p>Nos preocupamos por cada cliente, ofreciendo un servicio personalizado que se adapta a sus necesidades específicas y asegura una experiencia de compra satisfactoria.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="whychoose-single-item">
                            <div class="whychoose-icon-box">
                                <img src="resources/images/nc3.png" alt=""/>
                            </div>
                            <div class="whychoose-info">
                                <h3>Logística Eficiente:</h3>
                                <p>Contamos con un sistema logístico eficiente que asegura entregas rápidas y seguras, tanto a nivel local como nacional, optimizando tiempos y costos.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="whychoose-single-item">
                            <div class="whychoose-icon-box">
                                <img src="resources/images/nc4.png" alt=""/>
                            </div>
                            <div class="whychoose-info">
                                <h3>Compromiso con la Sostenibilidad:</h3>
                                <p>Nos comprometemos con prácticas sostenibles en nuestra cadena de suministro y operaciones, buscando reducir nuestro impacto ambiental y contribuir positivamente a la comunidad.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="whychoose-single-item">
                            <div class="whychoose-icon-box">
                                <img src="resources/images/nc5.png" alt=""/>
                            </div>
                            <div class="whychoose-info">
                                <h3>Experiencia y Conocimiento del Mercado</h3>
                                <p>Con más de 10 años de experiencia en el sector, poseemos un profundo conocimiento del mercado y sus tendencias, asegurando recomendaciones y soluciones efectivas para nuestros clientes.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="whychoose-single-item">
                            <div class="whychoose-icon-box">
                                <img src="resources/images/nc6.png" alt=""/>
                            </div>
                            <div class="whychoose-info">
                                <h3>Transparencia y Honestidad:</h3>
                                <p>Mantenemos altos estándares de transparencia y honestidad en todas nuestras operaciones, garantizando una relación de confianza duradera con nuestros clientes y socios comerciales.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="consultation-area section-padding" style="background: url(resources/images/backgrounnst.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="consultation-content text-center">
                            <h2>Estamos aquí para ayudar y responder cualquier pregunta que pueda tener.</h2>
                            <p>No dude en contactarnos!</p>
                            <a href="contactanos.jsp" class="btn btn-primary">Ir a Contacto</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
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
                #shopify-section-footer footer { padding-top: 25px; }
            </style>
        </div>

        <!-- jQuery para manejo de AJAX y Bootstrap para estilos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/busqueda.js?<%= System.currentTimeMillis()%>"></script>
        
        <!-- Chat Bot -->
        <script>
            window.addEventListener('mouseover', initLandbot, { once: true });
            window.addEventListener('touchstart', initLandbot, { once: true });
            var myLandbot;
            function initLandbot() {
              if (!myLandbot) {
                var s = document.createElement('script');s.type = 'text/javascript';s.async = true;
                s.addEventListener('load', function() {
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

