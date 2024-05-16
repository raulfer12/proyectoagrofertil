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
              <input type="hidden" name="page" value="index">
              <button type="submit" class="btn primary my-4">Vover a Inicio</button>
            </div>
           </form>
        </div>
    </div>

</section>