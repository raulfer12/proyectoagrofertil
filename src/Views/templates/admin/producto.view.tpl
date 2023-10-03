<section class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card my-5 w-100">
        <div class="card-header text-light" style="background-color: #0a7506">
            <h3 class="text-center">{{mode_dsc}}</h3>
        </div>
        <div class="card-body"> 
            <form class="grid" method="post" action="index.php?page=admin_producto&mode={{mode}}&ProductoId={{ProductoId}}" enctype="multipart/form-data">
                {{if notDisplayIns}}
                <div class="row">
                    <label class="col-12 col-m-4 flex center" for="ProductoId">Código</label>
                    <input class="width-full center" type="hidden" class="form-control" id="ProductoId" name="ProductoId" value="{{ProductoId}}"/>
                    <input readonly type="text" class="width-full center disabled" class="form-control" name="CategoriaIdDummy" value="{{ProductoId}}"/>
                </div>
                {{endif notDisplayIns}}
    
            <div class="row">
                <label class="col-12 col-m-4 flex center" for="ProductoNombre">Producto</label>
                <input class="width-full center" type="text" class="form-control" {{readonly}} id="ProductoNombre" name="ProductoNombre" value="{{ProductoNombre}}" maxlength="60" placeholder="Ingrese el nombre del producto" required>
            </div>
    
            <div class="row">
                <label class="col-12 col-m-4 flex center" for="ProductoDescripcion">Descripción</label>
                <textarea type="text" class="form-control" {{readonly}} id="ProductoDescripcion" name="ProductoDescripcion" maxlength="1000" placeholder="Ingrese la Descripción del producto">{{ProductoDescripcion}}</textarea>
            </div>
        
            <div class="row ml-0 d-flex justify-content-center px-3 py-3">
                <div class="form-group col-sm-4">
                    <label class="col-12 col-m-4 flex center" for="ProductoPrecioVenta">Precio de Venta</label>
                    <input class="width-full center" type="number" class="form-control" {{readonly}} id="ProductoPrecioVenta" name="ProductoPrecioVenta" value="{{ProductoPrecioVenta}}" maxlength="11" placeholder="0" required>
                </div>
    
                <div class="form-group col-sm-4">
                    <label class="col-12 col-m-4 flex center" for="ProductoPrecioCompra">Precio de Compra</label>
                    <input class="width-full center" type="number" class="form-control" {{readonly}} id="ProductoPrecioCompra" name="ProductoPrecioCompra" value="{{ProductoPrecioCompra}}" maxlength="11" placeholder="0" required>
                </div>
            </div>
    
            <div class="row ml-0 d-flex justify-content-center px-3 py-3">
                <div class="form-group col-sm-4">
                    <label class="col-12 col-m-4 flex center" for="ProductoEst">Estado</label>
                    <br/>
                    <select class="form-control" id="ProductoEst" name="ProductoEst" {{if readonly}}disabled{{endif readonly}}>
                        <option value="ACT" {{ProductoEst_ACT}}>Activo</option>
                        <option value="INA" {{ProductoEst_INA}}>Inactivo</option>
                    </select>
                </div>
    
                <div class="form-group col-sm-4">
                    <label class="col-12 col-m-4 flex center" for="ProductoStock">Stock</label>
                    <input class="width-full center" type="number" class="form-control" {{readonly}} id="ProductoStock" name="ProductoStock" value="{{ProductoStock}}" maxlength="11" placeholder="Ingrese la cantidad del producto" required>
                </div>
            </div>
    
            <div class="form-group col">
                <label class="col-12 col-m-4 flex center" class="row ml-0">Imagen</label>
                <div class="row">
                    {{foreach Media}}
                    <div class="col-sm-6 col-md-4">
                        <img src="{{MediaPath}}" alt="" width="150px">
                        <input class="width-full center" type="hidden" class="form-control" id="MediaDoc" name="MediaDoc" value="{{MediaDoc}}"/>
                        <input class="width-full center" type="hidden" class="form-control" id="MediaId" name="MediaId" value="{{MediaId}}"/>
                    </div>
                    {{endfor Media}}
                </div>
                {{if notDisplayDel}}
                <input class="width-full center" type="file" class="mt-2" id="imagenes[]" name="imagenes[]" multiple>
                {{endif notDisplayDel}}
            </div>
            {{if hasErrors}}
            <section>
            <ul>
                {{foreach aErrors}}
                    <li>{{this}}</li>
                {{endfor aErrors}}
            </ul>
            </section>
            {{endif hasErrors}}
    
            <div class="row center flex-end px-3 py-3">
                {{if showaction}}
                    <button type="submit" class="btn btn-block primary" id="btnGuardar" name="btnGuardar">Guardar</button>
                {{endif showaction}}
                <button type="button" class="btn btn-block btn-danger" id="btnCancelar" name="btnCancelar">Cancelar</button>
            </div>
            </form>
        </div>
    </div>
    </section>
    
    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.getElementById("btnCancelar").addEventListener("click", function(e){
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=admin_productos");
            });
        });
    </script>