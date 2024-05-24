<%-- 
    Document   : vistacarros
    Created on : 23/05/2024, 12:21:20 AM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tienda Mayorista | AlpecSur Online</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/index.css"/>
    </head>
    <body>
        <div class="container-vistacarrito">
        <h2>Buscar Autos para Reservar</h2>
        <form action="buscarAutos" method="post">
            <div class="form-group">
                <label for="ubicacion">Ubicación:</label>
                <input type="text" id="ubicacion" name="ubicacion" required>
            </div>
            <div class="form-group">
                <label for="fechaInicio">Fecha Inicio:</label>
                <input type="date" id="fechaInicio" name="fechaInicio" required>
            </div>
            <div class="form-group">
                <label for="fechaFin">Fecha Fin:</label>
                <input type="date" id="fechaFin" name="fechaFin" required>
            </div>
            <div class="form-group">
                <label for="horaInicio">Hora Inicio:</label>
                <select id="horaInicio" name="horaInicio" required>
                    <option value="">Seleccione una hora</option>
                    <option value="08:00">08:00</option>
                    <option value="09:00">09:00</option>
                    <option value="10:00">10:00</option>
                    <option value="11:00">11:00</option>
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="15:00">15:00</option>
                    <option value="16:00">16:00</option>
                    <option value="17:00">17:00</option>
                    <option value="18:00">18:00</option>
                </select>
            </div>
            <div class="form-group">
                <label for="horaFin">Hora Fin:</label>
                <select id="horaFin" name="horaFin" required>
                    <option value="">Seleccione una hora</option>
                    <option value="08:00">08:00</option>
                    <option value="09:00">09:00</option>
                    <option value="10:00">10:00</option>
                    <option value="11:00">11:00</option>
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="15:00">15:00</option>
                    <option value="16:00">16:00</option>
                    <option value="17:00">17:00</option>
                    <option value="18:00">18:00</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Buscar Autos">
            </div>
        </form>
    </div>
    </body>
</html>
