@extends('layouts.admin.app')
@section('content')
    <h1>Detalles del Genero:</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">

                    <table class="table table-striped">
                        <tr>
                            <th scope="col">NOMBRE DEL GENERO</th>
                            <td>{{ $genero->Nombre_Genero }}</td
                        </tr>
                        <tr>
                            <th scope="col">CREACIÓN</th>
                            <td>{{ $genero->created_at }}</td
                        </tr>
                        <tr>
                            <th scope="col">ACTUALIZACION</th>
                            <td>{{ $genero->updated_at }}</td>
                        </tr>
                    </table>

                    <a class="btn btn-primary btn-sm" href="{{ route('genero.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection
