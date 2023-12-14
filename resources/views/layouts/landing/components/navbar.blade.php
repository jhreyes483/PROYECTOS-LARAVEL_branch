
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">

        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ml-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
       <ul class="navbar-nav text-uppercase ml-auto">
       
       <!-- Rutas del inicio Sesión Rol de Usuario -->
            @if(session('correo')) 

            <li class="nav-item"><form action="{{route('usuariologueado.index')}}" method="post"> 
            @csrf
            <input type="hidden" name="email" value="{{session('correo')}}">
            <input type="hidden" name="id" value="{{session('id')}}"> 
            <button class="btn btn-secondary">Inicio</button>            
            </form>
            </li>

            <li class="nav-item"><form action="{{route('usuariologueado.store')}}" method="post"> 
            @csrf
            <input type="hidden" name="email" value="{{session('correo')}}">
            <input type="hidden" name="id" value="{{session('id')}}"> 
            <button class="btn btn-secondary">Actualizar Datos</button>            
            </form>
            </li>


            <li class="nav-item"><form action="{{route('usuariologueado.productos')}}" method="post"> 
            @csrf
            <input type="hidden" name="email" value="{{session('correo')}}">
            <input type="hidden" name="id" value="{{session('id')}}"> 
            <button class="btn btn-secondary">Ver Productos</button>            
            </form>
            </li>

            <li class="nav-item"><form action="{{route('usuariologueado.carrito',session('id'))}}" method="post"> 
            @csrf
            <input type="hidden" name="email" value="{{session('correo')}}">
            <input type="hidden" name="id" value="{{session('id')}}"> 
            <button class="btn btn-secondary">Carrito @if(session('carrito')) {{session('carrito')}} @else 0 @endif</button>            
            </form>
            </li>
       
       

<!-- Rutas del Index Normal -->
            @else
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="{{route('index.index')}}">Inicio</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">Servicios</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="{{route('productodos.index')}}">Productos</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="{{route('login.login')}}">Iniciar sesión</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="{{route('registrar.create')}}">Registrarse</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contacto</a></li>
                @endif
            </ul>
        </div>
    </div>
</nav>
