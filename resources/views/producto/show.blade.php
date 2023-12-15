@extends('layouts.admin.app')
@section('content')
    <h1>Detalles del Producto:</h1>

    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-4">
                <div class="table-responsive">
                <table class="table table-striped">
                    <tr>
                        <th scope="col">ID</th>
                        <td>{{$producto->id}}</td>
                    </tr>
                    <tr>
                        <th scope="col">Nombre</th>
                        <td>{{$producto->nombre_producto }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Imagén</th>
                        <td><img src="{{asset('storage').'/'. $producto->imagen}}" alt="{{$producto->nombre_producto}}" width="200px" height="100px"></td>
                    </tr>
                    <tr>
                        <th scope="col">Talla</th>
                        <td>{{$producto->Talla->talla }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Color</th>
                        <td><input type="color" disabled value="{{$producto->color}}"></td>
                    </tr>
                    <tr>
                        <th scope="col">Material</th>
                        <td>{{$producto->Material->material }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Categoria</th>
                        <td>{{$producto->Categoria->Nombre }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Clasificación</th>
                        <td>{{$producto->Clasificacion->Nombre }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Precio</th>
                        <td>{{$producto->valor }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Cantidad</th>
                        <td>{{$producto->cantidad }}</td>
                    </tr>

                </table>
                <a class="btn btn-primary btn-sm" href="{{route('producto.index') }}">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection

