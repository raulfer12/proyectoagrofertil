<div class="container py-5 mx-auto min-vh-100">
    <br><br><br>
    <div class="col-md-4 p-0 mb-4">
        <button class="btn primary" onclick="goBack()"><i class="fas fa-arrow-left mx-2"></i>Regresar</button>
    </div>

    <div class="header">
        <div class="row justify-content-center">
            <div class="col-md-9 mt-2 text-center">
                <h2 class="display-3">{{ProductoNombre}}</h2>
            </div>
        </div>
    </div>

    <div class="row">  
        <div class="col-lg-2 d-flex flex-column justify-content-center">
            {{foreach AllProducMedia}}
                <div class="my-4 border">
                    <a href="{{MediaPath}}">
                        <img class="rounded mx-auto d-block" src="{{MediaPath}}" width="60%">
                    </a>
                </div>
            {{endfor AllProducMedia}}
        </div>
        <div class="col-lg-10">
            <div class="row">
                <div class="col-md-6"> 
                    <img src="{{PrimaryMediaPath}}" alt="{{PrimaryMediaDoc}}" width="90%"> 
                </div>

                <div class="col-md-6">
                    <h3 class="mb-4">Lps.{{ProductoPrecioVenta}}</h3>
                    <h4 class="mb-4">Descripción</h4>
                    <p class="lead">
                        {{ProductoDescripcion}}
                    </p>
                    
                    <form method="POST" action="index.php?page=VisualizarProducto&ProductoId={{ProductoId}}">
                        <input type="hidden" name="ProductoPrecioVenta" value={{ProductoPrecioVenta}}>
                        <input type="hidden" name="ProductoStock" value={{ProductoStock}}>
                        <label class="font-weight-bold" for="ProdCantidad">Cantidad</label>
                        <br/>
                        <input class="form-control col-md-2" type="number" id="ProdCantidad" name="ProdCantidad" min="1" value="{{ProdCantidad}}">
                        <button class="btn btn-lg primary mt-4" type="submit" id="btnAgregarCarrito"><i class="fas fa-shopping-cart mx-2"></i>Agregar al carrito</button>
                    </form>

                    {{if Error}}
                        <p class="text-danger font-weight-bold my-4">{{Error}}</p>
                    {{endif Error}}

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function goBack() 
    {
        window.history.back();
    }
</script>