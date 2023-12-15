<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Categoria;

class CategoriaController extends Controller
{
    
    public function index(){
        $categorias = Categoria::all();
        return view('categoria.index',compact('categorias'));
    }

    public function create(){
        return view('categoria.create');
    }

    public function store(Request $request){
        Categoria::create($request->all());
        return redirect()->route('categoria.index')
        ->with('mensaje','Creado Correctamente');
    }

    public function show($id){
        $categorias = Categoria::find($id)
        ->where('id', '=', $id)
        ->get();
        return view('categoria.show', compact('categorias'));
    }


    public function edit($id){
        $categorias = Categoria::find($id)
        ->where('id', '=', $id)
        ->get();
        return view('categoria.edit', compact('categorias'));

    }

    public function update(Request $request,$id){
        Categoria::find($id)->update($request->all());
        return redirect()->route('categoria.show', $id);

    }


    public function destroy($id){
        Categoria::find($id)->delete();
        return redirect()->route('categoria.index')
        ->with('mensaje','Eliminado Correctamente');
    }

}
