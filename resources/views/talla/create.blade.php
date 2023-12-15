@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Registrar talla</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('talla.store')}}" method="POST" >
                        @csrf
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre de talla</label>
                                    <input required type="text" name="talla" class="input">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Crear talla">
                            </div>
                            <br>
                    </form>

                </div>
            </div>
        </div>

        </div>
    </section>
@endsection

