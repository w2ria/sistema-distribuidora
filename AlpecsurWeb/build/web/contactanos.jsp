<%-- 
    Document   : contactanos
    Created on : 18 may. 2024, 8:02:33 p. m.
    Author     : ferna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contacto | Tienda Mayorista AlpecSur Online</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Estilos Personalizados -->
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
        <nav class="py-2 bg-dark">
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

        <!-- Contenido Principal -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">CONTACTANOS</h2>
            <p class="text-center mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

            <div class="row mb-5">
                <div class="col-md-4 panelImformacion">
                    <h3>INFORMACIÓN DE CONTACTO</h3>
                    <p>Llámanos al<br><i class="bi bi-telephone"></i> 01 ********</p>
                    <p>Escríbenos<br><i class="bi bi-whatsapp"></i> **** *** ***</p>
                    <p>Realiza tu consulta<br><i class="bi bi-envelope"></i> asdadadas@nombre.com</p>
                    <div class="mt-3">
                        <a href="https://www.facebook.com" target="_blank" class="text-dark mx-2">
                            <i class="bi bi-facebook" style="font-size: 1.5rem;"></i>
                        </a>
                        <a href="https://www.instagram.com" target="_blank" class="text-dark mx-2">
                            <i class="bi bi-instagram" style="font-size: 1.5rem;"></i>
                        </a>
                        <a href="https://www.twitter.com" target="_blank" class="text-dark mx-2">
                            <i class="bi bi-twitter" style="font-size: 1.5rem;"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-8">
                    <h3>DÉJANOS UN MENSAJE</h3>
                    <form class="row g-3">
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Nombre">
                        </div>
                        <div class="col-md-6">
                            <input type="email" class="form-control" placeholder="Correo electrónico">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Asunto">
                        </div>
                        <div class="col-md-6">
                            <input type="tel" class="form-control" placeholder="Número celular">
                        </div>
                        <div class="col-12">
                            <textarea class="form-control" placeholder="Escríbenos un mensaje..."></textarea>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-outline-dark">ENVIAR</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Sección de Ubicación -->
            <div class="text-center mb-5">
                <h2 class="mb-4">¿DÓNDE NOS UBICAMOS?</h2>
                <div class="mapa-container">
                    <img src="https://via.placeholder.com/1200x400" alt="Mapa de Google Maps" class="img-fluid">
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-light py-5 mt-5">
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
    </body>
</html>

