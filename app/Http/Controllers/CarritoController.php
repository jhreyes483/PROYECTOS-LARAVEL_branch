<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Usuario;

use App\Models\Producto;

use App\Models\Carrito;

class CarritoController extends Controller

{

 


    public function store(Request $request){
       

      /*  $carrito = Carrito::where('usuario_id',$request->usuario_id)
        ->where('producto_id',$request->producto_id)
        ->where('cantidades',$request->cantidades)
        ->get();

        

        if(count($carrito) > 0){

             $cantidades = $request->cantidades + 1;

            Carrito::find($carrito->id)->update([
                "usuario_id" => $request->usuario_id,
                "producto_id" => $request->producto_id,
                "cantidades" => $cantidades 
            ]);

            $usuario3 = Usuario::select('id','email')->where('id',$request->usuario_id)->first();
  
  
            return redirect()->route('productodos.index')->with('correo',$usuario3->email)
            ->with('id',$usuario3->id)->with('mensaje','Producto insertado en el carrito');
        }

        else {
    
    */

        Carrito::insert(["usuario_id" => $request->usuario_id,
        "producto_id" => $request->producto_id,
        "cantidades" => $request->cantidades
    ]);


    $usuario3 = Usuario::select('id','email')->where('id',$request->usuario_id)->first();

    $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();
  
  
    return redirect()->route('productodos.index')->with('correo',$usuario3->email)
    ->with('id',$usuario3->id)->with('mensaje','Producto insertado en el carrito')
    ->with('carrito',$cantidades);
        
        

    }


    public function show($id){

       $carritos =  Carrito::where('usuario_id',$id)->get();

        return view('carrito.show',compact('carritos'));
    }
    
    public function destroy(Request $request,$id){

        Carrito::find($id)->where('id',$id)->delete();

        $usuario3 = Usuario::select('id','email')->where('id',$request->usuario_id)->first();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        return redirect()->route('carrito.show',$usuario3->id)->with('correo',$usuario3->email)
        ->with('id',$usuario3->id)->with('mensaje','Producto eliminado del carrito')
        ->with('carrito',$cantidades);;
    }
}
