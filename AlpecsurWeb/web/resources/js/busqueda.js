
$(document).ready(function () {
    $('#searchInput').on('input', function () {
        var query = $(this).val();
        if (query.length > 0) {
            $.ajax({
                url: 'ControladorBusqueda',
                type: 'GET',
                data: {query: query},
                success: function (data) {
                    var results = $('#searchResults');
                    results.empty();
                    if (data.length > 0) {
                        data.forEach(function (producto) {
                            // Extraer la propiedad 'imagen' y asegurarse de que existe
                            var imagenProducto = producto.imagen;
                            // Extraer el nombre y precio del producto
                            var nombreProducto = producto.nombre;
                            var precioProducto = producto.precio;
                            if (imagenProducto) {
                                var imagePath = "resources/images/productos/" + imagenProducto;
                                console.log("Ruta de la imagen:", imagePath); // Imprimir ruta de la imagen

                                var item = '<div class="search-result-item">'
                                        + '<img src="' + imagePath + '" alt="' + nombreProducto + '" onerror="this.onerror=null;this.src=\'https://via.placeholder.com/50\';">'
                                        + '<div>'
                                        + '+ <h5 style="color:#000">' + nombreProducto + '</h5>'
                                        + '<p style="color:#000">Precio: $' + precioProducto.toFixed(2) + '</p>'
                                        + '</div>'
                                        + '</div>';

                                results.append(item);
                            } else {
                                console.warn("El producto no tiene imagen:", producto);
                            }
                        });
                    } else {
                        results.append('<p>No se encontraron productos.</p>');
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", status, error);
                }
            });
        } else {
            $('#searchResults').empty();
        }
    });

    $(document).on('click', function (e) {
        if (!$(e.target).closest('#searchResults').length && !$(e.target).closest('#searchInput').length) {
            $('#searchResults').empty();
        }
    });
});


