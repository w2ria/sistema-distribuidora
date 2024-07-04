
$(document).ready(function () {
    $('#searchInput').on('input', function () {
        var query = $(this).val();
        if (query.length > 0) {
            $.ajax({
                url: 'ControladorBusqueda',
                type: 'GET',
                data: { query: query },
                success: function (data) {
                    var results = $('#searchResults');
                    results.empty();
                    if (data.length > 0) {
                        data.forEach(function (producto) {
                            // Extraer las propiedades necesarias del producto
                            var imagenProducto = producto.imagen;
                            var nombreProducto = producto.nombre;
                            var precioProducto = producto.precio;
                            var idProducto = producto.idProducto;

                            if (imagenProducto) {
                                var imagePath = "resources/images/productos/" + imagenProducto;

                                var item = '<div class="search-result-item">'
                                        + '<img src="' + imagePath + '" alt="' + nombreProducto + '" onerror="this.onerror=null;this.src=\'https://via.placeholder.com/50\';">'
                                        + '<div class="product-info">'
                                        + '<h5 style="color: black;">' + nombreProducto + '</h5>'
                                        + '<p style="color: black;">Precio: $' + precioProducto.toFixed(2) + '</p>'
                                        + '<div class="input-group">'
                                        + '<button class="btn btn-outline-secondary decrement-btn" type="button">-</button>'
                                        + '<input type="number" class="form-control quantity-input" value="1" min="1">'
                                        + '<button class="btn btn-outline-secondary increment-btn" type="button">+</button>'
                                        + '</div>'
                                        + '<div class="button-group">'
                                        + '<button class="btn btn-outline-success add-to-cart-btn" data-id="' + idProducto + '" type="button">Agregar</button>'
                                        + '<a href="controlador?accion=productos&idProducto=' + idProducto + '" class="btn btn-outline-info" type="button">Ir Producto</a>'
                                        + '</div>'
                                        + '</div>'
                                        + '</div>';

                                results.append(item);
                            } else {
                                console.warn("El producto no tiene imagen:", producto);
                            }
                        });

                        // Event listeners para incrementar/decrementar cantidad y agregar al carrito
                        $('.increment-btn').on('click', function () {
                            var input = $(this).siblings('.quantity-input');
                            input.val(parseInt(input.val()) + 1);
                        });

                        $('.decrement-btn').on('click', function () {
                            var input = $(this).siblings('.quantity-input');
                            var currentValue = parseInt(input.val());
                            if (currentValue > 1) {
                                input.val(currentValue - 1);
                            }
                        });

                        $('.add-to-cart-btn').on('click', function () {
                            var idProducto = $(this).data('id');
                            var cantidad = $(this).closest('.product-info').find('.quantity-input').val();
                            window.location.href = 'controlador?accion=AgregarCarrito&idProducto=' + idProducto + '&cantidad=' + cantidad;
                        });
                    } else {
                        results.append('<p style="color: black; text-align: center; padding: 10px 0px 3px 0px;">No se encontraron productos.</p>');
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

