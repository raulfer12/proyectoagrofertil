<section class="container vh-100 d-flex align-items-center justify-content-center">
  <form class="grid" method="post" action="index.php?page=sec_register">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12">Crea tu cuenta</h1>
    </section>
    <div class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      {{if errorGeneral}}
        <div class="my-3 text-danger">{{errorGeneral}}</div>
      {{endif errorGeneral}}

      <div class="row">
        <label class="col-12 col-m-4 flex center" for="txtNombre">Nombre Completo</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" id="txtNombre" name="txtNombre" value="{{txtNombre}}" />
        </div>
        {{if errorNombre}}
        <div class="left error col-12 py-2 col-m-8 flex-end">{{errorNombre}}</div>
        {{endif errorNombre}}
      </div>

      <div class="row">
        <label class="col-12 col-m-4 flex center" for="txtEmail">Correo Electrónico</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        </div>
        {{if errorEmail}}
        <div class="left error col-12 py-2 col-m-8 flex-end">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      
      <div class="row">
        <label class="col-12 col-m-4 flex center" for="txtPswd">Contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        </div>
        {{if errorPswd}}
        <div class="left error col-12 py-2 col-m-8 flex-end">{{errorPswd}}</div>
        {{endif errorPswd}}
      </div>
      
      <div class="row center flex-end px-4">
        <button class="btn btn-block primary" id="btnSignin" type="submit">Crear Cuenta</button>
      </div>
    </div>
  </form>
</section>