@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Registrar categoria</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('categoria.store')}}" method="POST" >
                        @csrf
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre de la categoria</label>
                                    <input required type="text" name="Nombre" class="input">
                                </div>
                                <div class="col">
<!-- Col-->
                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear categoria">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>

        </div>
    </section>
@endsection

