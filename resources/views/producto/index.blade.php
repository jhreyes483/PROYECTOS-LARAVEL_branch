@extends('layouts.admin.app')
@section('content')

<!-- Alertas  -->
@if(session('mensaje')=="Creado Correctamente")
<div class="alert alert-success" role="alert">
<i class="fas fa-check-square"></i> {{session('mensaje')}}
<button type="button" class="close" data-dismiss="alert" aria-label="Close" >
<span aria-hidden="true">&times;</span>
</button>
</div>
@elseif(session('mensaje')=="Eliminado Correctamente")
<div class="alert alert-danger" role="alert">
<i class="fas fa-check-times-circle"></i> {{session('mensaje')}}
<button type="button" class="close" data-dismiss="alert" aria-label="Close" >
<span aria-hidden="true">&times;</span>
</button>
</div>
@else
@endif



    <div class="d-flex">
        <div class="p-2">
            <a class="btn btn-primary" href="{{route('producto.create')}}">Crear Nuevo Producto <i class="fas fa-plus-square"></i></a>
        </div>
        <div class="ml-auto p-2">

            <div class="app-header-left">
                <div class="search-wrapper">
                    <div class="input-holder">
                        <form action="{{route('producto.index')}}" method="get">
                            <input type="text" name="name_product" placeholder="Filtrar por Nombre de Producto:" class="search-input text-white">
                        </form>
                        <button class="search-icon bg-white"><span></span></button>
                    </div>
                    <button class="close"></button>
                </div>
            </div>
        </div>
    </div>

<div class="container">
    <div class="row">
    <div class="col-md-12 contenedor">
              <table class="table table-striped table-dark ">
                <thead>
                <tr>
                <th scope="col">Id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Imagen</th>
                <th scope="col">Talla</th>
                <th scope="col">Color</th>
                <th scope="col">Material</th>
                <th scope="col">Categoria</th>
                <th scope="col">Clasificacion</th>
                <th scope="col">Precio</th>
                <th scope="col">Cantidad</th>
                <th scope="col">Actualizacion</th>
                <th scope="col">Opciones</th>
                </tr>
                </thead>
                  <tbody>
                  @foreach($productos as $productos)
                  <tr>
                      <td>{{$productos->id}}</td>
                      <td>{{$productos->nombre_producto}}</td>
                      <td><img src="{{asset('storage').'/'. $productos->imagen}}" alt="{{$productos->nombre_producto}}" width="200px" height="100px"></td>
                      <td>{{$productos->Talla->talla}}</td>
                      <td><input type="color" disabled value="{{$productos->color}}"></td>
                      <td>{{$productos->Material->material}}</td>
                      <td>{{$productos->Categoria->Nombre}}</td>
                      <td>{{$productos->Clasificacion->Nombre}}</td>
                      <td>{{$productos->valor}}</td>
                      <td>{{$productos->cantidad}}</td>
                      <td>{{$productos->updated_at}}</td>
                      <td>
                          <form action="{{route('producto.destroy',$productos->id)}}"method="post">
                              @csrf
                              @method('DELETE')
                          <a href="{{ route('producto.show',$productos->id)}}" class="btn btn-sm btn-info">Detalles</a>
                         <a href="{{ route('producto.edit',$productos->id)}}" class="btn btn-sm btn-warning">Editar</a>
                          <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
                          </form>
                      </td>
                  </tr>
                  @endforeach
                  </tbody>
               </table>
        </div>
    </div>
</div>
@endsection
