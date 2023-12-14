<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Clasificacion;
use App\Models\Material;
use App\Models\Producto;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;


use App\Models\Talla;


class ProductoController extends Controller
{
  /*  function __construct()
    {
        $this->middleware('permission:product-list|product-create|product-edit|product-delete', ['only' => ['index','show']]);
        $this->middleware('permission:product-create', ['only' => ['create','store']]);
        $this->middleware('permission:product-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:product-delete', ['only' => ['destroy']]);
    }*/

    public function index(Request $request)
    {
        $productos=Producto::when($request->name_product,function($q) use ($request){
              $q->where('nombre_producto','LIKE','%'.$request->name_product.'%');
        })->get();



     return view('producto.index',compact('productos'));

    }


   public function create(){

   $tallas = Talla::all();

   $materiales = Material::all();

   $categorias = Categoria::all();

  $clasificaciones = Clasificacion::all();

    return view('producto.create',compact('tallas'))
    ->with(compact('materiales','categorias'))
    ->with(compact('clasificaciones'));

  }



    public function store(Request $request){

        $datos =  $request->except('_token');

        if($request->hasFile('imagen')){

        $datos['imagen'] = $request->file('imagen')->store('imagenes','public');

        }
          Producto::insert($datos);
          return redirect()->route('producto.index')
          ->with('mensaje','Creado Correctamente');

    }


    public function show($id){
        $producto=Producto::find($id);

        return view('producto.show',compact('producto'));
    }

    public function edit($id){
        $producto=Producto::find($id);

        $tallas = Talla::all();

        $materiales = Material::all();

        $categorias = Categoria::all();

       $clasificaciones = Clasificacion::all();

        return view('producto.edit',compact('producto','tallas'))
        ->with(compact('materiales','categorias'))
        ->with(compact('clasificaciones'));
    }

    public function update(Request  $request, $id){


        $datos = $request->except(['_token','_method']);

        if($request->hasFile('imagen')){

            $producto = Producto::findOrFail($id);

            Storage::delete('public/'.$producto->imagen);

            $datos['imagen'] = $request->file('imagen')->store('imagenes','public');

            }


        Producto::find($id)->where('id','=', $id)->update($datos);

        $producto = Producto::findOrFail($id);


        return redirect()->route('producto.show',$id);





    }
    public function destroy($id){
        $producto=Producto::find($id)->delete();
        return redirect()->route('producto.index')
        ->with('mensaje','Eliminado Correctamente');
    }
}
