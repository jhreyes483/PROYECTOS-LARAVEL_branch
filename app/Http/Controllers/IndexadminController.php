<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IndexadminController extends Controller
{
    public function index(){
        return view('indexadmin');
    }
}
