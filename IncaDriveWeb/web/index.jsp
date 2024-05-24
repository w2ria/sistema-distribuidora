<%-- 
    Document   : aea
    Created on : 23/05/2024, 01:26:54 AM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inca Drive</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <link href="resources/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/BusquedaCarro.css?v=1.3" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="root">
            <nav class="header">
                <div class="header-2">
                  <a class="logo" href="/">
                    <div class="logo-name">
                      <h3><span>Inca</span>Drive</h3>
                      <p>Servico renta carros</p>
                    </div>
                  </a>
                  <div class="container">
                    <div class="navbar">
                        <ul class="nav">
                          <li class="nav-item">
                            <a class="nav-btn" href="/">Inicio</a>
                          </li>
                          <li class="nav-item">
                            <span class="nav-btn">Nosotros</span>
                            <ul class="dropdown-content">
                              <li><a href="/About-us">¿Quienes Somos?</a></li>
                              <li><a href="/Team">Nuestro Equipo</a></li>
                              <li><a href="/Testimonials">Testimonios</a></li>
                              <li><a href="/Faqs">FAQs</a></li>
                            </ul>
                          </li>
                          <li class="nav-item">
                            <span class="nav-btn">Paginas</span>
                            <ul class="dropdown-content">
                              <li><a href="login.jsp">Login</a></li>
                              <li><a href="/Services/Service-Single">Servicios</a></li>
                              <li><a href="/Gallery">Galeria</a></li>
                            </ul>
                          </li>
                          <li class="nav-item">
                            <span class="nav-btn">Carros</span>
                            <ul class="dropdown-content">
                              <li><a href="listaCarros.jsp">Lista de Carros</a></li>
                              <li><a href="/Checkout">Checkout</a></li>
                            </ul>
                          </li>
                          <li class="nav-item">
                            <span class="nav-btn">Blog</span>
                            <ul class="dropdown-content">
                              <li><a href="/Blog-Grid">Lista Blog</a></li>
                              <li><a href="/Blogs/Blog-Single">Blog Simple</a></li>
                            </ul>
                          </li>
                          <li class="nav-item">
                            <a class="nav-btn" href="/Contact-us">Contactanos</a>
                          </li>
                        </ul>

                    <a class="btn" href="/Car-List">Renta un carro</a>
                  </div>
                </div>
              </nav>

            <div class="homepage">
              <section class="home" id="home">
                <div class="home-slider">
                  <div class="swiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden">
                    <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
                      <div class="swiper-slide home-item" data-swiper-slide-index="0" style="width: 1124px;">
                        <img src="resources/images/IC001.jpg" alt="home-pic"/>
                        <div class="content">
                          <div class="text">
                            <h3>¡Descubre Perú a tu ritmo!</h3>
                            <p>Alquila el carro perfecto para tu aventura. ¡Reserva hoy y ahorra!</p>
                            <a class="btn" href="/About-us">Leer más</a>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide home-item" data-swiper-slide-index="1" style="width: 1124px;">
                        <img src="resources/images/IC002.jpg" alt="home-pic"/>
                        <div class="content">
                          <div class="text">
                            <h3>Tu viaje, nuestra misión</h3>
                            <p>Vehículos modernos y cómodos para cada destino. ¡Reserva ahora y viaja con confianza!</p>
                            <a class="btn" href="/About-us">Leer más</a>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide home-item" data-swiper-slide-index="2" style="width: 1124px;">
                        <img src="resources/images/IC003.jpg" alt="home-pic"/>
                        <div class="content">
                          <div class="text">
                            <h3>La libertad de viajar te espera</h3>
                            <p>Descubre nuestra amplia gama de modelos y encuentra el carro perfecto para ti. ¡Reserva ahora!</p>
                            <a class="btn" href="/About-us">Leer más</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal"></div>
                  </div>
                </div>
              </section>
              <section class="carSearch">
                    <h4>Buscar carros</h4>
                    <form class="car-search">
                        <div class="custom-select box css-b62m3t-container">
                            <span id="react-select-2-live-region" class="css-7pg0cj-a11yText"></span>
                            <span aria-live="polite" aria-atomic="false" aria-relevant="additions text" class="css-7pg0cj-a11yText"></span>
                            <div class="custom-select-prefix__control css-13cymwt-control">
                                <div class="custom-select-prefix__value-container custom-select-prefix__value-container--has-value css-hlgwow">
                                    <div class="custom-select-prefix__single-value css-1dimb5e-singleValue">Marca</div>
                                    <div class="custom-select-prefix__input-container css-19bb58m" data-value="">
                                        <input class="custom-select-prefix__input" autocapitalize="none" autocomplete="off" autocorrect="off" id="react-select-2-input" spellcheck="false" tabindex="0" type="text" aria-autocomplete="list" aria-expanded="false" aria-haspopup="true" role="combobox" value="" style="color: inherit; background: 0px center; opacity: 1; width: 100%; grid-area: 1 / 2; font: inherit; min-width: 2px; border: 0px; margin: 0px; outline: 0px; padding: 0px;">
                                    </div>
                                </div>
                                <div class="custom-select-prefix__indicators css-1wy0on6">
                                    <span class="custom-select-prefix__indicator-separator css-1u9des2-indicatorSeparator"></span>
                                    <div class="custom-select-prefix__indicator custom-select-prefix__dropdown-indicator css-1xc3v61-indicatorContainer" aria-hidden="true">
                                        <svg height="20" width="20" viewBox="0 0 20 20" aria-hidden="true" focusable="false" class="css-8mmkcg">
                                            <path d="M4.516 7.548c0.436-0.446 1.043-0.481 1.576 0l3.908 3.747 3.908-3.747c0.533-0.481 1.141-0.446 1.574 0 0.436 0.445 0.408 1.197 0 1.615-0.406 0.418-4.695 4.502-4.695 4.502-0.217 0.223-0.502 0.335-0.787 0.335s-0.57-0.112-0.789-0.335c0 0-4.287-4.084-4.695-4.502s-0.436-1.17 0-1.615z"></path>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="custom-select box css-b62m3t-container">
                            <span id="react-select-3-live-region" class="css-7pg0cj-a11yText"></span>
                            <span aria-live="polite" aria-atomic="false" aria-relevant="additions text" class="css-7pg0cj-a11yText"></span>
                            <div class="custom-select-prefix__control css-13cymwt-control">
                                <div class="custom-select-prefix__value-container custom-select-prefix__value-container--has-value css-hlgwow">
                                    <div class="custom-select-prefix__single-value css-1dimb5e-singleValue">Tipo</div>
                                    <div class="custom-select-prefix__input-container css-19bb58m" data-value="">
                                        <input class="custom-select-prefix__input" autocapitalize="none" autocomplete="off" autocorrect="off" id="react-select-3-input" spellcheck="false" tabindex="0" type="text" aria-autocomplete="list" aria-expanded="false" aria-haspopup="true" role="combobox" value="" style="color: inherit; background: 0px center; opacity: 1; width: 100%; grid-area: 1 / 2; font: inherit; min-width: 2px; border: 0px; margin: 0px; outline: 0px; padding: 0px;">
                                    </div>
                                </div>
                                <div class="custom-select-prefix__indicators css-1wy0on6">
                                    <span class="custom-select-prefix__indicator-separator css-1u9des2-indicatorSeparator"></span>
                                    <div class="custom-select-prefix__indicator custom-select-prefix__dropdown-indicator css-1xc3v61-indicatorContainer" aria-hidden="true">
                                        <svg height="20" width="20" viewBox="0 0 20 20" aria-hidden="true" focusable="false" class="css-8mmkcg">
                                            <path d="M4.516 7.548c0.436-0.446 1.043-0.481 1.576 0l3.908 3.747 3.908-3.747c0.533-0.481 1.141-0.446 1.574 0 0.436 0.445 0.408 1.197 0 1.615-0.406 0.418-4.695 4.502-4.695 4.502-0.217 0.223-0.502 0.335-0.787 0.335s-0.57-0.112-0.789-0.335c0 0-4.287-4.084-4.695-4.502s-0.436-1.17 0-1.615z"></path>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <input type="number" id="price" name="price" placeholder="Precio maximo" class="input-field" min="0" value="">
                        </div>
                        <div class="box">
                            <button type="submit" class="btn">Buscar</button>
                        </div>
                    </form>
                </section>
            </div>
        </div>
        
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Inicialización de Swiper -->
        <script>
          document.addEventListener('DOMContentLoaded', function() {
            var swiper = new Swiper('.swiper', {
              loop: true,
              pagination: {
                el: '.swiper-pagination',
                clickable: true,
              },
              navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
              },
            });
          });
        </script>
    </body>
</html>
