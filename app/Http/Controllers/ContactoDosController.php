<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Contacto;

class ContactoDosController extends Controller
{
    public function store(Request $request){

        Contacto::create($request->all());

        return redirect()->route('index.index')->with('mensaje','Mensaje Enviado');

    }
}
