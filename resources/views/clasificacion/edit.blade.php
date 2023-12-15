@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actualizar clasificacion</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    @foreach($clasificaciones as $clasificacion)
                        <form action="{{route('clasificacion.update',$clasificacion->id)}}" method="post">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="id" value="{{$clasificacion->id}}">
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre de la clasificacion</label>
                                    <input type="text" name="Nombre" class="input" value="{{$clasificacion->Nombre}}" >
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
                    @endforeach
                </div>
            </div>
        </div>

        </div>
    </section>
@endsection

