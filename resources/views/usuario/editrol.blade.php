@extends('layouts.admin.app');
@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-4">
        @foreach($usuarios as $usuario)
            <form action="{{route('usuario.update',$usuario->id)}}" method="POST">
                @csrf
                @method('PUT')

                <div class="form-group mt-4">
                    <label for="name">Rol</label>
                   <select  name="rol_id" >
                   <option value="{{$usuario->rol->id}}">{{$usuario->rol->Nombre_Rol}}</option>
                   @foreach($roles as $rol)
                   <option value="{{$rol->id}}">{{$rol->Nombre_Rol}}</option>
                   @endforeach
                   </select>
                </div>

             
               <button type="submit" class="btn btn-primary">Actualizar Rol de Usuario</button>
                <a class="btn btn-sm btn-danger" href="{{ route('usuario.index')}}">Cancelar</a>
            </form>
    @endforeach
        </div>
    </div>
</div>
@endsection

