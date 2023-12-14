@extends('layouts.admin.app')
@section('content')
    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actializar Usuario</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    @foreach($usuarios as $usuario)
                        <form action="{{route('usuario.update',$usuario->id)}}" method="POST">
                            @csrf
                            @method('PUT')
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Tipo de Documento</label>
                                    <select name="tipo_documento_id" class="input">
                                        <option value="{{$usuario->tipo_documento->id}}">{{$usuario->tipo_documento->Nombre_Tipo_Documento}}</option>
                                        @foreach($tipo_documentos as $tipo_documento)
                                            <option value="{{$tipo_documento->id}}">{{$tipo_documento->Nombre_Tipo_Documento}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="name">Tipo de Documento</label>
                                    <input type="text" name="numero_documento" class="input" value="{{$usuario->numero_documento}}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombres</label>
                                    <input type="text" name="nombres" class="input" value="{{$usuario->nombres}}">
                                </div>
                                <div class="col">
                                    <label for="name">Apellidos</label>
                                    <input type="text" name="apellidos" class="input" value="{{$usuario->apellidos}}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Género</label>
                                    <select name="genero_id" class="input">
                                        <option value="{{$usuario->genero->id}}">{{$usuario->genero->Nombre_Genero}}</option>
                                        @foreach($generos as $genero)
                                            <option value="{{$genero->id}}">{{$genero->Nombre_Genero}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="name">Fecha de Nacimiento</label>
                                    <input type="date" name="fecha_nacimiento" class="input" value="{{$usuario->fecha_nacimiento}}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Correo</label>
                                    <input type="email" name="email" class="input" value="{{$usuario->email}}">
                                </div>
                                <div class="col">
                                    <label for="name">Contraseña</label>
                                    <input type="password" name="password" class="input" value="{{$usuario->password}}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Dirección</label>
                                    <input type="text" name="direccion" class="input" value="{{$usuario->direccion}}">
                                </div>
                                <div class="col">
                                    <label for="name">Teléfono</label>
                                    <input type="text" name="telefono" class="input" value="{{$usuario->telefono}}">
                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Actualizar Usuario">
                            </div>
                            <br>
                    </form>
                    @endforeach
                </div>
            </div>
        </div>
        </div>
    </section>
@endsection


