@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actualizar talla</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('talla.update',$tallas->id)}}" method="POST">
                        @csrf
                        @method('PUT')
                        
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre de talla</label>
                                    <input type="text" name="talla" class="input" value="{{$tallas->talla}}">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Actualizar talla">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>

        </div>
    </section>
@endsection



