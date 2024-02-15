<section class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card my-5 w-100">
      <div class="card-header text-light" style="background-color: #40c224">
        <h3 class="text-center">{{mode_dsc}}</h3>
      </div>
      <div class="card-body"> 
        <form class="grid" method="post" action="index.php?page=admin_venta&mode={{mode}}&VentaId={{VentaId}}">

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="CategoriaId">Código</label>
            <input class="width-full center" type="hidden" class="form-control" id="VentaId" name="VentaId" value="{{VentaId}}"/>
            <input readonly type="text" class="width-full center disabled" class="form-control" name="VentaIdDummy" value="{{VentaId}}"/>
          </div>

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="VentaFecha">Fecha de la Venta</label>
            <input class="width-full center" type="text" class="form-control" readonly id="VentaFecha" name="VentaFecha" value="{{VentaFecha}}" maxlength="80">
          </div>

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="VentaISV">Impuesto sobre la Venta</label>
            <input class="width-full center" type="text" class="form-control" readonly id="VentaISV" name="VentaISV" value="{{VentaISV}}" maxlength="80">
          </div>

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="VentaEst">Estado de la Venta</label>
            <input class="width-full center" type="text" class="form-control" readonly id="VentaEst" name="VentaEst" value="{{VentaEst}}" maxlength="80">
          </div>

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="UsuarioNombre">Nombre del Cliente</label>
            <input class="width-full center" type="text" class="form-control" readonly id="UsuarioNombre" name="UsuarioNombre" value="{{UsuarioNombre}}" maxlength="80">
          </div>

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="ClienteDireccion">Dirección del Cliente</label>
            <textarea class="width-full center" type="text" class="form-control" readonly id="ClienteDireccion" name="ClienteDireccion" maxlength="300">{{ClienteDireccion}}</textarea>
          </div>

          <div class="row">
            <label class="col-12 col-m-4 flex center" for="ClienteTelefono">Télefono del Cliente</label>
            <input class="width-full center" type="text" class="form-control" readonly id="ClienteTelefono" name="ClienteTelefono" value="{{ClienteTelefono}}" maxlength="80">
          </div>

          <br><br>
          <div class="table-responsive table-hover rounded">
            <table class="table">
              <thead class="thead text-light" style="background-color: #40c224">
                  <tr>
                  <th class="text-center align-middle">Código del Producto</th>
                  <th class="text-center align-middle">Nombre del Producto</th>
                  <th class="text-center align-middle">Descripcion del Producto</th>
                  <th class="text-center align-middle">Precio del Producto</th>
                  <th class="text-center align-middle">Cantidad de Producto</th>
                  </tr>
              </thead>
              <tbody>
                  {{foreach Products}}
                  <tr>
                      <td class="text-center align-middle">{{ProductoId}}</td>
                      <td class="text-center align-middle">{{ProductoNombre}}</td>
                      <td class="text-center align-middle">{{ProductoDescripcion}}</td>
                      <td class="text-center align-middle">{{ProductoPrecioVenta}}</td>
                      <td class="text-center align-middle">{{VentasProdCantidad}}</td>
                  </tr>
                  {{endfor Products}}
              </tbody>
            </table>
          </div>
          
          <div class="row">
            <label class="col-12 col-m-4 flex center"for="VentaCantidadTotal">Ganacia Bruta</label>
            <input class="width-full center" type="text" class="form-control" readonly id="VentaCantidadTotal" name="VentaCantidadTotal" value="{{VentaCantidadTotal}}" maxlength="80">
          </div>
          <br>
          <button type="button" class="btn btn-block btn-danger" id="btnCancelar" name="btnCancelar">Regresar</button>
        </form>
      </div>
    </div>
  </section>
  
  <script>
    document.addEventListener("DOMContentLoaded", function(){
        document.getElementById("btnCancelar").addEventListener("click", function(e){
          e.preventDefault();
          e.stopPropagation();
          window.location.assign("index.php?page=admin_ventas");
        });
    });
  </script>