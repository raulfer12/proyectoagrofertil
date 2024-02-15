<section class="container-fluid min-vh-100">
  
    <h3 class="my-4 text-center display-4 mb-2">Gestión de Roles para Usuarios Administrativos</h3>
    
    <div class="rounded">
      <form method="POST" action="index.php?page=admin_rolesusuarios">
        <div class="form-row">
          <div class="col-10">
            <input type="search" class="form-control rounded" id="UsuarioBusqueda" name="UsuarioBusqueda" value="{{UsuarioBusqueda}}" placeholder="Ingrese su busqueda" >
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
            <th class="text-center align-middle">Código Usuario</th>
            <th class="text-center align-middle">Código Rol</th>
            <th class="text-center align-middle">Estado del Rol para el Usuario</th>
            <th class="text-center align-middle">Nombre del Usuario</th>
            <th class="text-center align-middle">Correo del Usuario</th>
            <th class="text-center align-middle">Tipo de Usuario</th>
            <th class="text-center align-middle">Fecha de Asignación</th>
            <th class="text-center align-middle">Fecha de Expiración</th>
            <th class="text-center align-middle"><button type="button" class="btn primary my-2" id="btnAdd">Nuevo</button></th>
          </tr>
        </thead>
        <tbody>
          {{foreach items}}
            <tr>
              <td class="text-center align-middle">{{UsuarioId}}</td>
              <td class="text-center align-middle">{{RolId}}</td>
              <td class="text-center align-middle">{{RolUsuarioEst}}</td>
              <td class="text-center align-middle"><a href="index.php?page=admin_rolusuario&mode=DSP&UsuarioId={{UsuarioId}}&RolId={{RolId}}">{{UsuarioNombre}}</a></td>
              <td class="text-center align-middle">{{UsuarioEmail}}</td>
              <td class="text-center align-middle">{{UsuarioTipo}}</td>
              <td class="text-center align-middle">{{RolUsuarioFch}}</td>
              <td class="text-center align-middle">{{RolUsuarioExp}}</td>
              <td class="text-center align-middle">
                <form action="index.php" method="get">
                    <input type="hidden" name="page" value="admin_rolusuario"/>
                    <input type="hidden" name="mode" value="UPD" />
                    <input type="hidden" name="UsuarioId" value={{UsuarioId}} />
                    <input type="hidden" name="RolId" value={{RolId}} />
                    <button type="submit" class="btn primary my-1">Editar</button>
                </form>
                <form action="index.php" method="get">
                    <input type="hidden" name="page" value="admin_rolusuario"/>
                    <input type="hidden" name="mode" value="DEL" />
                    <input type="hidden" name="UsuarioId" value={{UsuarioId}} />
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
         window.location.assign("index.php?page=admin_rolusuario&mode=INS&UsuarioId=0&RolId=0");
       });
     });
  </script>