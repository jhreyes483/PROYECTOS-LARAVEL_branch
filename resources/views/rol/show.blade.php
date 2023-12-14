@extends('layouts.admin.app')
@section('content')

    <h1>Detalles del Rol:</h1>
<div class="container">
    <div class="row">
        <div class="col-md-6 mt-4">
            <div class="table-responsive">

                <table class="table table-striped">
                    <tr>
                        <th scope="col">NOMBRE DEL ROL</th>
                        <td>{{ $rol->Nombre_Rol }}</td>
                    </tr>
                    <tr>
                        <th scope="col">CREACIÓN</th>
                        <td>{{$rol->created_at }}</td>
                    </tr>
                    <tr>
                        <th scope="col">ACTUALIZACION</th>
                        <td>{{$rol->updated_at }}</td>
                    </tr>
                </table>

                <a class="btn btn-primary btn-sm" href="{{ route('rol.index') }}">Volver</a>
            </div>
        </div>
    </div>
</div>
@endsection

