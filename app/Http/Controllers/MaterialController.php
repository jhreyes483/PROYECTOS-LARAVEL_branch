<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Material;

class MaterialController extends Controller
{
    
    public function index(){

        $materiales = Material::all();

        return view('material.index', compact('materiales'));
   
    }

    public function create(){

      return view('material.create');
   
    }

    public function store(Request $request){

        Material::create($request->all());

        return redirect()->route('material.index')
        ->with('mensaje','Creado Correctamente');


    }

    public function show($id){

      $materiales = Material::find($id)
        ->where('id', '=', $id)
        ->get();

        return view('material.show', compact('materiales'));

    }

    public function edit($id){

        $materiales = Material::find($id)
          ->where('id', '=', $id)
          ->get();
  
          return view('material.edit', compact('materiales'));
  
      }

      public function update(Request $request, $id){

        Material::find($id)->update($request->all());


        return redirect()->route('material.show', $id);


      }

      public function destroy($id){

        Material::find($id)->delete();

        return redirect()->route('material.index')
        ->with('mensaje','Eliminado Correctamente');
      }
}
