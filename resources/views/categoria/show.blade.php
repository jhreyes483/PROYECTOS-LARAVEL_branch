
@extends('layouts.admin.app')
@section('content')

    <h1>Detalles de la Categoria:</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">

                    <table class="table table-striped">
                        @foreach($categorias as $categoria)
                        <tr>
                            <th scope="col">Id</th>
                            <td>{{$categoria->id}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Nombre de Categoria</th>
                            <td>{{$categoria->Nombre}}</td>
                        </tr>
                            @endforeach
                    </table>

                    <a class="btn btn-primary btn-sm" href="{{ route('categoria.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection
