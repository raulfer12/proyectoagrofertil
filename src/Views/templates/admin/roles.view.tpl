<section class="container-fluid min-vh-100">

  <h2 class="my-4 text-center display-4 mb-2">Gestión de Roles Administrativos</h2>
  
  <div class="rounded">
    <form method="POST" action="index.php?page=admin_roles">
      <div class="form-row">
        <div class="col-10">
          <input type="search" class="form-control rounded" id="UsuarioBusqueda" name="UsuarioBusqueda" value="{{UsuarioBusqueda}}" placeholder="Ingrese su busqueda">
        </div>
        <div class="">
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
          <th class="text-center align-middle">Descripción</th>
          <th class="text-center align-middle">Estado</th>
          <th class="text-center align-middle"><button type="button" class="btn primary my-2" id="btnAdd">Nuevo</button></th>
        </tr>
      </thead>
      <tbody>
        {{foreach items}}
          <tr>
            <td class="text-center align-middle">{{RolId}}</td>
            <td class="text-center align-middle"><a href="index.php?page=admin_rol&mode=DSP&RolId={{RolId}}">{{RolDsc}}</a></td>
            <td class="text-center align-middle">{{RolEst}}</td>
            <td class="text-center align-middle">
              <form action="index.php" method="get">
                  <input type="hidden" name="page" value="admin_rol"/>
                  <input type="hidden" name="mode" value="UPD" />
                  <input type="hidden" name="RolId" value={{RolId}} />
                  <button type="submit" class="btn primary my-1">Editar</button>
              </form>
              <form action="index.php" method="get">
                  <input type="hidden" name="page" value="admin_rol"/>
                  <input type="hidden" name="mode" value="DEL" />
                  <input type="hidden" name="RolId" value={{RolId}} />
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
  document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("btnAdd").addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=admin_rol&mode=INS&RolId=0");
    });
  });
</script>