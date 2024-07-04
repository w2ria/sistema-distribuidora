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
        <title>Tienda Mayorista | AlpecSur Online</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/index.css"/>
        <link rel="stylesheet" href="resources/css/busqueda.css"/>
    </head>
    <body>
        <!-- Header de Presentaci�n -->
        <header class="py-3">
            <div class="container d-flex align-items-center justify-content-between">
                <a href="index.jsp">
                    <img src="https://via.placeholder.com/150" alt="Logo" class="img-fluid" style="max-height: 60px;">
                </a>
                <div class="position-relative flex-grow-1 mx-3">
                    <input class="form-control me-2" type="search" id="searchInput" placeholder="Buscar Productos" aria-label="Buscar Productos">
                    <div id="searchResults" class="search-results"></div>
                </div>
                <div>
                    <% if (usuario != null && cliente != null) {%>
                    <span class="text-white mx-2">Bienvenido, <%= cliente.getNombre()%></span>
                    <a href="logout.jsp" class="btn btn-outline-light">Cerrar Sesi�n</a>
                    <% } else { %>
                    <a href="login.jsp" class="text-white mx-2"><i class="bi bi-person"></i></a>
                        <% }%>
                    <a href="#" class="text-white mx-2"><i class="bi bi-eye"></i></a>
                        <% Integer contadorCarrito = (Integer) session.getAttribute("contadorCarrito");%>
                    <a href="controlador?accion=Carrito" class="text-white mx-2"><i class="bi bi-cart">(<label style="color:white;">${contadorCarrito != null ? contadorCarrito : 0}</label>)</i></a>
                </div>
            </div>
        </header>

        <!-- Barra de Navegaci�n -->
        <nav class="py-2 borde">
            <div class="container d-flex justify-content-around">
                <a href="controlador?accion=productos" class="btn btn-outline-dark"><i class="bi bi-box"></i> Productos</a>
                <a href="catalogo.jsp" class="btn btn-outline-dark"><i class="bi bi-book"></i> Cat�logo</a>
                <a href="nosotros.jsp" class="btn btn-outline-dark"><i class="bi bi-people"></i> Nosotros</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                <a href="contactanos.jsp" class="btn btn-outline-dark"><i class="bi bi-envelope"></i> Contacto</a>
            </div>
        </nav>

        <!-- Carrusel de Im�genes -->
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

        <!-- Nueva secci�n de Productos M�s Vendidos -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">PRODUCTOS M�S VENDIDOS</h2>
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
                <p class="text-justify">Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est�ndar de las industrias desde el a�o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us� una galer�a de textos y los mezcl� de tal manera que logr� hacer un libro de textos especimen. No s�lo sobrevivi� 500 a�os, sino que tambi�n ingres� como texto de relleno en documentos electr�nicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creaci�n de las hojas "Letraset", las cuales conten�an pasajes de Lorem Ipsum, y m�s recientemente con software de autoedici�n, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>
                <div class="mt-5">
                    <img src="#" alt="Imagen Banner" class="img-fluid w-100" style="height: 200px; object-fit: cover;">
                </div>
            </div>
        </div>

        <!-- Secci�n de Env�os -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">NUESTRA DISTRIBUIDORA REALIZA ENVIOS A GRAN PARTE DEL PER�</h2>
            <div class="row justify-content-center">
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Imagen de Env�o" class="img-fluid mb-2">
                    <p>Distrito</p>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Imagen de Env�o" class="img-fluid mb-2">
                    <p>Distrito</p>
                </div>
                <div class="col-6 col-md-2 text-center mb-4">
                    <img src="https://via.placeholder.com/150" alt="Imagen de Env�o" class="img-fluid mb-2">
                    <p>Distrito</p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-6">
                    <p class="text-justify">Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est�ndar de las industrias desde el a�o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us� una galer�a de textos y los mezcl� de tal manera que logr� hacer un libro de textos especimen. No s�lo sobrevivi� 500 a�os, sino que tambi�n ingres� como texto de relleno en documentos electr�nicos, quedando esencialmente igual al original.</p>
                    <p class="text-justify">Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est�ndar de las industrias desde el a�o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us� una galer�a de textos y los mezcl� de tal manera que logr� hacer un libro de textos especimen. No s�lo sobrevivi� 500 a�os, sino que tambi�n ingres� como texto de relleno en documentos electr�nicos, quedando esencialmente igual al original.</p>
                </div>
                <div class="col-md-6 text-center">
                    <img src="https://via.placeholder.com/350x350" alt="Mapa del Per�" class="img-fluid mb-2">
                    <div class="mt-2">
                        <button class="btn btn-outline-dark">Ver mapa</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Secci�n de Nuestros Art�culos -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">NUESTROS ART�CULOS</h2>
            <div class="row justify-content-center">
                <div class="col-12 col-md-4 text-center mb-4">
                    <img src="https://via.placeholder.com/300" alt="Art�culo 1" class="img-fluid mb-2">
                    <p class="fw-bold">10 Nov 2023</p>
                    <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.</p>
                    <button class="btn btn-outline-dark">Continuar Leyendo</button>
                </div>
                <div class="col-12 col-md-4 text-center mb-4">
                    <img src="https://via.placeholder.com/300" alt="Art�culo 2" class="img-fluid mb-2">
                    <p class="fw-bold">20 Dic 2023</p>
                    <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.</p>
                    <button class="btn btn-outline-dark">Continuar Leyendo</button>
                </div>
                <div class="col-12 col-md-4 text-center mb-4">
                    <img src="https://via.placeholder.com/300" alt="Art�culo 3" class="img-fluid mb-2">
                    <p class="fw-bold">15 Mar 2024</p>
                    <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.</p>
                    <button class="btn btn-outline-dark">Continuar Leyendo</button>
                </div>
            </div>
        </div>

        <!-- Modal de Compra Exitosa -->
        <div class="modal fade" id="compraExitosaModal" tabindex="-1" aria-labelledby="compraExitosaModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="compraExitosaModalLabel">Compra Exitosa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        �Tu compra ha sido realizada con �xito!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
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
                                <p><a href="#">Atenci�n al Cliente</a></p>
                                <p><a href="#">Pol�ticas y Condiciones</a></p>
                            </div>
                            <div class="col-12">
                                <p><a href="#">Inf�rmate</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center">
                        <h5>S�guenos</h5>
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

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- jQuery para manejo de AJAX y Bootstrap para estilos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/busqueda.js?<%= System.currentTimeMillis()%>"></script>
        <script>
            $(document).ready(function () {
                var compraExitosa = '<%= request.getParameter("compraExitosa")%>';
                if (compraExitosa && compraExitosa === 'true') {
                    $('#compraExitosaModal').modal('show');
                }
            });
        </script>
    </body>
</html>
