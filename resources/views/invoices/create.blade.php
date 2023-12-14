@extends('layouts.admin.app')

@section('content')
    <form action="{{ route('invoices.store') }}" method="POST">
        @csrf
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                @if(session('status'))
                    <div class="alert alert-{{ session('status') }}" role="alert">
                        <i class="mdi mdi-{{ session('icon') }} me-2"></i>
                        {{ session('response') }}
                    </div>
                @endif
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <b><h3 class="mb-sm-0">Factura Detalle</h3></b>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="invoice-title">
                            <div class="row mb-4 float-end">
                                <label for="horizontal-firstname-input" class="col-sm-6 col-form-label float-end"><h4>Número de Factura: </h4></label><br>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control float-end" id="horizontal-firstname-input">
                                </div>
                            </div>
                            <div class="mb-4">
                                <img src="{{ url('images/logo4.PNG') }}" alt="logo" height="50">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4">
                                <address>
                                            <label for="FKIdCustomer" class="col-sm-3 col-form-label"><strong><b>Cliente: *</b></strong></label>
                                            <select id="FKIdCustomer" class="form-select" name="FKIdCustomer" required onchange="colocar_correo(), colocar_direccion()">
                                                <option selected="" disabled>Seleccionar...</option>
                                                @foreach($customers as $data)
                                                    <option correo="{{$data->mail}}" direccion="{{$data->Address}}" value="{{$data->IdCustomer}}">{{$data->FirstNameCustomer}} {{$data->SecondNameCustomer}} {{$data->LastNameCustomer}} {{$data->SecondLastNameCustomer}} </option>
                                                @endforeach
                                            </select><br>
                                    <div class="col-sm-12">
                                        <br><label for="correo" class="form-label">Correo</label>
                                        <input id="correo" name="correo" type="text" class="form-control" disabled required min="1">
                                    </div><br>
                                    <div class="col-sm-12">
                                        <label for="direccion" class="form-label">Dirección: </label>
                                        <input id="direccion" name="direccion" type="text" class="form-control" disabled required min="1">
                                    </div>
                                </address>
                            </div>
                            <div class="col-sm-2 mt-2 text-sm-start"></div>
                            <div class="col-sm-4 mt-2 text-sm-end"></div>
                            <div class="col-sm-2 mt-2 text-sm-end">
                                <address>
                                    <label for="CreationDate" class="form-label"><strong><b>Fecha Factura: *</b></strong></label>
                                    <input type="date" id="CreationDate" name="CreationDate" class="form-control">
                                </address>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 mt-3">
                                <address>

                                        <label for="FKIdProvider" class="col-sm-6 col-form-label"><strong><b>Método de Pago: *</b></strong></label>
                                        <select id="FKIdProvider" class="form-select" name="FKIdProvider" required>
                                        <option selected="" disabled>Seleccionar...</option>
                                            @foreach($paymentype as $data)
                                                <option value="{{$data->IdPaymentType}}">{{$data->NamePayment}}</option>
                                            @endforeach
                                        </select><br>
                                    <br>
                                </address>
                            </div>
                            <div class="col-sm-3 mt-3 text-sm-start"></div>
                        </div>
                        <div class="py-2 mt-3">
                            <h2 class="font-size-15 fw-bold">Detalle</h2>
                        </div>
                        <div class="row mb-4">
                            <div class="col-sm-4">
                                <label for="FKIdProduct" class="form-label">Producto *</label>
                                <select id="FKIdProduct" class="form-select" name="FKIdProduct" required  onchange="colocar_precio()">
                                    <option selected="" disabled>Seleccionar...</option>
                                    @foreach($products as $data)
                                        <option iva="{{ $data->PorIva }}" precio="{{ $data->Price }}" refer="{{ $data->Reference }}" namepro="{{ $data->NameProduct }}" value="{{$data->IdProduct}}">{{ $data->Reference }} | {{$data->NameProduct}} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-sm-1">
                                <label for="QuaInvoice" class="form-label">Cantidad *</label>
                                <input id="QuaInvoice" name="QuaInvoice" type="number" class="form-control" required min="1">
                            </div>
                            <div class="col-sm-2">
                                <label for="precio" class="form-label">Precio *</label>
                                <input id="precio" name="precio" type="number" class="form-control" disabled required min="1">
                            </div>
                            <div class="col-sm-3">
                                <label for="FKIdWareHouse" class="form-label">Bodega *</label>
                                <select id="FKIdWareHouse" class="form-select" name="FKIdWareHouse" required>
                                    <option selected="" disabled>Seleccionar...</option>
                                    @foreach($warehouses as $data)
                                        <option nomebod="{{$data->Name}}" value="{{$data->IdWareHouse}}">{{ $data->ReferenceWareHouse }} | {{ $data->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <button onclick="agregar_item()" type="button"
                                        class="form-control btn btn-primary w-md waves-effect waves-light mt-4">Agregar</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-nowrap">
                                <thead>
                                <tr>
                                    <th style="width: 70px;">No.</th>
                                    <th>Producto</th>
                                    <th>Bodega</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>SubTotal</th>
                                    <th>Descuento</th>
                                    <th>Iva</th>
                                    <th class="text-end">Total</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>NroRegi</td>
                                        <td>NameProduct</td>
                                        <td>NameProduct</td>
                                        <td>QuaInvoice</td>
                                        <td>PriceUnit</td>
                                        <td>Subtotal</td>
                                        <td>DiscoUnit</td>
                                        <td>ValIva</td>
                                        <td class="text-end">$TotalItem</td>
                                    </tr>

                                <tr>
                                    <td colspan="7" class="text-end"><h3 class="font-size-13 fw-bold">Sub Total</h3></td>
                                    <td class="text-end">$Subtotal</td>
                                </tr>
                                <tr>
                                    <td colspan="7" class="text-end"><h3 class="font-size-13 fw-bold">Total Iva</h3></td>
                                    <td class="text-end"></td>
                                </tr>
                                <tr>
                                    <td colspan="7" class ="border-0 text-end">
                                        <h2 class="font-size-15 fw-bold"> Total</h2></td>
                                    <td class="border-0 text-end"><h4 class="m-0">$</h4></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="d-print-none">
                            <div class="float-end">
                                <a href="javascript:window.print()" class="btn btn-success waves-effect waves-light me-1"><i class="fa fa-print"></i></a>
                                <a href="javascript: void(0);" class="btn btn-primary w-md waves-effect waves-light">Enviar</a>
                                <a href="{{ route('invoices.index') }}" class="btn btn-warning w-md waves-effect waves-light">Atrás</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->

    </div>
    </form>
@endsection
@section("script")
    <script>
        function colocar_precio() {
            let precio = $("#FKIdProduct option:selected").attr("precio");
            $("#precio").val(precio);
        }
        function colocar_correo() {
            let correo = $("#FKIdCustomer option:selected").attr("correo");
            $("#correo").val(correo);
        }
        function colocar_direccion() {
            let direccion = $("#FKIdCustomer option:selected").attr("direccion");
            $("#direccion").val(direccion);
        }
    </script>
@endsection
