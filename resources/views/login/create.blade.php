@extends('layouts.landing.app2')

@section('content')

<table>



@foreach($usuarios as $usuario)

{{$usuario->email}}

@endforeach


</table>
@endsection