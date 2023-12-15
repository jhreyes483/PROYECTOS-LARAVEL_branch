@extends('layouts.admin.app')

@section('content')

    <h1>Detalles del Usuario:</h1>
    @foreach($usuarios as $usuario)
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">
                    <table class="table table-striped">

                        <tr>
                            <th scope="col">ID</th>
                            <td>{{$usuario->id}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Tipo de Documento</th>
                            <td>{{$usuario->tipo_documento->Nombre_Tipo_Documento}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Número de Documento<</th>
                            <td>{{$usuario->numero_documento}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Nombres</th>
                            <td>{{$usuario->nombres}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Apellidos</th>
                            <td>{{$usuario->apellidos}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Genero</th>
                            <td>{{$usuario->genero->Nombre_Genero}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Fecha de Nacimiento</th>
                            <td>{{$usuario->fecha_nacimiento}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Correo</th>
                            <td>{{$usuario->email}}</td>
                        </tr>
                        </tr>
                            <th scope="col">Contraseña</th>
                            <td>{{$usuario->password}}</td>
                        </tr>
                        </tr>
                            <th scope="col">Dirección</th>
                            <td>{{$usuario->direccion}}</td>
                        </tr>
                        </tr>
                            <th scope="col">Teléfono</th>
                            <td>Teléfono</td>
                        </tr>
                        </tr>
                            <th scope="col">Rol</th>
                            <td>{{$usuario->rol->Nombre_Rol}}</td>
                        </tr>

@endforeach

</table>

<a href="{{route('usuario.index')}}">Volver</a>
                </div>
            </div>
        </div>
    </div>

@endsection

