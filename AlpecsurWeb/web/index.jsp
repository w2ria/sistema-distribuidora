<%-- 
    Document   : index
    Created on : 14/05/2024, 02:23:37 PM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tienda Mayorista | AlpecSur Online</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/index.css"/>
    </head>
    <body>
        <!-- Header de Presentación -->
        <header class="py-3">
            <div class="container d-flex align-items-center justify-content-between">
                <a href="index.jsp">
                    <img src="https://via.placeholder.com/150" alt="Logo" class="img-fluid" style="max-height: 60px;">
                </a>
                <form class="d-flex flex-grow-1 mx-3">
                    <input class="form-control me-2" type="search" placeholder="Buscar Productos" aria-label="Buscar Productos">
                    <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
                </form>
                <div>
                    <a href="#" class="text-white mx-2">¿Necesitas Ayuda? <i class="bi bi-caret-down-fill"></i></a>
                    <a href="#" class="text-white mx-2"><i class="bi bi-person"></i></a>
                    <a href="#" class="text-white mx-2"><i class="bi bi-eye"></i></a>
                    <a href="#" class="text-white mx-2"><i class="bi bi-cart"></i></a>
                </div>
            </div>
        </header>

        <!-- Barra de Navegación -->
        <nav class="py-2 borde">
            <div class="container d-flex justify-content-around">
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-box"></i> Productos</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-tags"></i> Promociones</a>
                <a href="catalogo.jsp" class="btn btn-outline-dark"><i class="bi bi-book"></i> Catálogo</a>
                <a href="nosotros.jsp" class="btn btn-outline-dark"><i class="bi bi-people"></i> Nosotros</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-geo-alt"></i> Zonas de Envío</a>
                <a href="contactanos.jsp" class="btn btn-outline-dark"><i class="bi bi-envelope"></i> Contacto</a>
            </div>
        </nav>

        <!-- Carrusel de Imágenes -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="resources/images/carros.jpg" class="d-block w-100 hidden" alt="Imagen 1">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/carro2.jpg" class="d-block w-100 hidden" alt="Imagen 2">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/carro3.jpg" class="d-block w-100 hidden" alt="Imagen 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>

        <!-- Nueva sección de Productos Más Vendidos -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">PRODUCTOS MÁS VENDIDOS</h2>
            <div class="row justify-content-center">
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Nombre del Producto" class="img-fluid mb-2">
                    <p>Nombre del Producto</p>
                    <div class="input-group mb-3">
                        <input type="number" class="form-control" value="0" min="0">
                        <button class="btn btn-outline-dark">Agregar</button>
                    </div>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Nombre del Producto" class="img-fluid mb-2">
                    <p>Nombre del Producto</p>
                    <div class="input-group mb-3">
                        <input type="number" class="form-control" value="0" min="0">
                        <button class="btn btn-outline-dark">Agregar</button>
                    </div>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Nombre del Producto" class="img-fluid mb-2">
                    <p>Nombre del Producto</p>
                    <div class="input-group mb-3">
                        <input type="number" class="form-control" value="0" min="0">
                        <button class="btn btn-outline-dark">Agregar</button>
                    </div>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Nombre del Producto" class="img-fluid mb-2">
                    <p>Nombre del Producto</p>
                    <div class="input-group mb-3">
                        <input type="number" class="form-control" value="0" min="0">
                        <button class="btn btn-outline-dark">Agregar</button>
                    </div>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Nombre del Producto" class="img-fluid mb-2">
                    <p>Nombre del Producto</p>
                    <div class="input-group mb-3">
                        <input type="number" class="form-control" value="0" min="0">
                        <button class="btn btn-outline-dark">Agregar</button>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="#" class="btn btn-outline-dark">Ir a Tienda Online</a>
            </div>
        </div>

        <div class="container mt-5">
            <div class="text-center">
                <h2 class="mb-4">Tienda Mayorista | AlpecSur Online</h2>
                <p class="text-justify">Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que también ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenían pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>
                <div class="mt-5">
                    <img src="#" alt="Imagen Banner" class="img-fluid w-100" style="height: 200px; object-fit: cover;">
                </div>
            </div>
        </div>

        <!-- Sección de Envíos -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">NUESTRA DISTRIBUIDORA REALIZA ENVIOS A GRAN PARTE DEL PERÚ</h2>
            <div class="row justify-content-center">
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Imagen de Envío" class="img-fluid mb-2">
                    <p>Distrito</p>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Imagen de Envío" class="img-fluid mb-2">
                    <p>Distrito</p>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Imagen de Envío" class="img-fluid mb-2">
                    <p>Distrito</p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-6">
                    <p class="text-justify">Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que también ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original.</p>
                    <p class="text-justify">Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que también ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original.</p>
                </div>
                <div class="col-md-6 text-center">
                    <img src="https://via.placeholder.com/350x350" alt="Mapa del Perú" class="img-fluid mb-2">
                    <div class="mt-2">
                        <button class="btn btn-outline-dark">Ver mapa</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sección de Nuestros Artículos -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">NUESTROS ARTÍCULOS</h2>
            <div class="row justify-content-center">
                <div class="col-12 col-md-4 text-center mb-4">
                    <img src="https://via.placeholder.com/300" alt="Artículo 1" class="img-fluid mb-2">
                    <p class="fw-bold">10 Nov 2023</p>
                    <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.</p>
                    <button class="btn btn-outline-dark">Continuar Leyendo</button>
                </div>
                <div class="col-12 col-md-4 text-center mb-4">
                    <img src="https://via.placeholder.com/300" alt="Artículo 2" class="img-fluid mb-2">
                    <p class="fw-bold">20 Dic 2023</p>
                    <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.</p>
                    <button class="btn btn-outline-dark">Continuar Leyendo</button>
                </div>
                <div class="col-12 col-md-4 text-center mb-4">
                    <img src="https://via.placeholder.com/300" alt="Artículo 3" class="img-fluid mb-2">
                    <p class="fw-bold">15 Mar 2024</p>
                    <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.</p>
                    <button class="btn btn-outline-dark">Continuar Leyendo</button>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="text-light py-5 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 text-center">
                        <a href="index.jsp">
                            <img src="https://via.placeholder.com/150" alt="Logo" class="img-fluid mb-3">
                        </a>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-6">
                                <p><a href="#">Acerca de</a></p>
                                <p><a href="#">Mi Cuenta</a></p>
                            </div>
                            <div class="col-6">
                                <p><a href="#">Atención al Cliente</a></p>
                                <p><a href="#">Políticas y Condiciones</a></p>
                            </div>
                            <div class="col-12">
                                <p><a href="#">Infórmate</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center">
                        <h5>Síguenos</h5>
                        <a href="https://www.facebook.com" target="_blank" class="text-warning mx-2">
                            <i class="bi bi-facebook" style="font-size: 1.5rem;"></i>
                        </a>
                        <a href="https://www.instagram.com" target="_blank" class="text-warning mx-2">
                            <i class="bi bi-instagram" style="font-size: 1.5rem;"></i>
                        </a>
                        <a href="https://www.twitter.com" target="_blank" class="text-warning mx-2">
                            <i class="bi bi-twitter" style="font-size: 1.5rem;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    </body>
</html>

