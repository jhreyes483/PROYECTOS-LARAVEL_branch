<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\HeadInvoice;
use App\Models\BodyInvoice;
use App\Models\PaymentType;
use App\Models\Product;
use App\Models\WareHouse;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function index(){

        $headinvoices = HeadInvoice::all();
        return view('invoices.index', compact('headinvoices'));
    }
    public function create(){

        $max = HeadInvoice::maxinvoice();
        $customers = Customer::all();
        $paymentype = PaymentType::all();
        $products  = Product::where('StatusProduct','1')->get(); //Solo productos activos
        $warehouses = WareHouse::where('StatusWareHouse','1')->get(); //Solo bodegas activas
        return view('invoices.create', compact('max', 'products', 'warehouses', 'customers', 'paymentype' ));
    }
    public function store(Request $request){
        BodyInvoice::storeInvoice($request);
    }
    public function edit($id){

        //return view('invoices.edit', compact('invoices'));
    }
    public function update(Request $request, $id){

    }
    public function show($id){
        $hi = HeadInvoice::find($id);
        $bi = BodyInvoice::get();//::where('FKRmtInvoice',' = ',2)->get();
        $bi = $bi->where('FKRmtInvoice',' = ',$hi->RmtInvoice);
        $c = Customer::find($hi->FKIdCustomer);
        $mp = PaymentType::find($hi->FKIdPaymentType);
        return view('invoices.show', compact('hi', 'bi', 'c', 'mp'));
    }
}
