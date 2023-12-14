@extends('layouts.landing.app2')
@section('content')


    <link href="{{url('css/styles3.css')}}" rel="stylesheet" />




<section class="fondo">

    <!-- Alertas  -->
    @if(session('mensaje'))
        <div class="alert alert-success" role="alert">
            <i class="fas fa-check-square"></i> {{session('mensaje')}}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close" >
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

    @else
    @endif

    <div class="login-wrap">

        <h2>Registrar Usuario</h2><br>

        <div class="login-form">
            <!-- FORMULARIO-->
            <form action="{{route('registrar.store')}}" method="POST">
                @csrf
                <div class="group">

                    <div class="row">
                        <div class="col">
                            <label for="name">Tipo de Documento</label>
                            <select name="tipo_documento_id" class="input" required>
                                @foreach($tipo_documentos as $tipo_documento)
                                    <option value="{{$tipo_documento->id}}">{{$tipo_documento->Nombre_Tipo_Documento}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col">
                            <label for="name">Número de Documento</label>
                            <input type="number" name="numero_documento" class="input" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="name">Nombres</label>
                            <input type="text" name="nombres" class="input" required>
                        </div>
                        <div class="col">
                            <label for="name">Apellidos</label>
                            <input type="text" name="apellidos" class="input" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="name">Género</label>
                            <select name="genero_id" class="input" required>
                                @foreach($generos as $genero)
                                    <option value="{{$genero->id}}">{{$genero->Nombre_Genero}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col">
                            <label for="name">Fecha de Nacimiento</label>
                            <input type="date" name="fecha_nacimiento" class="input" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="name">Correo</label>
                            <input type="email" name="email" class="input" required>
                        </div>
                        <div class="col">
                            <label for="name">Contraseña</label>
                            <input type="password" name="password" class="input" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="name">Dirección</label>
                            <input type="text" name="direccion" class="input" required>
                        </div>
                        <div class="col">
                            <label for="name">Teléfono</label>
                            <input type="text" name="telefono" class="input" required>
                        </div>
                    </div>




                    <div class="row">
                        <div class="col">
                            <label for="name">Rol</label>
                            <select  name="rol_id" class="input" required>
                                @foreach($roles as $rol)
                                    <option  value="{{$rol->id}}">{{$rol->Nombre_Rol}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col">

                        </div>
                    </div>
                    <br>
                    <div class="group">
                        <input type="submit" class="button" value="Crear Nuevo Usuario">
                    </div>
                    <br>
            </form>

        </div>
    </div>
    </div>
    </div>

</section>

@endsection

