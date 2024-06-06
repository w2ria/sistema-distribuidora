<%-- 
    Document   : MenuAdministrador
    Created on : 17 may. 2024, 16:18:05
    Author     : maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.ControladorProveedor"%>
<%@page import="Controlador.ControladorProducto"%>
<!DOCTYPE html>
<html lang="en<link rel="stylesheet" href="resource/css/styleDashboard.css">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/styleAdministrador.css">
        <title>Menú Administrador</title>
    </head>

    <body>

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
                    <a href="#">
                        <span class="material-icons-sharp">
                            receipt_long
                        </span>
                        <h3>Pedidos</h3>
                    </a>
                    <a href="#">
                        <span class="material-icons-sharp">
                            category
                        </span>
                        <h3>Categorias</h3>
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
                <h1>Dashboard</h1>
                <!-- Analyses -->
                <div class="analyse">
                    <div class="sales">
                        <div class="status">
                            <div class="info">
                                <h3>Total Ventas</h3>
                                <h1>S/20,024</h1>
                            </div>
                            <div class="progresss">
                                <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p>+81%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="visits">
                        <div class="status">
                            <div class="info">
                                <h3>Total Ingresos</h3>
                                <h1>24,981</h1>
                            </div>
                            <div class="progresss">
                                <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p>-48%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="searches">
                        <div class="status">
                            <div class="info">
                                <h3>Clientes Registrados</h3>
                                <h1>14,147</h1>
                            </div>
                            <div class="progresss">
                                <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p>+21%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Analyses -->

                <!-- New Users Section -->
                <div class="new-users">
                    <h2>Productos Más Vendidos</h2>
                    <div class="user-list">
                        <div class="user">
                            <img src="images/profile-2.jpg">
                            <h2>Jack</h2>
                            <p>54 Min Ago</p>
                        </div>
                        <div class="user">
                            <img src="images/profile-3.jpg">
                            <h2>Amir</h2>
                            <p>3 Hours Ago</p>
                        </div>
                        <div class="user">
                            <img src="images/profile-4.jpg">
                            <h2>Ember</h2>
                            <p>6 Hours Ago</p>
                        </div>
                        <div class="user">
                            <img src="images/plus.png">
                            <h2>More</h2>
                            <p>New User</p>
                        </div>
                    </div>
                </div>
                <!-- End of New Users Section -->

                <!-- Recent Orders Table -->
                <div class="recent-orders">
                    <h2>Pedidos Recientes</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>I'd Number</th>
                                <th>Payment</th>
                                <th>Status</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <a href="#">Show All</a>
                </div>
                <!-- End of Recent Orders -->

            </main>
            <!-- End of Main Content -->

            <!-- Right Section -->
            <div class="right-section">
                <div class="nav">
                    <button id="menu-btn">
                        <span class="material-icons-sharp">
                            menu
                        </span>
                    </button>
                    <div class="dark-mode">
                        <span class="material-icons-sharp active">
                            light_mode
                        </span>
                        <span class="material-icons-sharp">
                            dark_mode
                        </span>
                    </div>

                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b>Aditya</b></p>
                            <small class="text-muted">Admin</small>
                        </div>
                        <div class="profile-photo">
                            <img src="images/1.JPG">
                        </div>
                    </div>

                </div>
                <!-- End of Nav -->

                <div class="user-profile">
                    <div class="logo">
                        <img src="images/zz.jpeg">
                        <h2>Aditya Kasaudhan</h2>
                        <p>Fullstack Java Developer</p>
                    </div>
                </div>

                <div class="reminders">
                    <div class="header">
                        <h2>Reminders</h2>
                        <span class="material-icons-sharp">
                            notifications_none
                        </span>
                    </div>

                    <div class="notification">
                        <div class="icon">
                            <span class="material-icons-sharp">
                                volume_up
                            </span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>Timing</h3>
                                <small class="text_muted">
                                    08:00 AM - 12:00 PM
                                </small>
                            </div>
                            <span class="material-icons-sharp">
                                more_vert
                            </span>
                        </div>
                    </div>

                    <div class="notification deactive">
                        <div class="icon">
                            <span class="material-icons-sharp">
                                edit
                            </span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>Timing</h3>
                                <small class="text_muted">
                                    08:00 AM - 12:00 PM
                                </small>
                            </div>
                            <span class="material-icons-sharp">
                                more_vert
                            </span>
                        </div>
                    </div>

                    <div class="notification add-reminder">
                        <div>
                            <span class="material-icons-sharp">
                                add
                            </span>
                            <h3>Add Reminder</h3>
                        </div>
                    </div>

                </div>

            </div>


        </div>

        <script src="resources/js/orders.js"></script>
        <script src="resources/js/index.js"></script>
    </body>


</html>