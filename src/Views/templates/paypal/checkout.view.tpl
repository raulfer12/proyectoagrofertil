<script>
        function correo() {
            mailto:agrofertilhn@gmail.com?subject=Pedido de Cliente&body=*Redactar Mensaje Porfavor*;
        }

        function regresar_inicio() {
            index.php?page=index;
        }

        function ejecutar_funciones() {
            correo();
            regresar_inicio();
            // Agrega aquí más funciones si es necesario
        }
    </script>

<section class="container min-vh-100">

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
             
                <form>
                    <button type="submit" class="btn primary mt-2 ml-3" id="btnAceptar" class="fa fa-google" onclick="ejecutar_funciones" name="btnAceptar">Realizar Pedido</button>
                </form>
            </form>
        </div>
    </div>

</section>