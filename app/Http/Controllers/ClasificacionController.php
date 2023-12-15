<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Clasificacion;

class ClasificacionController extends Controller
{
    
    public function index(){

        $clasificaciones = Clasificacion::all();

        return view('clasificacion.index', compact('clasificaciones'));
    }

    public function create(){

        return view('clasificacion.create');
    }

    public function store(Request $request){

        Clasificacion::create($request->all());

        return redirect()->route('clasificacion.index')
        ->with('mensaje','Creado Correctamente');
    }

    public function show($id){

        $clasificaciones = Clasificacion::find($id)
        ->where('id', '=', $id)
        ->get();

        return view('clasificacion.show',compact('clasificaciones'));
    }

    public function edit($id){

        $clasificaciones = Clasificacion::find($id)
        ->where('id', '=', $id)
        ->get();

        return view('clasificacion.edit',compact('clasificaciones'));

    }

    public function update(Request $request, $id){

        Clasificacion::find($id)->update($request->all());

        return redirect()->route('clasificacion.show',$id);
    }

    public function destroy($id) {

        Clasificacion::find($id)->delete();

        return redirect()->route('clasificacion.index')
        ->with('mensaje','Eliminado Correctamente');
    }
}
