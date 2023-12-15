@extends('layouts.admin.app')
@section('content')
<h1> Clasificaciones </h1>

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

        <a href="{{route('clasificacion.create')}}" class="btn btn-primary my-4">Crear Clasificación <i class="fas fa-plus-square"></i> </a>

        <div class="col-md-12" id="div1">
<table   class="table table-striped table-dark ">
<tr>
<td>ID</td>
<td>Nombre de Clasificación</td>
<td>Acciones</td>
</tr>
<tr>
@foreach($clasificaciones as $clasificacion)
<td>{{$clasificacion->id}} </td>
<td>{{$clasificacion->Nombre}}</td>
<td>
    <form action="{{route('clasificacion.destroy', $clasificacion->id)}}" method="post">
@csrf
@method('DELETE')
<a class="btn btn-warning" href="{{route('clasificacion.edit',$clasificacion->id)}}"><i class="fas fa-edit"></i>  Editar</a>
<a class="btn btn-info" href="{{route('clasificacion.show',$clasificacion->id)}}"><i class="fas fa-eye"></i> Detalles</a>
<button class="btn btn-danger"onclick="confirm('¿Desea Eliminar la Clasificación ?')"><i class="fas fa-eraser"></i>  Eliminar</button>
</form>
</td>
</tr>
@endforeach
</table>
</div>
    </div>
</div>
@endsection
