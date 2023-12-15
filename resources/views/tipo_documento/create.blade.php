
@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Registrar Tipo de Documento</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('tipo_documento.store')}}" method="POST" >
                        @csrf
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre del tipo de documento</label>
                                    <input required type="text" name="Nombre_Tipo_Documento" class="input">
                                </div>
                                <div class="col">
                                    <label for="name">Siglas</label>
                                    <input required type="text" name="Siglas"  class="input">
                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear Tipo de Documento">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>
        </div>
    </section>


@endsection
