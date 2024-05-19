<%-- 
    Document   : register
    Created on : 19 may. 2024, 1:24:43 a. m.
    Author     : ferna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card p-4 shadow-lg" style="width: 100%; max-width: 400px;">
                <h3 class="text-center mb-3">Create Account</h3>
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Error registering. Please try again.
                </div>
                <% }%>
                <form action="register" method="post">
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="usuario" placeholder="Usuario" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="password" class="form-control" name="clave" placeholder="Password" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="tipoDocumento" placeholder="Tipo de Documento" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="numDocumento" placeholder="Número de Documento" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="direccion" placeholder="Dirección" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="telefono" placeholder="Teléfono" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="email" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block mb-3">Sign Up</button>
                    <div class="text-center">
                        <a href="login.jsp">Already have an account? Login here</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

