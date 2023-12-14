@extends('layouts.admin.app')
@section('content')

    <h1>Detalles de Contacto:</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">

                    <table class="table table-striped">
                        <tr>
                            <th scope="col">Id</th>
                            <td>{{$contacto->id}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Nombre:</th>
                            <td>{{$contacto->nombre}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Correo:</th>
                            <td>{{$contacto->correo}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Teléfono:</th>
                            <td>{{$contacto->telefono}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Mensaje:</th>
                            <td>{{$contacto->mensaje}}</td>
                        </tr>
                    </table>

                    <a class="btn btn-primary btn-sm" href="{{ route('contacto.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection
