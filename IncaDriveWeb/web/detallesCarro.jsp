<%-- 
    Document   : listaCarros
    Created on : 23/05/2024, 02:10:14 PM
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
        <link href="resources/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/carro.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/listaCarros.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/itemCarro.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/itemCarroHeader.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/paginaTitulo.css" rel="stylesheet" type="text/css"/>
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
                            <a class="nav-btn" href="./index.jsp">Inicio</a>
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
            <div class="page-title">
                <div class="title">
                    <h2>Detalles Carro a Rentar</h2>
                </div>
                <div class="link">
                    <a href="/">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" class="page-home" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z"></path>
                        </svg>
                        <span>Inicio</span>
                    </a>
                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 256 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                        <path d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"></path>
                    </svg>
                    <span class="page">Detalles del Carro</span>
                </div>
            </div>
            <section class="car-single">
                <div class="car-description">
                    <div class="car-container">
                        <div class="image">
                            <div class="image-gallery image-gallery-using-mouse" aria-live="polite">
                                <div class="image-gallery-content bottom">
                                    <div class="image-gallery-slide-wrapper bottom">
                                        <button type="button" class="image-gallery-icon image-gallery-left-nav" aria-label="Previous Slide">
                                            <svg class="image-gallery-svg" xmlns="http://www.w3.org/2000/svg" viewBox="6 0 12 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                                                <polyline points="15 18 9 12 15 6"></polyline>
                                            </svg>
                                        </button>
                                        <button type="button" class="image-gallery-icon image-gallery-right-nav" aria-label="Next Slide">
                                            <svg class="image-gallery-svg" xmlns="http://www.w3.org/2000/svg" viewBox="6 0 12 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                                                <polyline points="9 18 15 12 9 6"></polyline>
                                            </svg>
                                        </button>
                                        <div class="image-gallery-swipe">
                                            <div class="image-gallery-slides">
                                                <div aria-label="Go to Slide 1" tabindex="-1" class="image-gallery-slide  center " role="button" style="display: inherit; transform: translate3d(0%, 0px, 0px); transition: all 450ms ease-out 0s;">
                                                    <img class="image-gallery-image" src="/resources/images/productos/AUT013.png" alt="" srcset="" height="" width="" sizes="" title="" loading="eager">
                                                </div>
                                                <div aria-label="Go to Slide 2" tabindex="-1" class="image-gallery-slide  right " role="button" style="display: inherit; transform: translate3d(100%, 0px, 0px); transition: all 450ms ease-out 0s;">
                                                    <img class="image-gallery-image" src="/resources/images/productos/AUT013.png" alt="" srcset="" height="" width="" sizes="" title="" loading="eager">
                                                </div>
                                                <div aria-label="Go to Slide 3" tabindex="-1" class="image-gallery-slide  " role="button" style="display: inherit; transform: translate3d(200%, 0px, 0px); transition: all 450ms ease-out 0s;">
                                                    <img class="image-gallery-image" src="/resources/images/productos/AUT013.png" alt="" srcset="" height="" width="" sizes="" title="" loading="eager">
                                                </div>
                                                <div aria-label="Go to Slide 4" tabindex="-1" class="image-gallery-slide  left " role="button" style="display: inherit; transform: translate3d(-100%, 0px, 0px); transition: all 450ms ease-out 0s;">
                                                    <img class="image-gallery-image" src="/resources/images/productos/AUT013.png" alt="" srcset="" height="" width="" sizes="" title="" loading="eager">
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="image-gallery-icon image-gallery-play-button" aria-label="Play or Pause Slideshow">
                                            <svg class="image-gallery-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <polygon points="5 3 19 12 5 21 5 3"></polygon>
                                            </svg>
                                        </button>
                                        <button type="button" class="image-gallery-icon image-gallery-fullscreen-button" aria-label="Open Fullscreen">
                                            <svg class="image-gallery-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M8 3H5a2 2 0 0 0-2 2v3m18 0V5a2 2 0 0 0-2-2h-3m0 18h3a2 2 0 0 0 2-2v-3M3 16v3a2 2 0 0 0 2 2h3"></path>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="image-gallery-thumbnails-wrapper bottom thumbnails-swipe-horizontal">
                                        <div class="image-gallery-thumbnails">
                                            <nav class="image-gallery-thumbnails-container" aria-label="Thumbnail Navigation" style="transform: translate3d(0px, 0px, 0px); transition: all 450ms ease-out 0s;">
                                                <div class="image">
                                                    <img src="resources/images/productos/AUT013.png" alt=""/>
                                                </div>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                            <div class="text">
                                <div class="car-intro">
                                    <h2>Nissan Rogue</h2>
                                    <div class="price">S/38 | día</div>
                                    <div class="rating">
                                        <div class="icon"> <!-- Aquí debería estar el icono de la calificación -->
                                        </div>
                                    </div>
                                </div>
                                <div class="box">
                                    <p>Vehículo compacto popular que ofrece una combinación de eficiencia, tecnología avanzada y un interior espacioso. Es conocido por su comodidad en la conducción y su versatilidad, lo que lo convierte en una excelente opción para familias y viajeros.</p>
                                    <button type="submit">
                                        <a class="btn" href="checkout.jsp">checkout</a>
                                    </button>
                                </div>
                                <div class="details">
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>Nissan</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>SUV</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>2019</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>4 Asientos</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>gasolina</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>Gris</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 480 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>4 puertas</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>Gran Manejo</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>Calidad</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>35000</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>...</span></h3>
                                    <h3><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg><span>Seguridad Garantizada</span></h3>
                                </div>
                            </div>
                        </div>   
                    </div>
                    <div class="car-info">
                        <div class="car-info-tabs">
                            <button type="button" class="info-btn active">Descripcion</button>
                            <button type="button" class="info-btn ">Información Adicional</button>
                            <button type="button" class="info-btn ">Reseñas</button>
                        </div>
                        <div class="description car-info-gallery">
                            <p>Lorem Ipsum Dolor Sit, Amet Consectetur Adipisicing Elit. Placeat, Culpa Doloremque Suscipit Tempore Id A Odit.</p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
