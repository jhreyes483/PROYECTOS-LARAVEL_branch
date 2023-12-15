@extends('layouts.admin.app')
@section('content')

    <h1> Talla</h1>

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
<i class="fas fa-times-circle"></i> {{session('mensaje')}}
<button type="button" class="close" data-dismiss="alert" aria-label="Close" >
<span aria-hidden="true">&times;</span>
</button>
</div>
@else
@endif

<div class="container">
    <div class="row">

        <a class="btn btn-primary mt-3 mb-4" href="{{ route('talla.create') }}">Crear Nuevo talla <i class="fas fa-plus-square"></i></a>

        <div class="col-md-12" id="div1">
            <table   class="table table-striped table-dark ">
                <thead>
                <tr>
                <th scope="col">Id</th>
                <th scope="col">Nombre la talla</th>
                <th scope="col">Opciones</th>
                </tr>
                </thead>
                  <tbody>
                  @foreach($tallas as $tallas)
                  <tr>
                      <td>{{$tallas->id}}</td>
                      <td>{{$tallas->talla}}</td>
                      <td>
                          <form action="{{ route('talla.destroy',$tallas->id)}}"method="post">
                              @csrf
                              @method('DELETE')
                          <a href="{{ route('talla.show',$tallas->id)}}" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Detalles</a>
                         <a href="{{ route('talla.edit',$tallas->id)}}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Editar </a>
                          <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-eraser"></i> Eliminar</button>
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
