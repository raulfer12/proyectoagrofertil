<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <section class="container min-vh-100">
</head>
<!--<br><br><br>
<h1 class="text-center">Orden registrada con exito</h1>
<br><br>
<form action="index.php?page=index" method="post">
<button type="submit" class="btn primary mt-2 ml-3" id="btnAceptar" name="btnAceptar">Regresar a Inicio</button>
</form>-->

 <div class="col-md-4 p-0 mt-5">
        <form action="index.php" method="GET">
            <input type="hidden" name="page" value="carrito">
            <button class="btn primary" onclick=""><i class="fas fa-arrow-left mx-2"></i>Regresar</button>
        </form>  
    </div>

    <div class="card mt-5 mb-1 w-100">
        <div class="card-header" style="background-color: #40c224">
            <h3 class="text-center text-light">Confirmación de Pedido</h3>
        </div>
       <div class="card-body"> 
                <!--<form method="GET" action="index.php">-->
                <!--<form>-->
                    <!--<div class="form-group">-->
                       <!-- <input type="hidden" name="page" value="index.php?page=index">-->
                       <!--<a href="mailto:agrofertilhn@gmail.com?subject=Pedido de Cliente&body=*Redactar Mensaje Porfavor*">
                       </a>
                        <button type="submit" class="btn primary mt-2 ml-3"  id="btnAceptar" class="fa fa-google"  name="btnAceptar">Realizar Pedido</button>
                    </div>-->
               <!-- </form>-->
           <!-- </form>-->
           <h3><a href="mailto:agrofertilhn@gmail.com?subject=Pedido de Cliente&body=Producto: {{ProductoNombre}}" >Realizar Pedido</a></h3>

            <form method="GET" action="index.php">
            <div class="form-group">
              <input type="hidden" name="page" value="correo">
              <button type="submit" class="btn primary my-4">Enviar Correo</button>
            </div>
           </form>

           <button type="submit" id="EnviarCorreo"class="btn primary my-4">Otra Opcion Para Enviar Correo</button>

            <script>
                 document.getElementById("EnviarCorreo").addEventListener("click", function() {
                // Datos para enviar el correo
                const correo = "agrofertilhn@gmail.com";
                const nombre = "Agrofertil";
                const asunto = "Pedido de Cliente";
                const mensaje = "Producto:{{NombreProducto}}";

                // Crear un objeto FormData para enviar los datos
                const formData = new FormData();
                formData.append("correo", correo);
                formData.append("nombre", nombre);
                formData.append("asunto", asunto);
                formData.append("mensaje", mensaje);

                // Enviar la solicitud AJAX
                fetch("EnviarCorreo.php", {
                    method: "POST",
                    body: formData
                })
                .then(response => response.text())
                .then(result => {
                    alert(result); // Mostrar el resultado del envío del correo
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            });
        </script>

           <form method="GET" action="index.php">
            <div class="form-group">
              <input type="hidden" name="page" value="index">
              <button type="submit" class="btn primary my-4">Vover a Inicio</button>
            </div>
           </form>
        </div>
    </div>

</section>