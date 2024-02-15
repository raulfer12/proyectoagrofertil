<section class="container min-vh-100">

    <div class="col-md-4 p-0 mt-5">
        <form action="index.php" method="GET">
            <input type="hidden" name="page" value="carrito">
            <button class="btn primary" onclick=""><i class="fas fa-arrow-left mx-2"></i>Regresar</button>
        </form>  
    </div>

    <div class="card mt-5 mb-1 w-100">
        <div class="card-header" style="background-color: #40c224">
            <h3 class="text-center text-light">Datos para la Entrega del Producto</h3>
        </div>
        <div class="card-body"> 
            <form class="form" method="post" action="index.php?page=direccionentrega">

                <h6>Campos con * son de caracter obligatorio</h6>
                  <br/>

               <!-- <div class="form-group col-md-5">
                    <label for="DireccionDepartamento">Departamento *</label>
                    <input type="text" class="form-control" id="DireccionDepartamento" name="DireccionDepartamento" value="{{DireccionDepartamento}}" maxlength="30" placeholder="Departamento en el que reside">
                </div>-->

               <!-- <div class="form-group col-md-5">
                    <label for="DireccionCiudad">Ciudad *</label>
                    <br/>
                    <input type="text" class="form-control" id="DireccionCiudad" name="DireccionCiudad" value="{{DireccionCiudad}}" maxlength="30" placeholder="Ciudad en que reside">
                </div>-->

                <div class="form-group col-md-12">
                    <label for="Direccion1">Dirección 1 *</label>
                    <br/>
                    <input type="text" class="form-control" id="Direccion1" name="Direccion1" value="{{Direccion1}}" maxlength="50" placeholder="Información dirección en la que reside">
                </div>

                <div class="form-group col-md-12">
                    <label for="Direccion2">Dirección 2</label>
                    <br/>
                    <input type="text" class="form-control" id="Direccion2" name="Direccion2" value="{{Direccion2}}" maxlength="50" placeholder="Información adicional dirección en la que reside">
                </div>

                <div class="form-group col-md-5">
                    <label for="NumeroCelular">Número de Teléfono o Celular *</label>
                    <br/>
                    <input type="text" class="form-control" id="NumeroTelefonoCelular" name="NumeroTelefonoCelular" value="{{NumeroTelefonoCelular}}" maxlength="80" placeholder="Número de télefono o celular">
                </div>

                {{if hasErrors}}
                <section>
                    <ul>
                        {{foreach aErrors}}
                            <li class="text-danger my-2">{{this}}</li>
                        {{endfor aErrors}}
                    </ul>
                </section>
                {{endif hasErrors}}

                <button type="submit" class="btn primary mt-2 ml-3" id="btnAceptar" name="btnAceptar">Realizar Pedido</button>
            </form>
        </div>
    </div>
</section>