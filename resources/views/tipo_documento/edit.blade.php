

@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actualizar Tipo de Documento</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    @foreach($tipo_documentos as $tipo_documento)
                        <form action="{{route('tipo_documento.update',$tipo_documento->id)}}" method="post">
                            @csrf
                            @method('PUT')
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre del tipo de documneto</label>
                                    <input type="text" name="Nombre_Tipo_Documento" class="input" value="{{$tipo_documento->Nombre_Tipo_Documento}}">
                                </div>
                                <div class="col">
                                    <label for="name">Siglas</label>
                                    <input type="text" name="Siglas"  class="input" value="{{$tipo_documento->Siglas}}">
                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Actualizar Tipo de Documento">
                            </div>
                            <br>
                    </form>
                    @endforeach
                </div>
            </div>
        </div>
        </div>
    </section>


@endsection
