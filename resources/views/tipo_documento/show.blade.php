@extends('layouts.admin.app')
@section('content')

    <h1>Detalles de Tipos de Documentos:</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">

                    <table class="table table-striped">

                        @foreach($tipo_documentos as $tipo_documento)
                        <tr>
                            <th scope="col">Id</th>
                            <td>{{$tipo_documento->id}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Nombre tipo de Documento</th>
                            <td>{{$tipo_documento->Nombre_Tipo_Documento}}</td>
                        </tr>
                        <tr>
                            <th scope="col">Siglas</th>
                            <td>{{$tipo_documento->Siglas}}</td>
                        </tr>
                        @endforeach
                    </table>

                    <a class="btn btn-primary btn-sm" href="{{ route('tipo_documento.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>

@endsection
