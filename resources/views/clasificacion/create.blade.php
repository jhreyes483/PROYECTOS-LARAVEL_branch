@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Registrar clasificacion</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('clasificacion.store')}}" method="POST" >
                        @csrf
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre de la clasificacion</label>
                                    <input required type="text" name="Nombre" class="input">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear clasificacion">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>

        </div>
    </section>
@endsection

