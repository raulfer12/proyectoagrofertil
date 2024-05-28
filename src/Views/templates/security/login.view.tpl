<section class="container vh-100 d-flex align-items-center justify-content-center">
  <form class="grid" method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12 flex center">Iniciar Sesión</h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label class="col-12 col-m-4 flex center" for="txtEmail">Correo Electrónico</label>
        <div class="col-12 col-m-8">
          <input class="width-full center" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        </div>
        {{if errorEmail}}
          <div class="error col-4 py-2 col-m-8 offset-m-4 center">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex center" for="txtPswd">Contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full center" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        </div>
        {{if errorPswd}}
          <div class="error col-4 py-2 col-m-8 offset-m-4 center">{{errorPswd}}</div>
        {{endif errorPswd}}
      </div>
    {{if generalError}}
      <div class="error col-6 py-2 col-m-8 offset-m-3">
        {{generalError}}
      </div>
    {{endif generalError}}
    <form method="GET" action="index.php">
      <div class="row center flex-end px-3 py-3">
        <button class="btn btn-block primary" action="index.php" id="btnLogin" type="submit">Iniciar Sesión</button>
      </div>
    </form>
    </section>
  </form>
</section>