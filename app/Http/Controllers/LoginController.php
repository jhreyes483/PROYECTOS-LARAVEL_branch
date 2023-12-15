<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


use App\Models\Usuario;

use App\Models\Carrito;


class LoginController extends Controller
{
    public function login(){
        return view('login.login');
    }


    public function authenticate(Request $request)
    {

        $usuarios2 = Usuario::select('email','password')
        ->from('usuarios')
        ->where('email','=',$request->email)
        ->where('password','=',$request->password)
        ->get();


        if(count($usuarios2) > 0){

            $usuarios2 = Usuario::select('email','password','rol_id')
        ->from('usuarios')
        ->where('email','=',$request->email)
        ->where('password','=',$request->password)
        ->where('rol_id','=',1)
        ->get();

        
       if(count($usuarios2) > 0){

         $usuario3 = Usuario::select('id','nombres','telefono')->where('email',$request->email)->first();

         $cantidades = Carrito::where('usuario_id',$usuario3->id)->count();

        

         return redirect()->route('index.index')->with('correo',$request->email)
         ->with('id',$usuario3->id)->with('carrito',$cantidades)
         ->with('nombres',$usuario3->nombres)->with('telefono',$usuario3->telefono);
       }

       else {

       

          return redirect()->route('index.admin')->with('correo',$request->email);
       }



        }
    
        else {
            return redirect()->route('login.login')->with('mensaje','Correo o Contraseña Incorrecta Compruebe de Nuevo');
        }





       /* $credentials = $request->only('email', 'password');
       if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->route('usuario.index');
        }
            return back()->withErrors([
            'email' => 'El correo no esta Inscrito',
        ]);*/

    }
  /*  public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }*/

  /*  public function __construct(){
        $this ->middleware('auth');
    }*/

   
}
