<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Admin;
use Illuminate\Support\Facades\Auth;
use App\Models\Ficha;
use App\Models\Jornada;
use App\Models\Instructor;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public function form_login()
    {
        return view('modules.auth.form_login');
    }
    public function auth(Request $request)
    {
        $user = Admin::where('email', '=', $request->input('email'))->first();
        if ($user) {
            if ($user->password == $request->input('password')) {
                session(['USER' => $user]);
                return redirect()->route('dashboard.index');
            } else {
                return redirect()->route('login.form_login');
            }
        } else {
            return redirect()->route('login.form_login');
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->flush();

        return redirect()->route('login.form_login');
    }

    public function test()
    {

        /*
      SELECT 
      j.nom_jornada,
      f.No_ficha,
      a.nom1 aprendiz_name,
      j.id jornada_id
      FROM jornada j
      INNER JOIN ficha f ON f.FK_jornada = j.id
      INNER JOIN aprendiz a ON a.FK_ficha = f.id_ficha

      INNER JOIN instructor_ficha imf ON imf.FK_ficha = f.id_ficha
      INNER JOIN instructor i ON i.id_instructor = FK_instructor
      where j.id =1
;
        */


        // $instrunctores = Ficha::with('instructores')->get();
        $jornadaId = 1;
        // $resultados = Jornada::with('fichas.aprendices')->find($jornadaId);
        //DB::enableQueryLog();

        /*************************************** */
        /*
        select 
        * from 
        ficha f
        INNER JOIN jornada j ON f.FK_jornada = j.id 
        where j.id = 1
        */

        $result = Jornada::with('fichas')->find($jornadaId);
        dump(['q1' => $result->toArray()]);
        /****************************************** */
        /*
        SELECT 
        *
        FROM jornada j
        INNER JOIN ficha f ON f.FK_jornada = j.id
        INNER JOIN aprendiz a ON a.FK_ficha = f.id_ficha
        where j.id =1
        */

        $result = Ficha::with('aprendices', 'jornada')
            ->whereIn('id_ficha', [1, 3])
            ->get();
        dump(['q2' => $result->toArray()]);

        /** uso de whereHas */
        $result  = Ficha::with('aprendices', 'jornada')
            ->whereHas('jornada', function ($query) {
                $query->where('id', 1);
            })
            ->get();
        dump(['q3' => $result->toArray()]);


        /** uso de whereHas */
        $result  = Ficha::with('aprendices', 'jornada', 'instructores')
            ->whereHas('jornada', function ($query) {
                $query->where('id', 1);
            })
            ->get();
        dump(['q4' => $result->toArray()]);

        //DB::enableQueryLog();
        $result = Instructor::with('fichas')->where('id_instructor', 3)
            ->get();
        dump(['q5d' => $result->toArray()]);
        //dd(DB::getQueryLog());


        $result = Ficha::with('aprendices')->whereIn('id_ficha', [1, 3])->get();
        dump(['q6' => $result->toArray()]);




        // dd(DB::getQueryLog());


        $resultados = Jornada::with('fichas.aprendices', 'fichas.programa', 'fichas.instructores')
            ->select('nom_jornada', 'id as jornada_id')
            ->find($jornadaId);
        //dd(DB::getQueryLog());

        $resultados  = Jornada::with('fichas.aprendices', 'fichas.programa', 'fichas.instructores')
            ->find($jornadaId);

        // DB::enableQueryLog();
        $resultados = Jornada::with('fichas.aprendices', 'fichas.programa', 'fichas.instructores')
            ->where('id', $jornadaId)
            ->first();
        // dd(DB::getQueryLog());

        dd('test', $resultados->toArray(),);
    }
}
