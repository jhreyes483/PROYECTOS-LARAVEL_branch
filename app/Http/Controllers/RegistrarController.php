<?php

namespace App\Http\Controllers;

use App\Models\Genero;
use App\Models\rol;
use App\Models\Tipo_Documento;
use App\Models\Usuario;
use Illuminate\Http\Request;

class RegistrarController extends Controller
{
    public function create(){

        $tipo_documentos = Tipo_Documento::all();

        $generos = Genero::all();

        $roles = rol::where('id', '=', '1')->get();

        return view('registrar.create',compact('tipo_documentos','generos'))->with(compact('roles'));
    }

    public function store(Request $request){

        $usuario=Usuario::create($request->all());
        return redirect()->route('registrar.create')
            ->with('mensaje','Creado Correctamente');
    }
}
