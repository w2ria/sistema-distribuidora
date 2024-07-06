document.addEventListener('DOMContentLoaded', function () {
    var userDataElement = document.getElementById('userData');
    var tipoUsuario = userDataElement.getAttribute('data-tipo-usuario');
    var nombreUsuario = userDataElement.getAttribute('data-nombre-usuario');
    var filasVisibles = []; // Array para almacenar las filas visibles

    filtrarPedidos(tipoUsuario, nombreUsuario);

    function filtrarPedidos(tipoUsuario, nombreEmpleado) {
        console.log("Tipo de Usuario:", tipoUsuario);
        console.log("Nombre de Empleado/Admin:", nombreEmpleado);

        // Obtener todas las filas de la tabla de pedidos
        var filas = document.querySelectorAll('#tablaPedidos tbody tr');
        filas.forEach(function (fila) {
            var empleadoCell = fila.querySelector('td[data-id]:nth-child(4)'); // Seleccionar la celda del empleado específicamente
            var nombreEmpleadoFila = empleadoCell ? empleadoCell.textContent.trim() : "";

            if (tipoUsuario === 'admin' || (tipoUsuario === 'empleado' && nombreEmpleado === nombreEmpleadoFila)) {
                fila.style.display = ''; // Mostrar la fila si cumple con el filtro
                filasVisibles.push(fila); // Agregar fila al array de filas visibles
            } else {
                fila.style.display = 'none'; // Ocultar la fila si no cumple con el filtro
            }
        });
    }

    function filtrarPorCliente(valorBuscado) {
        filasVisibles.forEach(function (fila) {
            const textoCliente = fila.querySelector('td:nth-child(2)').textContent.toLowerCase();

            // Comprobar si el texto del cliente incluye el valor buscado
            if (textoCliente.includes(valorBuscado)) {
                fila.style.display = ''; // Mostrar la fila si cumple con el filtro del cliente
            } else {
                fila.style.display = 'none'; // Ocultar la fila si no cumple con el filtro del cliente
            }
        });
    }

    document.getElementById('busquedaForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const valorBuscado = document.getElementById('buscador').value.toLowerCase();
        filtrarPorCliente(valorBuscado);
    });
});
