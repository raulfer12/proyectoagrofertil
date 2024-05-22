<section class="container-fluid min-vh-100">

    <h3 class="my-4 text-center display-4 mb-2">Gestión de Ventas</h3>

    <div class="rounded">
        <form method="POST" action="index.php?page=admin_ventas">
        <div class="form-row">
           <!-- <div class="col-10">
            <input type="search" class="form-control rounded" id="UsuarioBusqueda" name="UsuarioBusqueda" value="{{UsuarioBusqueda}}" placeholder="Ingrese su busqueda">
            </div>
            <div class="col-2">
            <button type="submit" class="fas fa-search mb-3 rounded" id="btnBuscar" name="btnBuscar"></button>
            </div>-->
        </div>
        </form> 
    </div>

    <div class="table-responsive table-hover rounded">
        <table class="table">
        <thead class="thead text-light" style="background-color: #40c224">
            <tr>
                <th class="text-center align-middle">Código</th>
                <th class="text-center align-middle">Fecha</th>
                <!--<th class="text-center align-middle">ISV</th>-->
                <th class="text-center align-middle">Estado</th>
                <th class="text-center align-middle">Cliente</th>
                <th class="text-center align-middle">Dirección</th>
                <th class="text-center align-middle">Producto</th>
                <th class="text-center align-middle">Cantidad</th>
                <th class="text-center align-middle">Teléfono</th>
                <th class="text-center align-middle">Total de Venta</th>
            <th class="text-center align-middle"></th>
            </tr>
        </thead>
        <tbody>
            {{foreach items}}
            <tr>
                <td class="text-center align-middle"><a href="index.php?page=admin_venta&mode=DSP&VentaId={{VentaId}}">{{VentaId}}</a></td>
                <td class="text-center align-middle">{{VentaFecha}}</td>
               <!-- <td class="text-center align-middle">{{VentaISV}}</td>-->
                <td class="text-center align-middle">{{VentaEst}}</td>
                <td class="text-center align-middle">{{UsuarioNombre}}</td>
                <td class="text-center align-middle">{{ClienteDireccion}}</td>
                <td class="text-center align-middle">{{NombreProducto}}</td>
                <td class="text-center align-middle">{{ProdCantidad}}</td>
                <td class="text-center align-middle">{{ClienteTelefono}}</td>
                <td class="text-center align-middle">{{VentaCantidadTotal}}</td>
                <td class="text-center align-middle">
                <form action="index.php" method="get">
                    <input type="hidden" name="page" value="admin_venta"/>
                    <input type="hidden" name="mode" value="UPD" />
                    <input type="hidden" name="VentaId" value={{VentaId}} />
                </form>
                </td>
            </tr>
            {{endfor items}}
        </tbody>
      </table>
    </div>
  </section>