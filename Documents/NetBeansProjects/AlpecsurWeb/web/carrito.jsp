<%-- 
    Document   : carrito
    Created on : 14/05/2024, 02:23:53 PM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto | Alpecsur</title>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/2f5c7bb71d.js"></script>
        <link rel="stylesheet" href="estilos.css?v=1.6">
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
                    <li><a href="#"><i class="fa-solid fa-cookie-bite"></i> Producto</a></li>
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
        <div class="container-carrito">
            <div class="cont-carrito-main">
                <div class="content-wrapper">
                    <main class="main-content">
                        <section class="product-categories-section">
                            <div class="section-header">
                                <h2>Categorías de Producto</h2>
                            </div>
                            <ul class="product-categories">
                                <li class="category-item">
                                    <a href="#">Aceite Vegetal</a>
                                    <span class="product-count">4</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Aceitunas y Derivados</a>
                                    <span class="product-count">5</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Cacao y Derivados</a>
                                    <span class="product-count">8</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Cereales y Granos</a>
                                    <span class="product-count">3</span>
                                </li>
                                <li class="category-item">
                                    <a href="#">Chocolates</a>
                                    <span class="product-count">10</span>
                                </li>
                            </ul>
                        </section>
                    </main>
                </div>
                <aside class="shop-section">
                    <div class="shop-header">
                        <h1 class="shop-title">Tienda</h1>
                    </div>
                    <div class="products-wrapper">
                        <div class="product-item">
                            <img src="https://campograndeperu.com/wp-content/uploads/2023/10/aceites-campo-grande-300x300.jpg" alt="Aceite Vegetal">
                            <h3><a href="#">Aceite Vegetal</a></h3>
                            <span>4 productos</span>
                        </div>
                        <div class="product-item">
                            <img src="https://campograndeperu.com/wp-content/uploads/2023/10/aceitunas-campo-grande-300x300.jpg" alt="Aceitunas y Derivados">
                            <h3><a href="#">Aceitunas y Derivados</a></h3>
                            <span>5 productos</span>
                        </div>
                        <div class="product-item">
                            <img src="https://campograndeperu.com/wp-content/uploads/2023/10/grano-de-cacao-campo-grande-300x300.jpg" alt="Cacao y Derivados">
                            <h3><a href="#">Cacao y Derivados</a></h3>
                            <span>8 productos</span>
                        </div>
                        <div class="product-item">
                            <img src="https://campograndeperu.com/wp-content/uploads/2023/10/cereales-campo-grande-300x300.jpg" alt="Cereales y Granos">
                            <h3><a href="#">Cereales y Granos</a></h3>
                            <span>3 productos</span>
                        </div>
                        <div class="product-item">
                            <img src="https://campograndeperu.com/wp-content/uploads/2023/10/chocolates-campo-grande-300x300.jpg" alt="Cereales y Granos">
                            <h3><a href="#">Chocolates</a></h3>
                            <span>10 productos</span>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </body>
</html>
