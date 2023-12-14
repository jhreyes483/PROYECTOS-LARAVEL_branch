@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actualizar categoria</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    @foreach($categorias as $categoria)
                        <form action="{{route('categoria.update',$categoria->id)}}" method="post">
                            @csrf
                            @method('PUT')
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre de la categoria</label>
                                    <input type="text" name="Nombre" class="input" value="{{$categoria->Nombre}}">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear categoria">
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

