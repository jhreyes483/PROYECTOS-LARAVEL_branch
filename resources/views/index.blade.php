@extends('layouts.landing.app2')


@section('content')




    <header class="masthead" id="inicio">
        <div class="container">

        <!-- Alertas  -->
@if(session('mensaje')=="Actualizado Correctamente")
<div class="alert alert-warning" role="alert">
<i class="fas fa-check-square"></i> {{session('mensaje')}}
<button type="button" class="close" data-dismiss="alert" aria-label="Close" >
<span aria-hidden="true">&times;</span>
</button>
</div>
@else
@endif
            <div class="masthead-heading" style="font-size: 550%" ;>J R Tienda online</div>
            @if(session('correo'))
            <div class="masthead-subheading">Tienda de Ropa Online  {{session('correo')}}   </div>

         @endif

         <a class="btn btn-primary btn text-uppercase" href="#services"> Conocer <i class="fas fa-arrow-circle-down"></i> </a>
        </div>
    </header>

    <!-- Services-->
    <section class="page-section" id="services">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Servicios</h2>
                <h3 class="section-subheading text-muted">Conoce lo que podemos ofrecerte.</h3>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse text-primary "></i>
                        </span>
                    <h4 class="my-3">Lo que buscas</h4>
                    <p class="text-muted">Encuentra todo lo que necesites.</p>
                </div>
                <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-laptop fa-stack-1x fa-inverse text-primary "></i>
                        </span>
                    <h4 class="my-3">Pide a domicilio</h4>
                    <p class="text-muted">Danos tu ubicación.</p>
                </div>
                <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class=" fas fa-lock fa-stack-1x fa-inverse text-primary "></i>
                        </span>
                    <h4 class="my-3">Prendas a la Medida</h4>
                    <p class="text-muted">Chaquetas, Pantalones, Lenceria y mucho mas!..</p>
                </div>
            </div>
        </div>
    </section>





    <!-- Contact-->
    <section class="page-section" id="contact">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Contactanos</h2>

                     <!-- Alertas  -->
@if(session('mensaje')=="Mensaje Enviado")
<div class="alert alert-success" role="alert">
<i class="fas fa-check-square"></i> {{session('mensaje')}}
<button type="button" class="close" data-dismiss="alert" aria-label="Close" >
<span aria-hidden="true">&times;</span>
</button>
</div>
@else
@endif



                <h3 class="section-subheading "  style="color:#cbb911";> Nos interesa saber tu opinion.</h3>
            </div>
            @if(session('correo') && session('id'))
            <form id="contactForm" name="sentMessage" novalidate="novalidate" action="{{route('usuariologueado.contacto')}}" method="POST" >
            @csrf
            <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input class="form-control"  type="text" placeholder="Nombre *"name="nombre" value="{{session('nombres')}}" required />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group">
                            <input class="form-control"  type="email" placeholder="Correo *" name="correo" value="{{session('correo')}}" required />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group mb-md-0">
                            <input class="form-control"  type="tel" placeholder="Telefono *" name="telefono" value="{{session('telefono')}}" required />
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group form-group-textarea mb-md-0">
                            <textarea class="form-control"  placeholder="mensaje *" name="mensaje" required></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <div ></div>
                    <button class="btn btn-primary"  type="submit"><i class="fas fa-paper-plane"></i> ENVIAR</button>
                </div>
            </form>









            @else
            <form id="contactForm" name="sentMessage" novalidate="novalidate" action="{{route('contactodos.store')}}" method="POST" >
            @csrf


                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input class="form-control"  type="text" placeholder="Nombre *"name="nombre" required />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group">
                            <input class="form-control"  type="email" placeholder="Correo *" name="correo" required />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group mb-md-0">
                            <input class="form-control"  type="tel" placeholder="Telefono *" name="telefono" required />
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group form-group-textarea mb-md-0">
                            <textarea class="form-control"  placeholder="mensaje *" name="mensaje"  required></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <div ></div>
                    <button class="btn btn-primary"  type="submit"><i class="fas fa-paper-plane"></i> ENVIAR</button>
                </div>
            </form>
            @endif
        </div>
    </section>

    @endsection
