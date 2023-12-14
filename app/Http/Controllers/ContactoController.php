<?php

namespace App\Http\Controllers;

use App\Models\Contacto;
use Illuminate\Http\Request;

class ContactoController extends Controller
{
    public function index()
    {
        $contactos=contacto::all();
        return view('contacto.index',compact('contactos'));
    }
    public function create(){
        return view('contacto.create');
    }
    public function store(Request $request){
        $contacto=contacto::create($request->all());
        return redirect()->route('contacto.index')
            ->with('mensaje','Creado Correctamente');
    }
    public function show($id){
        $contacto=contacto::find($id);
        return view('contacto.show',compact('contacto'));
    }

    public function destroy($id){
        $contacto=contacto::find($id)->delete();
        return redirect()->route('contacto.index')
            ->with('mensaje','Eliminado Correctamente');;
    }
}
