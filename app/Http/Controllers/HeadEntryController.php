<?php

namespace App\Http\Controllers;

use App\Models\HeadEntry;
use App\Models\Provider;
use App\Models\Product;
use App\Models\WareHouse;
use Illuminate\Http\Request;
use function PHPUnit\Framework\returnArgument;

class HeadEntryController extends Controller
{
    public function index(){
        $entries = HeadEntry::all();
        return view('entries.index',compact('entries'));
    }

    public function create(){
        $max = HeadEntry::maxentry();
        $providers = Provider::where('StatusProvider','1')->get(); //Solo proveedores activos
        $products  = Product::where('StatusProduct','1')->get(); //Solo productos activos
        $warehouses = WareHouse::where('StatusWareHouse','1')->get();
        return view('entries.create',compact('max','providers','products','warehouses'));

    }
    public function store(Request $request){
        HeadEntry::storeEntry($request);
        return redirect()->route('entries.index')->with([
            'response' => 'Se ha creado la entrada '.$request->RmtEntry. ' correctamente',
            'status' => 'success',
            'icon' => 'check-all'//alert-outline
        ]);
    }
    public function edit($id){

    }
    public function update(Request $request, $id){

    }
    public function show($id){

    }
}
