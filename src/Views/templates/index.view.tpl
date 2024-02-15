<br><br><br><br>
<section class="container-fluid" id="carousel">
    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
        <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
            <img class="d-block img-fluid" src="public\imgs\slider06.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block img-fluid" src="public\imgs\slider04.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block img-fluid" src="public\imgs\slider05.jpg" alt="Third slide">
        </div>
         <div class="carousel-item">
            <img class="d-block img-fluid" src="public\imgs\slider07.png" alt="Third slide">
        </div>
         <div class="carousel-item">
            <img class="d-block img-fluid" src="public\imgs\slider08.png" alt="Third slide">
        </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Siguiente</span>
        </a>
    </div>
</section>

<section class="container-fluid" id="products_recientes">

    <h4 class="my-4 text-center p-3 mb-2 text-light" style="background-color: #0a7506">Últimos Productos Añadidos</h4>
    <div class="row">
        {{foreach items}}
        <div class="col-lg-3 col-md-4 mb-4">
            <div class="card h-100">
                <div class="card-body align-items-center d-flex flex-column justify-content-center">
                    <a href="index.php?page=VisualizarProducto&ProductoId={{ProductoId}}"><img class="card-img-top mb-4" src="{{MediaPath}}" alt="{{MediaDoc}}" style="width: 200px; max-height: 400px;"></a>
                    <h4 class="card-title text-center mb-4">
                        <a href="index.php?page=VisualizarProducto&ProductoId={{ProductoId}}">{{ProdNombre}}</a>
                    </h4>
                    <h5 class="mb-4">Lps. {{ProductoPrecioVenta}}</h5>
                    <p class="card-text">{{ProductoNombre}}</p>
                </div>
            </div>
        </div>
        {{endfor items}}
    </div>
</section>