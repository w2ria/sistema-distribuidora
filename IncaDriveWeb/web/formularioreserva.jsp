<%-- 
    Document   : formularioreserva
    Created on : 23/05/2024, 12:33:36 AM
    Author     : piero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <h2>Realizar Reserva</h2>
    <form action="ReservaServlet" method="post">
        <input type="hidden" name="accion" value="realizarReserva">

        <label for="idCliente">ID Cliente:</label>
        <input type="text" id="idCliente" name="idCliente" required><br>

        <label for="idEmpleado">ID Empleado:</label>
        <input type="text" id="idEmpleado" name="idEmpleado" required><br>

        <label for="idPago">ID Pago:</label>
        <input type="text" id="idPago" name="idPago" required><br>

        <label for="tipoComprobante">Tipo Comprobante:</label>
        <input type="text" id="tipoComprobante" name="tipoComprobante" required><br>

        <label for="numComprobante">Número Comprobante:</label>
        <input type="text" id="numComprobante" name="numComprobante" required><br>

        <label for="ubicacion">Ubicación:</label>
        <input type="text" id="ubicacion" name="ubicacion" required><br>

        <label for="fecha_inicio">Fecha Inicio:</label>
        <input type="date" id="fecha_inicio" name="fecha_inicio" required><br>

        <label for="fecha_fin">Fecha Fin:</label>
        <input type="date" id="fecha_fin" name="fecha_fin" required><br>

        <label for="hora_inicio">Hora Inicio:</label>
        <input type="time" id="hora_inicio" name="hora_inicio" required><br>

        <label for="hora_fin">Hora Fin:</label>
        <input type="time" id="hora_fin" name="hora_fin" required><br>

        <label for="total">Total:</label>
        <input type="text" id="total" name="total" required><br>

        <label for="idEstadoReserva">ID Estado Reserva:</label>
        <input type="text" id="idEstadoReserva" name="idEstadoReserva" required><br>

        <input type="submit" value="Realizar Reserva">
    </form>
</body>
    </body>
</html>
