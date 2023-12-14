<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;

class Productodoscontrolador extends Controller
{
    public function index()
    {
        $productos = Producto::all();
        return view('productodos.index', compact('productos'));
    }

    public function show($id){
        $producto=Producto::find($id);

        return view('productodos.show',compact('producto'));
    }
}
