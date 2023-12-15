@extends('layouts.admin.app')
@section('content')

    <h1>Detalles de Clasificación:</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">

                    <table class="table table-striped">
                        @foreach($clasificaciones as $clasificacion)
                        <tr>
                            <th scope="col">Id</th>
                            <td>{{$clasificacion->id}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Nombre de Clasificación</th>
                            <td>{{$clasificacion->Nombre}}</td>
                        </tr>
                        @endforeach
                    </table>

                    <a class="btn btn-primary btn-sm" href="{{ route('clasificacion.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection
