

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title text-center">Welcome Back!</h3>
                            <form action="login" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="usuario" placeholder="Usuario" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="clave" placeholder="Password" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
            <a href="register.jsp">Registrate Aqui</a>
        </div>
    </body>
</html>


