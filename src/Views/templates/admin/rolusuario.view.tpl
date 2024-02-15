<section class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card my-5 w-100">
        <div class="card-header text-light" style="background-color: #40c224 ">
            <h3 class="text-center">{{mode_dsc}}</h3>
        </div>
        <div class="card-body">
            <form class="grid" method="post"
                action="index.php?page=admin_rolusuario&mode={{mode}}&UsuarioId={{UsuarioId}}&RolId={{RolId}}">
                {{if notDisplayIns}}
                <div class="row">
                    <label class="col-12 col-m-4 flex center" for="FuncionId">Código Usuario</label>
                    <input type="hidden" class="width-full center" id="UsuarioId" name="UsuarioId" value="{{UsuarioId}}" />
                    <input readonly type="text" class="width-full center disabled" name="UsuarioIdDummy" value="{{UsuarioId}}" />
                </div>

                <div class="row">
                    <label class="col-12 col-m-4 flex center" for="RolId">Código Rol</label>
                    <input type="hidden" class="width-full center" id="RolId" name="RolId" value="{{RolId}}" />
                    <input readonly type="text" class="width-full center disabled" name="RolIdDummy" value="{{RolId}}" />
                </div>
                {{endif notDisplayIns}}

                {{if onlyDisplayIns}}
                <div class="row">
                    <label class="col-12 col-m-4 flex center" for="UsuarioId2">Usuario</label>
                    <select class="width-full browser-default custom-select center" id="UsuarioId2" name="UsuarioId2" {{if readonly}}disabled{{endif readonly}}>
                        {{foreach usuarios}}
                            <option value="{{UsuarioId}}">{{UsuarioNombre}} | {{UsuarioEmail}} | {{UsuarioTipo}}</option>
                        {{endfor usuarios}}
                    </select>
                </div>
                {{endif onlyDisplayIns}}

                {{if onlyDisplayIns}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="Roles">Roles</label>
                        <select class="width-full browser-default custom-select center" id="RolId2" name="RolId2" {{if readonly}} disabled {{endif readonly}}>
                            {{foreach roles}}
                                <option value="{{RolId}}">{{RolDsc}}</option>
                            {{endfor roles}}
                        </select>
                    </div>
                {{endif onlyDisplayIns}}

                {{if notDisplayIns}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="RolUsuarioEst">Estado del Rol para el Usuario</label>
                        <select class="width-full browser-default custom-select center" id="RolUsuarioEst" name="RolUsuarioEst" {{if readonly}}disabled{{endif readonly}}>
                            <option value="ACT" {{RolUsuarioEst_ACT}}>Activo</option>
                            <option value="INA" {{RolUsuarioEst_INA}}>Inactivo</option>
                        </select>
                    </div>
                {{endif notDisplayIns}}

                {{if allInfoDisplayed}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="UsuarioNombre">Nombre del Usuario</label>
                        <input type="text" readonly class="width-full center" id="UsuarioNombre" name="UsuarioNombre" value="{{UsuarioNombre}}" maxlength="128" />
                    </div>
                {{endif allInfoDisplayed}}

                {{if allInfoDisplayed}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="UsuarioEmail">Correo del Usuario</label>
                        <input type="text" readonly class="width-full center" id="UsuarioEmail" name="UsuarioEmail" value="{{UsuarioEmail}}" maxlength="128" />
                    </div>
                {{endif allInfoDisplayed}}

                {{if allInfoDisplayed}}
                <div class="row">
                    <label class="col-12 col-m-4 flex center" for="UsuarioTipo">Tipo de Usuario</label>
                    <input type="text" readonly class="width-full center" id="UsuarioTipo" name="UsuarioTipo" value="{{UsuarioTipo}}" maxlength="128" />
                </div>
                {{endif allInfoDisplayed}}

                {{if allInfoDisplayed}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="RolUsuarioFch">Fecha de asignación</label>
                        <input type="text" readonly class="width-full center" id="RolUsuarioFch" name="RolUsuarioFch" value="{{RolUsuarioFch}}" maxlength="128" />
                    </div>
                {{endif allInfoDisplayed}}

                {{if notDisplayIns}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="RolUsuarioExp">Fecha de expiración</label>
                        <input type="date" class="width-full center" id="RolUsuarioExp" name="RolUsuarioExp" value="{{RolUsuarioExp}}" min="{{minimumDate}}" {{if readonly}}disabled{{endif readonly}}>
                    </div>
                {{endif notDisplayIns}}

                {{if hasErrors}}
                    <section class="text-center">
                        <ul>
                            {{foreach aErrors}}
                                <li class="error">{{this}}</li>
                            {{endfor aErrors}}
                        </ul>
                    </section>
                {{endif hasErrors}}

                <div class="row center flex-end px-3 py-3"></div>
                    {{if showaction}}
                        <button type="submit" class="btn btn-block primary" id="btnGuardar" name="btnGuardar">Guardar</button>
                    {{endif showaction}}
                    <button type="button" class="btn btn-block btn-danger" id="btnCancelar"name="btnCancelar">Cancelar</button>
                </div>
        </form>
    </div>
    </div>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("btnCancelar").addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=admin_rolesusuarios");
        });
    });
</script>