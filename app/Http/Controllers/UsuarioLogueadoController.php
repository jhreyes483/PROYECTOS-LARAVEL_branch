<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Usuario;

use App\Models\Tipo_Documento;

use App\Models\Genero;

use App\Models\Producto;

use App\Models\Carrito;

use App\Models\Contacto;

class UsuarioLogueadoController extends Controller
{
    public function index(Request $request){

        $usuario3 = Usuario::select('id','nombres','telefono')->where('email',$request->email)->first();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();



        return redirect()->route('index.index')->with('correo',$request->email)
        ->with('id',$usuario3->id)->with('carrito',$cantidades)
        ->with('nombres',$usuario3->nombres)->with('telefono',$usuario3->telefono);
    }

    public function store(Request $request){
        
        $usuario3 = Usuario::select('id')->where('email',$request->email)->first();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        return redirect()->route('usuariologueado.edit',$usuario3->id)->with('correo',$request->email)
        ->with('id',$usuario3->id)->with('carrito',$cantidades);

    }

    public function edit($id){

        $usuarios=Usuario::find($id)
        ->where('id', '=', $id)
        ->get();

        $tipo_documentos= Tipo_Documento::all();

        $generos= Genero::all();

        return view('usuariologueado.edit',compact('usuarios','tipo_documentos'))->with(compact('generos'));

    }

    public function update(Request $request,$id){

        Usuario::find($id)->update($request->all());

        $usuario3 = Usuario::select('id','nombres','telefono')->where('email',$request->email)->first();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        return redirect()->route('index.index')->with('correo',$request->email)
        ->with('id',$usuario3->id)->with('mensaje','Actualizado Correctamente')->with('carrito',$cantidades)
        ->with('nombres',$usuario3->nombres)->with('telefono',$usuario3->telefono);
    }


    public function productos(Request $request){

      $usuario3 = Usuario::select('id')->where('email',$request->email)->first();

        $productos = Producto::all();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        return redirect()->route('productodos.index')->with('correo',$request->email)
        ->with('id',$usuario3->id)->with('carrito',$cantidades);

    }

    
    public function producto(Request $request,$id){

        $usuario3 = Usuario::select('id')->where('email',$request->email)->first();
  
        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();
    
  
          return redirect()->route('productodos.show',$id)->with('correo',$request->email)
          ->with('id',$usuario3->id)->with('carrito',$cantidades);
  
      }

      public function carrito(Request $request,$id){

        $usuario3 = Usuario::select('id')->where('email',$request->email)->first();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        return redirect()->route('carrito.show',$id)->with('correo',$request->email)
        ->with('id',$usuario3->id)->with('carrito',$cantidades);
  
      }

      public function contacto(Request $request){

        Contacto::create($request->all());

        $usuario3 = Usuario::select('id','nombres','telefono')->where('email',$request->correo)->first();

        $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        return redirect()->route('index.index')->with('correo',$request->correo)
        ->with('id',$usuario3->id)->with('carrito',$cantidades)
        ->with('nombres',$usuario3->nombres)->with('telefono',$usuario3->telefono)
        ->with('mensaje','Mensaje Enviado');

      }


}
