<section class="container-fluid min-vh-100">

    <h3 class="my-4 text-center display-4 mb-2">Gestión de Productos</h3>

    <div class="rounded">
        <form method="POST" action="index.php?page=admin_productos">
        <div class="form-row">
            <div class="col-10">
                <input type="search" class="form-control rounded" id="ProductBusqueda" name="ProductBusqueda" value="{{ProductBusqueda}}" placeholder="Ingrese su busqueda">
            </div>
            <div class="col-2">
                <button type="submit" class="fas fa-search mb-3 rounded" id="btnBuscar" name="btnBuscar"></button>
            </div>
        </div>
        </form> 
    </div>

    <div class="table-responsive table-hover rounded">
        <table class="table">
            <thead class="thead text-light" style="background-color: #40c224">
                <tr>
                <th class="text-center align-middle">Código</th>
                <th class="text-center align-middle">Producto</th>
                <th class="text-center align-middle">Descripción</th>
                <th class="text-center align-middle">Precio Venta</th>
                <th class="text-center align-middle">Precio Compra</th>
                <th class="text-center align-middle">Estado</th>
                <th class="text-center align-middle">Stock</th>
                <th class="text-center align-middle"><button type="button" class="btn primary my-2" id="btnAdd">Nuevo</button></th>
                </tr>
            </thead>
            <tbody>
                {{foreach items}}
                <tr>
                    <td class="text-center align-middle">{{ProductoId}}</td>
                    <td class="text-center align-middle"><a href="index.php?page=admin_producto&mode=DSP&ProductoId={{ProductoId}}" style="color: #40c224">{{ProductoNombre}}</a></td>
                    <td class="text-center align-middle">{{ProductoDescripcion}}</td>
                    <td class="text-center align-middle">{{ProductoPrecioVenta}}</td>
                    <td class="text-center align-middle">{{ProductoPrecioCompra}}</td>
                    <td class="text-center align-middle">{{ProductoEst}}</td>
                    <td class="text-center align-middle">{{ProductoStock}}</td>
                    <td class="text-center align-middle">
                    <form action="index.php" method="get">
                        <input type="hidden" name="page" value="admin_producto"/>
                        <input type="hidden" name="mode" value="UPD" />
                        <input type="hidden" name="ProductoId" value={{ProductoId}} />
                        <button type="submit" class="btn primary my-1">Editar</button>
                    </form>
                    <form action="index.php" method="get">
                        <input type="hidden" name="page" value="admin_producto"/>
                        <input type="hidden" name="mode" value="DEL" />
                        <input type="hidden" name="ProductoId" value={{ProductoId}} />
                        <button type="submit" class="btn btn-danger my-1">Eliminar</button>
                    </form>
                    </td>
                </tr>
                {{endfor items}}
            </tbody>
        </table>
    </div>
</section>
<script>
    document.addEventListener("DOMContentLoaded", function () 
    {
        document.getElementById("btnAdd").addEventListener("click", function (e){
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=admin_producto&mode=INS&ProductoId=0");
        });
    });
</script>