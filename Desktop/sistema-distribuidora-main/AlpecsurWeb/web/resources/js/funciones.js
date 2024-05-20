$(document).ready(function(){
   $("tr #btnDelete").click(function(){
       var idp=$(this).parent().find("#idp").val();
       swal({
         title: "¿Está seguro de que desea eliminar este producto?",
         icon: "warning",
         buttons: true,
         dangerMode: true,
       }).then((willDelete) => {
         if (willDelete) {
           eliminar(idp);
           swal("¡El producto se elimino del carrito!", {
             icon: "success",
           }).then((willDelete) => {
             if (willDelete) {
               parent.location.href="controlador?accion=Carrito";
             }
           });
         } else {
           swal("¡El producto no se ha eliminado!");
         }
       });
   }); // Aquí cierra la función $("tr #btnDelete").click(function()
   
   function eliminar(idp){
       var url="controlador?accion=Delete";
       $.ajax({
           type:'POST',
           url: url,
           data: "idp="+idp,
           success: function(data, textStatus, jqXHR){
               // Aquí puedes agregar acciones adicionales si las necesitas
           }
       });
   } 
   
   
   $("tr #Cantidad").click(function(){
      var idp = $(this).parent().find("#idpro").val();
      var cantidad = $(this).parent().find("#Cantidad").val();
      var url = "controlador?accion=ActualizarCantidad";
      $.ajax({
         type: 'POST',
         url: url,
         data: "idp=" + idp + "&Cantidad=" + cantidad,
         success: function (data, textStatus, jqXHR){
             location.href="controlador?accion=Carrito";
         }
      });
   });
   
}); 

