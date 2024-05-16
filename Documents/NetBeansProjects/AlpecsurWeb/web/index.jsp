<%-- 
    Document   : index
    Created on : 14/05/2024, 02:23:37 PM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alpecsur</title>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/2f5c7bb71d.js"></script>
        <link rel="stylesheet" href="estilos.css?v=1.2">
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
                    <li><a href="carrito.jsp"><i class="fa-solid fa-cookie-bite"></i> Producto</a></li>
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
        <section></section>
        

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    </body>
</html>
