@extends('layouts.admin.app')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6 mt-4">
            <div class="table-responsive">
                <table class="table table-striped">
                    <tr>
                        <th scope="col">ID</th>
                        <td>{{ $tallas->id }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Talla</th>
                        <td>{{ $tallas->talla}}</td>
                    </tr>
                </table>
                <a class="btn btn-primary btn-sm" href="{{ route('talla.index') }}">Volver</a>
            </div>
        </div>
    </div>
</div>
@endsection

