@extends('layouts.admin.app')
@section('content')

    <section>
        <div class="login-wrap">
            <div class="login-html">

                <label for="tab-2" class="tab">Actualizar material</label>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    @foreach($materiales as $material)
                    <form action="{{route('material.update', $material->id)}}" method="post">
                        @csrf
                        @method('PUT')
                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre material</label>
                                    <input type="text" name="material" class="input" value="{{$material->material}}">
                                </div>
                                <div class="col">

                                </div>
                            </div>

                            <br>
                            <div class="group">
                                <input type="submit" class="button" value="Actualizar material">
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


