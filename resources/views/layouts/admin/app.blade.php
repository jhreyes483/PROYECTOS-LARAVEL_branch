<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tienda MT</title>
    <link rel="icon" href="assets/img/logomt.PNG"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="Wide selection of buttons that feature different styles for backgrounds, borders and hover options!">
    <meta name="msapplication-tap-highlight" content="no">
    <link rel="stylesheet" href="{{ url('css/app.css')}}">
  <link rel="stylesheet" href="{{url('css/scroll.css')}}">
    <link rel="stylesheet" href="{{url('css/styles3.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />

</head>

<body>


<div class="app-container fondo body-tabs-shadow fixed-header fixed-sidebar">
    @include('layouts.admin.components.navbar')
    <div class="ui-theme-settings">
        <button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
            <i class="fa fa-cog fa-w-16 fa-spin fa-2x"></i>
        </button>
    </div>
    <div class="app-main">
        @include('layouts.admin.components.sidebar')
        <div class="app-main__outer">
            <div class="app-main__inner">
                <!-- Migas de pan-->
                <div class="app-page-title">
                    <div class="page-title-wrapper">
                </div>
               @yield('content')
            </div>
        @include('layouts.admin.components.footer')
        <!-- footer-->
        </div>
    </div>
</div>
<script src="{{url('js/app.js') }}"></script>
</div>
</body>

</html>
