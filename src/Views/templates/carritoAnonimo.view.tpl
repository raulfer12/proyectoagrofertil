<section class="container min-vh-100">
    <h3 class="my-4 text-center display-4 mb-2">Detalle de la Orden</h3>
    <table class="table table-bordered table-hover">
        <thead class="thead text-light" style="background-color: #40c224">
            <tr>
                <th class="text-center align-middle">Descripción</th>
                <th class="text-center align-middle">Cantidad</th>
                <!--<th class="text-center align-middle">Precio Unitario</th>-->
                <!--<th class="text-center align-middle">Impuesto Calculado</th>-->
                <!--<th class="text-center align-middle">Precio Unitario con Impuesto</th>-->
                <!--<th class="text-center align-middle">Total por Producto</th>-->
                <th width="15%" class="text-center align-middle">Imagen</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            {{foreach Items}}
            <tr>
                <td class="align-middle">{{ProductoNombre}}</td>
                <td class="text-center align-middle">{{ProdCantidad}}</td>
                <!--<td class="text-center align-middle">{{ProductoPrecioVenta}}</td>-->
                <!--<td class="text-center align-middle">{{ProdImpuesto}}</td>-->
                <!--<td class="text-center align-middle">{{ProductoPrecioVenta}}</td>-->
                <!--<td class="text-center align-middle">{{TotalProducto}}</td>-->
                <td width="15%" class="text-center align-middle">
                    <div class="border">
                        <img class="rounded mx-auto d-block" src="{{MediaPath}}" alt="{{MediaDoc}}" width="60%">
                    </div>
                </td>

                <td>
                    <form method="POST" action="index.php?page=carrito">
                        <input type="hidden" id="ProductoId" name="ProductoId" value="{{ProductoId}}">
                        <input type="hidden" id="ProdCantidad" name="ProdCantidad" value="{{ProdCantidad}}">
                        <button class="btn btn-danger" name="btnEliminar" id="btnEliminar" type="submit">Eliminar</button>
                    </form>
                </td>
            </tr>
            {{endfor Items}}
        </tbody>
    </table>

    <!--<form class="d-flex flex-column align-items-center">
        <div class="form-group col-md-2 center">
            <label for="CarritoSubtotal" class="font-weight-bold">Subtotal</label>
            <input type="text" readonly class="form-control" id="CarritoSubtotal" value="{{Subtotal}}">
        </div>
        
        <div class="form-group col-md-2 center">
            <label for="CarritoTotal" class="font-weight-bold">Total</label>
            <input type="text" readonly class="form-control" id="CarritoTotal" value="{{Total}}">
        </div>
    </form>-->

    {{if Items}}
    <form method="GET" action="index.php">
        <div class="form-group">
            <input type="hidden" name="page" value="checkout_checkout">
            <button type="submit" class="btn primary my-4">Recoger orden en establecimiento</button>
        </div>
    </form>
    {{endif Items}}
    {{if Items}}
    <form method="GET" action="index.php">
        <div class="form-group">
            <input type="hidden" name="page" value="direccionentrega">
            <button type="submit" class="btn primary my-4">Realizar orden a domicilio</button>
        </div>
    </form>
    {{endif Items}}

</section>