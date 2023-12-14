@extends('layouts.admin.app')
@section('content')
    <section>
        <div class="login-wrap">
            <div class="">

                <h2>Actualizar producto</h2><br>

                <div class="login-form">
                    <!-- FORMULARIO-->
                    <form action="{{route('producto.update',$producto->id)}}" method="POST" enctype="multipart/form-data" >
                        @csrf
                        @method('PUT')

                        <div class="group">

                            <div class="row">
                                <div class="col">
                                    <label for="name">Nombre del Nuevo Producto</label>
                                    <input required type="text" name="nombre_producto" class="input" value="{{$producto->nombre_producto}}">
                                </div>
                                <div class="col">
                                    <label for="name">Cantidad</label>
                                    <input required id="name" type="text" name="cantidad" class="input" value="{{$producto->cantidad}}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Talla</label>
                                    <select required name="talla_id" id="" class="input">
                                        <option value="{{$producto->talla_id}}">{{$producto->Talla->talla}}</option>
                                        @foreach($tallas as $talla)
                                            <option value="{{$talla->id}}">{{$talla->talla}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="name">Color</label><br>
                                    <input required type="color" name="color" value="{{$producto->color}}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Materiales</label>
                                    <select required name="material_id" id="" class="input">
                                        <option value="{{$producto->material_id}}">{{$producto->Material->material}}</option>
                                        @foreach($materiales as $material)
                                            <option value="{{$material->id}}">{{$material->material}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="name">Categoria</label>
                                    <select required name="categoria_id" id="" class="input">
                                        <option value="{{$producto->categoria_id}}">{{$producto->Categoria->Nombre}}</option>
                                        @foreach($categorias as $categoria)
                                            <option value="{{$categoria->id}}">{{$categoria->Nombre}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="name">Clasificación</label>
                                    <select required name="clasificacion_id" id="" class="input">
                                        <option value="{{$producto->clasificacion_id}}">{{$producto->Clasificacion->Nombre}}</option>
                                        @foreach($clasificaciones as $clasificacion)
                                            <option value="{{$clasificacion->id}}">{{$clasificacion->Nombre}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="name">Precio</label>
                                    <input required type="text" name="valor" id="name" class="input" value="{{$producto->valor}}">
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col">
                                    <label for="name">Imagén del Producto</label>
                                    <img src="{{asset('storage').'/'. $producto->imagen}}"  alt="{{$producto->nombre_producto}}" width="100px" height="70px">
                                    <input type="file" name="imagen" id="" class="input"  class="form-control">
                                </div>
                                <div class="col">
                                </div>
                            </div>

                            <br>
                            <div class="row">
                                <div class="col">
                                    <input type="submit" class="button" value="Guardar cambios">
                                </div>
                                <div class="col">
                                    <a class="button text-center" type="submit"  href="{{route('producto.index')}}">Cancelar</a>
                                </div>
                            </div>
                    </form>

                </div>
            </div>
        </div>
        </div>
    </section>

@endsection

