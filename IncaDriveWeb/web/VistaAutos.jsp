<%-- 
    Document   : VistaAutos
    Created on : 23/05/2024, 12:45:41 AM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Usuario"%>
<%@ page session="true" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tienda Mayorista | AlpecSur Online</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/index.css?v=1.3"/>
        <title>JSP Page</title>
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
                    <% if (usuario != null && cliente != null) {%>
                    <span class="text-white mx-2">Bienvenido, <%= cliente.getNombre()%></span>
                    <a href="logout.jsp" class="btn btn-outline-light">Cerrar Sesión</a>
                    <% } else { %>
                    <a href="login.jsp" class="text-white mx-2"><i class="bi bi-person"></i></a>
                        <% }%>
                    <a href="#" class="text-white mx-2"><i class="bi bi-eye"></i></a>
                    <a href="controlador?accion=Carrito" class="text-white mx-2"><i class="bi bi-cart">(<label style="co">${cont}</label>)</i></a>
                </div>
            </div>
        </header>

        <!-- Barra de Navegación -->
        <nav class="py-2 borde">
            <div class="container d-flex justify-content-around">
                <a href="controlador?accion=productos" class="btn btn-outline-dark"><i class="bi bi-box"></i> Productos</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-tags"></i> Promociones</a>
                <a href="catalogo.jsp" class="btn btn-outline-dark"><i class="bi bi-book"></i> Catálogo</a>
                <a href="nosotros.jsp" class="btn btn-outline-dark"><i class="bi bi-people"></i> Nosotros</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-truck"></i> Ventas Mayoristas</a>
                <a href="#" class="btn btn-outline-dark"><i class="bi bi-geo-alt"></i> Zonas de Envío</a>
                <a href="contactanos.jsp" class="btn btn-outline-dark"><i class="bi bi-envelope"></i> Contacto</a>
            </div>
        </nav>
        <div class="form-container">
            <form>
              <div class="desktop-view">
                <div class="location">
                  <div class="field-container">
                    <label class="field-label">Pick-up and Drop-off</label>
                    <input type="text" class="field-input" placeholder="Placeholder" value="Lima (and vicinity), Lima Region, Peru">
                    <button aria-label="Pick-up and Drop-off Lima (and vicinity), Lima Region, Peru" aria-expanded="false" class="fake-input" type="button">
                      Lima (and vicinity), Lima Region, Peru
                    </button>
                    <svg class="field-icon" aria-hidden="true" viewBox="0 0 24 24">
                      <path fill-rule="evenodd" d="M5 9a7 7 0 1 1 14 0c0 5.25-7 13-7 13S5 14.25 5 9zm4.5 0a2.5 2.5 0 1 0 5 0 2.5 2.5 0 0 0-5 0z" clip-rule="evenodd"></path>
                    </svg>
                  </div>
                  <div class="diff-drop-off-section">
                    <fieldset>
                      <div class="checkbox">
                        <input type="checkbox" name="diff-loc" id="diff-loc" class="checkbox-input" value="">
                        <label class="checkbox-label" for="diff-loc">
                          Add a different drop-off location
                        </label>
                      </div>
                    </fieldset>
                  </div>
                </div>
                <div class="date-picker-fields">
                  <div class="date-field">
                    <label for="cars-pick-up" class="field-label">Pick-up date</label>
                    <input id="cars-pick-up" name="startDate" type="text" class="field-input" placeholder="Select date" value="2024-06-01">
                    <button aria-label="Pick-up date June 1, 2024" id="cars-pick-up-btn" type="button" class="fake-input">Jun 1</button>
                    <svg class="field-icon" aria-hidden="true" viewBox="0 0 24 24">
                      <path fill-rule="evenodd" d="M19 3h-1V1h-2v2H8V1H6v2H5a2 2 0 0 0-1.99 2L3 19a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2zm0 5v11H5V8h14zm-7 2H7v5h5v-5z" clip-rule="evenodd"></path>
                    </svg>
                  </div>
                  <div class="date-field">
                    <label for="end-id" class="field-label">Drop-off date</label>
                    <input id="end-id" name="endDate" type="text" class="field-input" placeholder="Select date" value="2024-06-03">
                    <button aria-label="Drop-off date June 3, 2024" id="end-id-btn" type="button" class="fake-input">Jun 3</button>
                    <svg class="field-icon" aria-hidden="true" viewBox="0 0 24 24">
                      <path fill-rule="evenodd" d="M19 3h-1V1h-2v2H8V1H6v2H5a2 2 0 0 0-1.99 2L3 19a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2zm0 5v11H5V8h14zm-7 2H7v5h5v-5z" clip-rule="evenodd"></path>
                    </svg>
                  </div>
                </div>
              </div>
            </form>
          </div>
    </body>
</html>
