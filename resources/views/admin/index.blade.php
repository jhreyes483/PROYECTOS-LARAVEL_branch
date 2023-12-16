@extends('layouts.admin.app')

@section('content')




    <div class="container">
        <div class="row">
            <div class="col-md-11 mx-auto">
                
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>No Documento.</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>genero</th>
                            <th>Tipo de Doc</th>
                            <th>F. creacion</th>
                            <th>Opciones</th>
                        </tr>
                        </thead>
                        <tbody class="table-light">
                        @foreach($usuarios as $usuario)
                            <tr>
                                <td>{{ $usuario->id_admin }}</td>
                                <td>{{ $usuario->nom1.' '.$usuario->nom2 }}</td>
                                <td>{{ $usuario->ape1.' '.$usuario->ape2 }}</td>
                                <td>{{ $gen[ $usuario->genero ] }}</td>
                                <td>{{ $doc[ $usuario->tipoDoc ] }}</td>
                                <td>{{ $usuario->created_at }}</td>
                                <td>
                                    <form id="formOptions" action="{{ route('admin.destroy', $usuario->id_admin) }}" method="post">
                                        @csrf
                                        @method('DELETE')
                                        <a href="{{ route('admin.edit',$usuario->id_admin) }}" class="btn btn-sm btn-warning" title="Editar"><i class="fas fa-eye-dropper"></i></a>
                                        <button  class="btn btn-sm btn-danger" type="button" onclick="confirmDelte()" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
                                        <a href="{{ route('admin.show',$usuario->id_admin) }}" class="btn btn-sm btn-info"title="Detalle" ><i class="far fa-eye"></i></a>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        function confirmDelte(){
            Swal.fire({
            title: 'estas seguro de eliminar usuario ?',
            text: "Este cambio es permanente!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si eliminar'
            }).then((result) => {
                document.getElementById('formOptions').submit();
                /*
                if (result.isConfirmed) {
                    Swal.fire(
                    'Eliminado',
                    'haz eliminado el usuario',
                    'success'
                    )
                }
                */
            })

        }
    </script>


@endsection