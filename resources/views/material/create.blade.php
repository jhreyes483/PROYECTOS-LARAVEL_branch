@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Registrar material</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('material.store')}}" method="POST" >
                        @csrf
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre material</label>
                                    <input required type="text" name="material" class="input">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear material">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>

        </div>
    </section>
@endsection


