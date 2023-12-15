
@extends('layouts.admin.app')
@section('content')

    <h1>Detalles del Material:</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">

                    <table class="table table-striped">
                        @foreach($materiales as $material)
                        <tr>
                            <th scope="col">ID</th>
                            <td>{{$material->id}}</td>
                        </tr>
                        <tr>
                            <th scope="col">NOMBRE DEL MATERIAL</th>
                            <td>{{$material->material}}</td>
                        </tr>
                        @endforeach
                    </table>

                    <a class="btn btn-primary btn-sm" href="{{ route('material.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection
