<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>

  <!--Fonts e Inconos-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto&display=swap">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!--Bootstrap y CSS-->
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/style.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="public/css/icons.css">

  <!--scripts Bootstrap-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
  
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #40c224" id="menu">
      <div class="container">
        <a href="index.php?page=index" class="navbar-brand center">
          <img class="mr-3" src="public\imgs\logo_agrofertil_8.png" style="height:75px; border-radius: 20%;">{{SITE_TITLE}}
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            {{foreach CLIENTNAVIGATION}}
              <li class="nav-item">
                <a class="nav-link text-white" href="{{nav_url}}">{{if nav_icon}}<i class="{{nav_icon}}"></i>{{endif nav_icon}}{{nav_label}}</a>
              </li>
            {{endfor CLIENTNAVIGATION}}

            {{if ADMINNAVIGATION}}
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle text-white" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Gestión de la Plataforma
                  </a>
                  <div class="dropdown-menu bg-warning" aria-labelledby="navDropDownLink">
                    {{foreach ADMINNAVIGATION}}
                      <a class="dropdown-item" href="{{nav_url}}">{{if nav_icon}}<i class="{{nav_icon}}"></i>{{endif nav_icon}}{{nav_label}}</a>
                    {{endfor ADMINNAVIGATION}}
                  </div>
              </li>
            </ul>
            {{endif ADMINNAVIGATION}}
            
            {{foreach NAVIGATION}}
            <li class="nav-item">
              <a class="nav-link text-white" href="{{nav_url}}">{{nav_label}}</a>
            </li>
            {{endfor NAVIGATION}}
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle text-white" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-user mx-2"></i>
                  {{with login}}
                    {{userName}}
                  {{endwith login}}
                </a>
                <div class="dropdown-menu bg-warning text-light" aria-labelledby="navDropDownLink">
                    <a class="dropdown-item" href="index.php?page=sec_logout"> <i class="fas fa-sign-out-alt mx-2"></i>Salir</a>
                </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <br><br><br>
  <main>
    {{{page_content}}}
  </main>
  <footer class="py-4">
    <section class="buttons">
      <a href="https://wa.me/31663812" class="fa fa-whatsapp"></a>
      <a href="https://www.instagram.com/agrofertilhn/?hl=es" class="fa fa-instagram"></a>
      <a href="https://www.facebook.com/profile.php?id=61555851848713" class="fa fa-facebook"></a>
      <a href="https://www.youtube.com/@Agrofertilhn" class="fa fa-youtube"></a>
      <a href="mailto:agrofertilhn@gmail.com?subject=Consulta de Cliente&body=*Redactar Mensaje Porfavor*" class="fa fa-google"></a>
    </section>
    <div class="container">
      <p class="m-0 text-center text-white">© 2024, Agrofertil S. de R.L. Todos los Derechos Reservados</p>
    </div>
  </footer>
  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
</body>
</html>