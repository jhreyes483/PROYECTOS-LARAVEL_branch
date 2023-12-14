<?php

namespace App\Http\Controllers;

use App\Models\Genero;
use Illuminate\Http\Request;

class GeneroController extends Controller
{
    public function index()
    {
        $generos=genero::all();
        return view('genero.index',compact('generos'));
    }
    public function create(){
        return view('genero.create');
    }
    public function store(Request $request){
        $genero=genero::create($request->all());
        return redirect()->route('genero.index')
        ->with('mensaje','Creado Correctamente');
    }
    public function show($id){
        $genero=genero::find($id);
        return view('genero.show',compact('genero'));
    }
    public function edit($id){
        $genero=genero::find($id);
        return view('genero.edit',compact('genero'));
    }

    public function update(Request  $request, $id){
        $genero=genero::find($id)->update($request->all());
        return redirect()->route('genero.show',$id);

    }
    public function destroy($id){
        $genero=genero::find($id)->delete();
        return redirect()->route('genero.index')
        ->with('mensaje','Eliminado Correctamente');;
    }
}
