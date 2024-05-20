

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card p-4 shadow-lg" style="width: 100%; max-width: 400px;">
                <h3 class="text-center mb-3">Welcome Back!</h3>
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Invalid username or password. Please try again.
                </div>
                <% } %>
                <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success" role="alert">
                    Registration successful! Please login.
                </div>
                <% }%>
                <form action="login" method="post">
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="usuario" placeholder="Usuario" required>
                    </div>
                    <div class="form-group mb-3">
                        <input type="password" class="form-control" name="clave" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block mb-3">Sign In</button>
                    <div class="text-center">
                        <a href="register.jsp">Don't have an account? Register here</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>



