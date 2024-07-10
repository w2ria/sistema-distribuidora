<%-- 
    Document   : MenuAdministrador
    Created on : 17 may. 2024, 16:18:05
    Author     : maria
--%>

<%@page import="Modelo.Administrador"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Controlador.ControladorProveedor"%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>


<%
    Usuario us = (Usuario) session.getAttribute("usuario");
    Administrador ad = (Administrador) session.getAttribute("admin");
    Boolean justLoggedIn = (Boolean) session.getAttribute("justLoggedIn");

    if (us == null || ad == null) {
        response.sendRedirect("login.jsp"); // Redirigir a la página de login si los atributos son null
        return;
    }

    // Simula una llamada al servlet ContadorVisitas
    RequestDispatcher dispatcher = request.getRequestDispatcher("/ContadorVisitas");
    dispatcher.include(request, response);
    if (justLoggedIn != null && justLoggedIn) {
        session.removeAttribute("justLoggedIn");
    }
%>
<!DOCTYPE html>
<html lang="en<link rel=" stylesheet " href="resource/css/styleDashboard.css ">
    <head>
        <meta charset="UTF-8 ">
        <meta name="viewport " content="width=device-width, initial-scale=1.0 ">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp " rel="stylesheet ">
        <link rel="stylesheet " href="resources/css/styleAdministrador.css ">
        <title>Menú Administrador</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js "></script>
        <link href="resources/css/preloader.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

            <%-- Mostrar el preloader solo si justLoggedIn es true --%>
            <% if (justLoggedIn != null && justLoggedIn) { %>
            <%@ include file="preloader.jsp" %>
            <% }%>
        <div class="container">
            <!-- Sidebar Section -->
            <aside>
                <div class="toggle">
                    <div class="logo">
                        <img src="resources/images/logo_alpecsur.jpeg" style="height:60px; width:165px; margin-left:1px; border-radius:10px">
                    </div>
                    <div class="close" id="close-btn">
                        <span class="material-icons-sharp">
                            close
                        </span>
                    </div>
                </div>

                <div class="sidebar">
                    <a href="#" class="active">
                        <span class="material-icons-sharp">
                            dashboard
                        </span>
                        <h3>Dashboard</h3>
                    </a>
                    <a href="ControladorAdministrador?Op=Listar">
                        <span class="material-icons-sharp">
                            supervisor_account
                        </span>
                        <h3>Admins</h3>
                    </a>
                    <a href="ControladorEmpleado?Op=Listar">
                        <span class="material-icons-sharp">
                            engineering
                        </span>
                        <h3>Empleados</h3>
                    </a>
                    <a href="ControladorProveedor?Op=Listar">
                        <span class="material-icons-sharp">
                            local_shipping
                        </span>
                        <h3>Proveedores</h3>
                    </a>

                    <a href="ControladorProducto?Op=Listar">
                        <span class="material-icons-sharp">
                            inventory_2
                        </span>
                        <h3>Productos</h3>
                    </a>
                    <a href="ControladorIngreso?Op=Listar">
                        <span class="material-icons-sharp">
                            move_to_inbox
                        </span>
                        <h3>Ingresos</h3>
                    </a>
                    <a href="ControladorPedido?Op=Listar">
                        <span class="material-icons-sharp">
                            receipt_long
                        </span>
                        <h3>Pedidos</h3>
                    </a>
                    <a href="ControladorCategoria?Op=Listar">
                        <span class="material-icons-sharp">
                            category
                        </span>
                        <h3>Categorias</h3>
                    </a>
                    <a href="ControladorMarca?Op=Listar">
                        <span class="material-icons-sharp">
                            sell
                        </span>
                        <h3>Marcas</h3>
                    </a>
                    <a href="logout.jsp">
                        <span class="material-icons-sharp">
                            logout
                        </span>
                        <h3>Logout</h3>
                    </a>
                </div>
            </aside>
            <!-- End of Sidebar Section -->

            <!-- Main Content -->
            <main>
                <h2>Dashboard || Visitas a la web: <%= application.getAttribute("contadorVisitas")%></h2>
                <!-- Analyses -->
                <div class="analyse">
                    <div class="sales">
                        <div class="status">
                            <div class="info">
                                <h3>Total Ventas</h3>
                                <h1 id="total-ventas">0</h1>
                            </div>
                            <div class="progresss">
                                <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p id="porcentaje-ventas">+0%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="visits">
                        <div class="status">
                            <div class="info">
                                <h3>Total Ingresos</h3>
                                <h1 id="total-ingresos">0</h1>
                            </div>
                            <div class="progresss">
                                <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p id="porcentaje-ingresos">-0%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="searches">
                        <div class="status">
                            <div class="info">
                                <h3>Clientes Registrados</h3>
                                <h1 id="clientes-registrados">0</h1>
                            </div>
                            <div class="progresss">
                                <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p id="porcentaje-clientes">+0%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Analyses -->

                <!-- New Users Section -->
                <div class="new-users">
                    <div class="chart-container">
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
                <!-- End of New Users Section -->
                <!--
                
                <div class="recent-orders">
                    <h2>Pedidos Recientes</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Cliente</th>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Estado</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>16-04-2024</td>
                                <td>Juan Pérez</td>
                                <td>Macbook Pro</td>
                                <td>S/3000</td>
                                <td class="warning">Pendiente</td>
                                <td class="primary">Detalles</td>
                            </tr>
                            <tr>
                                <td>17-04-2024</td>
                                <td>Maria López</td>
                                <td>iPhone 14</td>
                                <td>S/4000</td>
                                <td class="success">Completado</td>
                                <td class="primary">Detalles</td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                -->
                <!-- End of Recent Orders Table -->
            </main>
            <!-- End of Main Content -->

            <!-- Right Section -->
            <div class="right-section">
                <div class="nav">
                    <button id="menu-btn">
                        <span class="material-icons-sharp">menu</span>
                    </button>
                    <div class="dark-mode">
                        <span class="material-icons-sharp active">light_mode</span>
                        <span class="material-icons-sharp">dark_mode</span>
                    </div>
                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b><%= ad != null ? ad.getNombre() : "Invitado"%></b></p>
                            <small class="text-muted">Admin</small>
                        </div>
                        <div class="profile-photo">

                        </div>
                    </div>
                </div>
                <div class="user-profile">
                    <div class="logo">

                        <h2><%= ad != null ? ad.getNombre() : "Invitado"%></h2>
                        <p>Fullstack Java Developer</p>
                    </div>
                </div>
                <div class="reminders">
                    <div class="header">
                        <h2>Reminders</h2>
                        <span class="material-icons-sharp">notifications_none</span>
                    </div>
                    <div class="notification">
                        <div class="icon">
                            <span class="material-icons-sharp">mail_outline</span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>Check Mails</h3>
                                <small class="text-muted">17/07/2023</small>
                            </div>
                        </div>
                    </div>
                    <div class="notification">
                        <div class="icon">
                            <span class="material-icons-sharp">inventory</span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>Check Product Stocks</h3>
                                <small class="text-muted">17/07/2023</small>
                            </div>
                        </div>
                    </div>
                    <div class="notification">
                        <div class="icon">
                            <span class="material-icons-sharp">task</span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>New Updates</h3>
                                <small class="text-muted">17/07/2023</small>
                            </div>
                        </div>
                    </div>
                    <div class="notification">
                        <div class="icon">
                            <span class="material-icons-sharp">priority_high</span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>System Maintenance</h3>
                                <small class="text-muted">17/07/2023</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Right Section -->
        </div>
        <script src="resources/js/orders.js "></script>
        <script src="resources/js/index.js "></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.3/gsap.min.js"
                integrity="sha512-gmwBmiTVER57N3jYS3LinA9eb8aHrJua5iQD7yqYCKa5x6Jjc7VDVaEA0je0Lu0bP9j7tEjV3+1qUm6loO99Kw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="resources/js/preloader.js" type="text/javascript"></script>
        <script>
            const ctx = document.getElementById('lineChart').getContext('2d');

            const lineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [], // Estas etiquetas serán actualizadas con los datos reales
                    datasets: [{
                            label: 'Ventas Totales',
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            data: [], // Estos datos serán actualizados con los datos reales
                            fill: true,
                        }, {
                            label: 'Ingresos Totales',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            data: [], // Estos datos serán actualizados con los datos reales
                            fill: true,
                        }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            beginAtZero: true
                        },
                        y: {
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    let label = context.dataset.label || '';
                                    if (label) {
                                        label += ': ';
                                    }
                                    label += context.raw;
                                    return label;
                                }
                            }
                        }
                    }
                }
            });

            function actualizarDashboard() {
                fetch('DashboardData')
                        .then(response => response.json())
                        .then(data => {
                            // Actualizamos los datos totales
                            document.getElementById('total-ventas').textContent = data.totalVentas;
                            document.getElementById('total-ingresos').textContent = data.totalIngresos;
                            document.getElementById('clientes-registrados').textContent = data.clientesRegistrados;
                            document.getElementById('porcentaje-ventas').textContent = data.porcentajeVentas + '%';
                            document.getElementById('porcentaje-ingresos').textContent = data.porcentajeIngresos + '%';
                            document.getElementById('porcentaje-clientes').textContent = data.porcentajeClientes + '%';

                            // Actualizamos los datos para el gráfico
                            const etiquetas = data.ventasEIngresosDiarios.map(entry => entry.fecha);
                            const ventas = data.ventasEIngresosDiarios.map(entry => entry.ventas);
                            const ingresos = data.ventasEIngresosDiarios.map(entry => entry.ingresos);

                            lineChart.data.labels = etiquetas;
                            lineChart.data.datasets[0].data = ventas;
                            lineChart.data.datasets[1].data = ingresos;

                            lineChart.update();
                        })
                        .catch(error => console.error('Error al actualizar el dashboard:', error));
            }

            // Actualizar el dashboard cada 5 segundos
            setInterval(actualizarDashboard, 5000);

            // Actualizar el dashboard al cargar la página
            window.onload = actualizarDashboard;
        </script>

    </body>
</html>