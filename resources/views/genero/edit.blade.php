@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actualizar Genero</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('genero.update',$genero->id)}}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre del Genero </label>
                                    <input type="text" name="Nombre_Genero" class="input" value="{{$genero->Nombre_Genero}}">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Actualizar Genero">
                            </div>
                            <br>
                    </form>
                </div>
            </div>
        </div>

        </div>
    </section>
@endsection

