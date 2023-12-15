@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Registrar Genero</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('genero.store')}}" method="POST" >
                        @csrf
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre del Nuevo Genero</label>
                                    <input required type="text" name="Nombre_Genero" class="input">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear Genero">
                            </div>
                            <br>
                    </form>
                </div>
            </div>
        </div>

        </div>
    </section>
@endsection

