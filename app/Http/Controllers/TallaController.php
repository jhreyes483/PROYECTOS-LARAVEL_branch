<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Talla;


class TallaController extends Controller
{
    public function index()
    {
        $tallas=Talla::all();
        return view('talla.index',compact('tallas'));
    }
    public function create(){
        return view('talla.create');
    }
    public function store(Request $request){
        $talla=Talla::create($request->all());
        return redirect()->route('talla.index')
        ->with('mensaje','Creado Correctamente');
    }
    public function show($id){
        $tallas=Talla::find($id);
        return view('talla.show',compact('tallas'));
    }
    public function edit($id){
        $tallas=Talla::find($id);
        return view('talla.edit',compact('tallas'));
    }

    public function update(Request  $request, $id){
        $talla=Talla::find($id)->update($request->all());
        return redirect()->route('talla.show',$id);

    }
    public function destroy($id){
        $talla=Talla::find($id)->delete();
        return redirect()->route('talla.index')
        ->with('mensaje','Eliminado Correctamente');
    }
}
