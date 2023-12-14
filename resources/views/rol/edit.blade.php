@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actializar Rol</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('rol.update',$rol->id)}}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre del Rol</label>
                                    <input type="text" name="Nombre_Rol" class="input" value="{{$rol->Nombre_Rol}}">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Actualizar Tipo de Documento">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>

        </div>
    </section>
@endsection



