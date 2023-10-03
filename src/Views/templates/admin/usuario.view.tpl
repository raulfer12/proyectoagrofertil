<section class="container d-flex align-items-center justify-content-center min-vh-100">
  <div class="card my-5 w-100">
    <div class="card-header text-light" style="background-color: #0a7506">
      <h3 class="text-center">{{mode_dsc}}</h3>
    </div>
    <div class="card-body"> 
      <form class="grid" method="post" action="index.php?page=admin_usuario&mode={{mode}}&UsuarioId={{UsuarioId}}">
        {{if notDisplayIns}}
        <div class="row">
          <label class="col-12 col-m-4 flex center" for="UsuarioId">Código</label>
          <input type="hidden" class="form-control" id="UsuarioId" name="UsuarioId" value="{{UsuarioId}}"/>
          <input class="width-full center" readonly type="text" class="form-control" name="UsaurioIdDummy" value="{{UsuarioId}}"/>
        </div>
        {{endif notDisplayIns}}
  
        <div class="row">
          <label class="col-12 col-m-4 flex center my-3" for="UsuarioEmail">Correo Electrónico</label>
          <input class="width-full center" type="email" class="form-control" {{readonly}} id="UsuarioEmail" name="UsuarioEmail" value="{{UsuarioEmail}}" maxlength = "80" placeholder="Ingrese su correo">
        </div>

        <div class="row">
          <label class="col-12 col-m-4 flex center my-3" for="UsuarioNombre">Nombre Completo</label>
          <input class="width-full center" type="text" class="form-control" {{readonly}} id="UsuarioNombre" name="UsuarioNombre" value="{{UsuarioNombre}}" maxlength="80" placeholder="Ingrese su nombre completo">
        </div>

        <div class="row">
          <label class="col-12 col-m-4 flex center my-3" for="UsuarioPswd">Contraseña</label>
          <input class="width-full center" type="password" class="form-control" {{readonly}} id="UsuarioPswd" name="UsuarioPswd" value="{{UsuarioPswd}}" maxlength="20" placeholder="Ingrese su contraseña">
        </div>

        {{if allInfoDisplayed}}
        <div class="row">
            <label class="col-12 col-m-4 flex center my-3" for="UsuarioFching">Fecha de ingreso del usuario</label>
            <br/>
            <input class="width-full center" type="text" readonly class="form-control" id="UsuarioFching" name="UsuarioFching" value="{{UsuarioFching}}" maxlength="128"/>
        </div>
        {{endif allInfoDisplayed}}
    
        {{if allInfoDisplayed}}
        <div class="row">
            <label class="col-12 col-m-4 flex center my-3" for="UsuarioPswdEst">Estado de la contraseña</label>
            <br/>
            <input class="width-full center" type="text" readonly class="form-control" id="UsuarioPswdEst" name="UsuarioPswdEst" value="{{UsuarioPswdEst}}" maxlength="5"/>
        </div>
        {{endif allInfoDisplayed}}
    
        {{if allInfoDisplayed}}
        <div class="row">
            <label class="col-12 col-m-4 flex center my-3" for="UsuarioPswdExp">Fecha de vencimiento de la contraseña</label>
            <br/>
            <input class="width-full center" type="text" readonly class="form-control" id="UsuarioPswdExp" name="UsuarioPswdExp" value="{{UsuarioPswdExp}}" maxlength="128"/>
        </div>
        {{endif allInfoDisplayed}}

        {{if notDisplayIns}}
          <div class="row">
            <label class="col-12 col-m-4 flex center my-3" for="UsuarioEst">Estado del usuario</label>
            <br/>
            <select class="width-full browser-default custom-select" id="UsuarioEst" name="UsuarioEst" {{if readonly}}disabled{{endif readonly}}>
                <option value="ACT" {{UsuarioEst_ACT}}>Activo</option>
                <option value="INA" {{UsuarioEst_INA}}>Inactivo</option>
            </select>
          </div>
        {{endif notDisplayIns}}

        {{if allInfoDisplayed}}
        <div class="form-group col-md-10">
          <label class="col-12 col-m-4 flex center my-3" for="UsuarioPswdChg">Fecha en que se cambio la contraseña por última vez</label>
          <br/>
          <input class="width-full center" type="text" readonly class="form-control" id="UsuarioPswdChg" name="UsuarioPswdChg" value="{{UsuarioPswdChg}}" maxlength="128"/>
        </div>
        {{endif allInfoDisplayed}}
        
        <div class="row">
          <label class="col-12 col-m-4 flex center my-3" for="UsuarioTipo">Tipo de usuario</label>
          <br/>
          <select class="width-full browser-default custom-select" id="UsuarioTipo" name="UsuarioTipo" {{if readonly}}disabled{{endif readonly}}>
              <option value="ADM" {{UsuarioTipo_ADM}}>Administrador</option>
              <option value="AUD" {{UsuarioTipo_AUD}}>Auditor</option>
              <option value="PBL" {{UsuarioTipo_PBL}}>Público</option>
          </select>
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
        
        {{if showaction}}
          <button type="submit" class="btn btn-block primary my-3" id="btnGuardar" name="btnGuardar">Guardar</button>
        {{endif showaction}}
        <button type="button" class="btn btn-block btn-danger" id="btnCancelar" name="btnCancelar">Cancelar</button>
      </form>
    </div>
  </div>
</section>

<script>
  document.addEventListener("DOMContentLoaded", function(){
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=admin_usuarios");
      });
  });

  $('select').selectpicker();
</script>