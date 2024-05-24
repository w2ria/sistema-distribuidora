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
            <div class="page-title">
                <div class="title">
                    <h2>Lista de Carros</h2>
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
                    <span class="page">Lista de Carros</span>
                </div>
            </div>
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
            <section class="cars">
                <div class="car-intro">
                    <div class="showing"> 1 de 3 </div>
                    <div class="custom-select sorting box css-b62m3t-container">
                        <span id="react-select-11-live-region" class="css-7pg0cj-a11yText"></span>
                        <span aria-live="polite" aria-atomic="false" aria-relevant="additions text" class="css-7pg0cj-a11yText"></span>
                        <div class="custom-select-prefix__control css-13cymwt-control">
                            <div class="custom-select-prefix__value-container custom-select-prefix__value-container--has-value css-hlgwow">
                                <div class="custom-select-prefix__single-value css-1dimb5e-singleValue">default</div>
                                <input id="react-select-11-input" tabindex="0" inputmode="none" aria-autocomplete="list" aria-expanded="false" aria-haspopup="true" role="combobox" aria-readonly="true" class="css-1hac4vs-dummyInput" value="">
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
                </div>
                <div class="car-container list">
                    <div class="car-item">
                        <div class="image">
                            <img src="resources/images/productos/AUT005.png" alt=""/>
                            <div class="price">S/35<span>/día</span></div>
                        </div>
                        <div class="content">
                            <div class="rating">
                                <div class="icon"></div>
                            </div>
                            <a location="[object Object]" href="/Cars/Mazda MX-5 Miata"><h2>Honda Accord</h2></a>
                            <div class="details">
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Honda</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Sedan</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>2017</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>4 Asientos</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Gasolina</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Rojo</span>
                                </h3>
                            </div>
                            <p>Sedán de tamaño mediano conocido por su fiabilidad, eficiencia y comodidad. Viene con dos opciones de motor: un eficiente cuatro cilindros de 2.4 litros y un potente V6 de 3.5 litros. </p>
                            <button type="submit">
                                <a class="btn" href="detallesCarro.jsp">Rentar</a>
                            </button>
                        </div>
                    </div>
                    <div class="car-item">
                        <div class="image">
                            <img src="resources/images/productos/AUT009.png" alt=""/>
                            <div class="price">S/38<span>/día</span></div>
                        </div>
                        <div class="content">
                            <div class="rating">
                                <div class="icon"></div>
                            </div>
                            <a location="[object Object]" href="/Cars/Mazda MX-5 Miata"><h2>Mazda 6 Wagon</h2></a>
                            <div class="details">
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Mazda</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Station Wagon</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>2017</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>4 Asientos</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Gasolina</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Gris</span>
                                </h3>
                            </div>
                            <p>Vehículo familiar que combina elegehancia, funcionalidad y un rendimiento impresionante. Este modelo cuenta con un motor de cuatro cilindros de 2.5 litros que proporciona una potencia adecuada y una excelente eficiencia de combustible. </p>
                            <button type="submit">
                                <a class="btn" href="/cart">Rentar</a>
                            </button>
                        </div>
                    </div>
                    <div class="car-item">
                        <div class="image">
                            <img src="resources/images/productos/AUT012.png" alt=""/>
                            <div class="price">S/38<span>/día</span></div>
                        </div>
                        <div class="content">
                            <div class="rating">
                                <div class="icon"></div>
                            </div>
                            <a location="[object Object]" href="/Cars/Mazda MX-5 Miata"><h2>BMW x2</h2></a>
                            <div class="details">
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>BMW</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>HatchBack</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>2019</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>4 Asientos</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Gasolina</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Negro</span>
                                </h3>
                            </div>
                            <p>Vehículo compacto que combina un diseño audaz y deportivo con la elegancia y lujo característicos de BMW. Con un motor turboalimentado de 2.0 litros y cuatro cilindros, el X2 2019 ofrece una experiencia de conducción dinámica y ágil, proporcionando una potencia de 228 caballos de fuerza y una aceleración rápida. </p>
                            <button type="submit">
                                <a class="btn" href="/cart">Rentar</a>
                            </button>
                        </div>
                    </div>
                    <div class="car-item">
                        <div class="image">
                            <img src="resources/images/productos/AUT013.png" alt=""/>
                            <div class="price">S/38<span>/día</span></div>
                        </div>
                        <div class="content">
                            <div class="rating">
                                <div class="icon"></div>
                            </div>
                            <a location="[object Object]" href="/Cars/Mazda MX-5 Miata"><h2>Nissan Rogue</h2></a>
                            <div class="details">
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Nissan</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>SUV</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>2019</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>4 Asientos</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Gasolina</span>
                                </h3>
                                <h3>
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"></svg>
                                    <span>Gris</span>
                                </h3>
                            </div>
                            <p>Vehículo compacto popular que ofrece una combinación de eficiencia, tecnología avanzada y un interior espacioso. Es conocido por su comodidad en la conducción y su versatilidad, lo que lo convierte en una excelente opción para familias y viajeros.</p>
                            <button type="submit">
                                <a class="btn" href="detallesCarro.jsp">Rentar</a>
                            </button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
