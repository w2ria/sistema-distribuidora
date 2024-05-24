<%-- 
    Document   : checkout
    Created on : 23/05/2024, 11:55:01 PM
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
        <link href="resources/css/checkout.css" rel="stylesheet" type="text/css"/>
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
                    <h2>Checkout</h2>
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
                    <span class="page">Checkout</span>
                </div>
            </div>
            <section class="checkout">
                <form>
                    <div class="box-1">
                        <div class="contact details checkout-item">
                            <div class="heading">
                                <span></span>
                                <h2>Datos Contacto</h2>
                            </div>
                            <div class="form">
                                <div class="input-box">
                                    <input type="text" name="first-name" placeholder="nombres" id="first-name" class="box" required>
                                    <input type="text" name="last-name" placeholder="apellidos" id="last-name" class="box" required>
                                </div>
                                <input type="text" name="company" placeholder="compañia" id="company" class="box" required>
                                <input type="text" name="country" placeholder="nacionalidad" id="country" class="box" required>
                                <input type="text" name="address" placeholder="direccion" id="address" class="box" required>
                                <div class="input-box">
                                    <input type="text" name="city" placeholder="ciudad | Distrito" id="city" class="box" required>
                                    <input type="text" name="zip" placeholder="referencia" id="zip" class="box" required>
                                </div>
                                <div class="input-box">
                                    <input type="number" name="number" placeholder="telefono" id="number" class="box" required>
                                    <input type="email" name="email" placeholder="email" id="email" class="box" required>
                                </div>
                            </div>
                        </div>
                        <div class="booking details checkout-item">
                            <div class="heading">
                                <span></span>
                                <h2>booking details</h2>
                            </div>
                            <div class="form">
                                <div class="input-box">
                                    <input type="text" name="from-address" placeholder="direccion de envio" id="from-address" class="box" required>
                                    <input type="text" name="to-address" placeholder="referencia" id="to-address" class="box" required>
                                </div>
                                <div class="input-box">
                                    <input type="date" name="pickup-date" placeholder="pickup date" id="pickup-date" class="box">
                                    <input type="time" name="pickup-time" placeholder="pickup time" id="pickup-time" class="box">
                                </div>
                                <div class="input-box">
                                    <input type="date" name="drop-date" placeholder="dropoff date" id="dropoff-date" class="box">
                                    <input type="time" name="drop-time" placeholder="dropoff time" id="dropoff-time" class="box">
                                </div>
                                <textarea cols="30" rows="10" name="comment" class="box" id="comment" placeholder="message"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="box-2">
                        <div class="payment-methods checkout-item">
                            <div class="heading">
                                <span></span>
                                <h2>Adquisicion</h2>
                            </div>
                            <div class="box-container">
                                <div class="item">
                                    <input type="radio" id="direct-bank-transfer" name="payment" value="DIRECT">
                                    <label for="direct-bank-transfer">Recojo en Sucursal</label>
                                    <div class="payment-body active">
                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have our account.</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <input type="radio" id="cash-on-delivery" name="payment" value="CASH">
                                    <label for="cash-on-delivery">Envio a ubicacion</label>
                                    <div class="payment-body active">
                                        <p>Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cart-total checkout-item">
                            <div class="heading">
                                <span></span>
                                <h2>Detalles de Pago</h2>
                            </div>
                            <div class="shop-summary">
                                <div class="summary-item">
                                    <div class="box name">sub total</div>
                                    <div class="box value">S/38</div>
                                </div>
                                <div class="summary-item">
                                    <div class="box name">Envio</div>
                                    <div class="box value">S/15</div>
                                </div>
                                <div class="summary-item">
                                    <div class="box name">total</div>
                                    <div class="box value">S/53</div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" name="submit" id="submit" class="btn">Pagar</button>
                    </div>
                </form>
            </section>

    </body>
</html>
