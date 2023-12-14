
@extends('layouts.admin.app')
@section('content')
    <h1> PRQ`s </h1>

    <div class="container">
        <div class="row">
            <div class="col-md-12" id="div1">
                <table class="table table-striped table-dark ">
                    <tr>
                        <td>ID</td>
                        <td>Nombre</td>
                        <td>correo</td>
                        <td>Télefono</td>
                        <td>mensaje</td>
                        <td>Fecha de Creación</td>
                        <td>Acciones</td>
                    </tr>

                    @foreach($contactos as $contactos)
                        <td>{{$contactos->id}}</td>
                        <td>{{$contactos->nombre}}</td>
                        <td>{{$contactos->correo}}</td>
                        <td>{{$contactos->telefono}}</td>
                        <td>{{$contactos->mensaje}}</td>
                        <td>{{$contactos->created_at}}</td>
                        <td>
                            <form action="{{route('contacto.destroy', $contactos->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <a class="btn btn-info" href="{{route('contacto.show',$contactos->id)}}"><i class="fas fa-eye"></i> Detalles</a>
                                <button class="btn btn-danger"onclick="confirm('¿Desea Eliminar el genero ?')"><i class="fas fa-eraser"></i>  Eliminar</button>
                            </form>
                        </td>
                        </tr>
                    @endforeach
                </table>
            </div>
@endsection
