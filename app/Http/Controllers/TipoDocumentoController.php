<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Tipo_Documento;

class TipoDocumentoController extends Controller
{
    public function index(){

    $tipo_documentos =Tipo_Documento::all();

    return view('tipo_documento.index', compact('tipo_documentos'));
  

    }


    public function create(){

        return view('tipo_documento.create');
    }

  public function store(Request $request){

      Tipo_Documento::create($request->all());

      return redirect()->route('tipo_documento.index')
      ->with('mensaje','Creado Correctamente');


  }

  public function show($id){

    $tipo_documentos= Tipo_Documento::find($id)
      ->where('id', '=', $id)
      ->get();

      return view('tipo_documento.show', compact('tipo_documentos'));
}


public function edit($id){

  $tipo_documentos= Tipo_Documento::find($id)
  ->where('id', '=', $id)
  ->get();

      return view('tipo_documento.edit', compact('tipo_documentos'));

}

public function update(Request $request,$id){

Tipo_Documento::find($id)->update($request->all());

return redirect()->route('tipo_documento.show',$id);


}

public function destroy($id){

Tipo_Documento::find($id)->delete();

return redirect()->route('tipo_documento.index')
->with('mensaje','Eliminado Correctamente');


}



}





