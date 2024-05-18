
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto | Alpecsur</title>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/2f5c7bb71d.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="estilos.css?v=1.9">
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
                                <div class="product-image" style="margin-bottom: 0;"></div>
                                <div class="product-top">
                                    <a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/" class="product-image-link">
                                        <img width="1000" height="1000" src="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg" alt="compra y venta de aceite de ajonjoli por mayor y menor peru envíos a todo lima y provincias" decoding="async" srcset="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg 1000w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-300x300.jpg 300w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-150x150.jpg 150w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-768x768.jpg 768w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-600x600.jpg 600w" sizes="(max-width: 1000px) 100vw, 1000px">
                                    </a>
                                </div>

                                <div class="product-bottom">
                                    <h3 class="product-title"><a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/">Aceite de Ajonjolí X 250 ml</a></h3>
                                    <div class="price-wrapper">
                                        <span class="price">S/ 16.00</span>
                                    </div>
                                    <div class="add-to-cart">
                                        <div class="quantity">
                                            <input type="button" value="-" class="minus">
                                            <label class="screen-reader-text" for="quantity_2430"></label>
                                            <input type="number" id="quantity_2430" class="quantity-input" value="1" min="1" step="1">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                        <a href="?add-to-cart=2430" class="button add-to-cart-button" data-product_id="2430" data-product_sku="AVGAJO/0250M" aria-label="Añadir al carrito: “Aceite de Ajonjolí X 250 ml / unidad”" rel="nofollow"><span>Agregar</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-item">
                                <div class="product-image" style="margin-bottom: 0;"></div>
                                <div class="product-top">
                                    <a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/" class="product-image-link">
                                        <img width="1000" height="1000" src="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg" alt="compra y venta de aceite de ajonjoli por mayor y menor peru envíos a todo lima y provincias" decoding="async" srcset="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg 1000w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-300x300.jpg 300w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-150x150.jpg 150w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-768x768.jpg 768w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-600x600.jpg 600w" sizes="(max-width: 1000px) 100vw, 1000px">
                                    </a>
                                </div>

                                <div class="product-bottom">
                                    <h3 class="product-title"><a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/">Aceite de Ajonjolí X 250 ml</a></h3>
                                    <div class="price-wrapper">
                                        <span class="price">S/ 16.00</span>
                                    </div>
                                    <div class="add-to-cart">
                                        <div class="quantity">
                                            <input type="button" value="-" class="minus">
                                            <label class="screen-reader-text" for="quantity_2430"></label>
                                            <input type="number" id="quantity_2430" class="quantity-input" value="1" min="1" step="1">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                        <a href="?add-to-cart=2430" class="button add-to-cart-button" data-product_id="2430" data-product_sku="AVGAJO/0250M" aria-label="Añadir al carrito: “Aceite de Ajonjolí X 250 ml / unidad”" rel="nofollow"><span>Agregar</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-item">
                                <div class="product-image" style="margin-bottom: 0;"></div>
                                <div class="product-top">
                                    <a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/" class="product-image-link">
                                        <img width="1000" height="1000" src="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg" alt="compra y venta de aceite de ajonjoli por mayor y menor peru envíos a todo lima y provincias" decoding="async" srcset="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg 1000w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-300x300.jpg 300w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-150x150.jpg 150w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-768x768.jpg 768w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-600x600.jpg 600w" sizes="(max-width: 1000px) 100vw, 1000px">
                                    </a>
                                </div>

                                <div class="product-bottom">
                                    <h3 class="product-title"><a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/">Aceite de Ajonjolí X 250 ml</a></h3>
                                    <div class="price-wrapper">
                                        <span class="price">S/ 16.00</span>
                                    </div>
                                    <div class="add-to-cart">
                                        <div class="quantity">
                                            <input type="button" value="-" class="minus">
                                            <label class="screen-reader-text" for="quantity_2430"></label>
                                            <input type="number" id="quantity_2430" class="quantity-input" value="1" min="1" step="1">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                        <a href="?add-to-cart=2430" class="button add-to-cart-button" data-product_id="2430" data-product_sku="AVGAJO/0250M" aria-label="Añadir al carrito: “Aceite de Ajonjolí X 250 ml / unidad”" rel="nofollow"><span>Agregar</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-item">
                                <div class="product-image" style="margin-bottom: 0;"></div>
                                <div class="product-top">
                                    <a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/" class="product-image-link">
                                        <img width="1000" height="1000" src="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg" alt="compra y venta de aceite de ajonjoli por mayor y menor peru envíos a todo lima y provincias" decoding="async" srcset="https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli.jpg 1000w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-300x300.jpg 300w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-150x150.jpg 150w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-768x768.jpg 768w, https://campograndeperu.com/wp-content/uploads/2023/10/venta-por-mayor-y-menor-de-aceite-de-ajonjoli-600x600.jpg 600w" sizes="(max-width: 1000px) 100vw, 1000px">
                                    </a>
                                </div>

                                <div class="product-bottom">
                                    <h3 class="product-title"><a href="https://campograndeperu.com/producto/aceite-de-ajonjoli/">Aceite de Ajonjolí X 250 ml</a></h3>
                                    <div class="price-wrapper">
                                        <span class="price">S/ 16.00</span>
                                    </div>
                                    <div class="add-to-cart">
                                        <div class="quantity">
                                            <input type="button" value="-" class="minus">
                                            <label class="screen-reader-text" for="quantity_2430"></label>
                                            <input type="number" id="quantity_2430" class="quantity-input" value="1" min="1" step="1">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                        <a href="?add-to-cart=2430" class="button add-to-cart-button" data-product_id="2430" data-product_sku="AVGAJO/0250M" aria-label="Añadir al carrito: “Aceite de Ajonjolí X 250 ml / unidad”" rel="nofollow"><span>Agregar</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                </aside>
            </div>
        </div>
    </body>
</html>
