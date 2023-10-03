<section class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card my-5 w-100">
            <div class="card-header text-light" style="background-color: #0a7506">
                <h3 class="text-center">{{mode_dsc}}</h3>
            </div>
        <div class="card-body"> 
            <form class="grid" method="post" action="index.php?page=admin_rol&mode={{mode}}&RolId={{RolId}}">
                {{if notDisplayIns}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="RolId">Código</label>
                        <input type="hidden" class="width-full center" id="RolId" name="RolId" value="{{RolId}}"/>
                        <input readonly type="text" class="width-full center disabled" name="RolIdDummy" value="{{RolId}}"/>
                    </div>
                {{endif notDisplayIns}}

                <div class="row">
                    <label class="col-12 col-m-4 flex center" for="RolDsc">Descripción</label>
                    <input type="text" class="width-full center" {{readonly}} id="RolDsc" name="RolDsc" value="{{RolDsc}}" maxlength="45" placeholder="Ingrese la descripción del rol">
                </div>

                {{if notDisplayIns}}
                    <div class="row">
                        <label class="col-12 col-m-4 flex center" for="RolEst">Estado</label>
                        <select class="width-full browser-default custom-select center" id="RolEst" name="RolEst" {{if readonly}}disabled{{endif readonly}}>
                            <option value="ACT" {{RolEst_ACT}}>Activo</option>
                            <option value="INA" {{RolEst_INA}}>Inactivo</option>
                        </select>
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
        window.location.assign("index.php?page=admin_roles");
        });
});
</script>

<script>
    $(document).ready(function(){
    $(".mul-select").select2({
        placeholder: " Seleccione las funciones",
        tags: true,
        tokenSeparators: ['/',',',';'," "] 
    });
})
</script>