<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function index()
    {
        $customers = Customer::all();
        return view('customers.index', compact('customers'));
    }

    public function create()
    {
        return view('customers.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'FirstName' => 'required|max:20'
        ]);

        $customer = Customer::create($request->all());
        return redirect()->route('customers.index')->with([
            'response' => 'Se ha creado el usuario cliente ' . $request->FirstName,
            'status' => 'success',
            'icon' => 'check-all'//alert-outline
        ]);
    }

    public function edit($id)
    {
        $customers = Customer::find($id);

        return view('customers.edit', compact('customers'));
    }

    public function update(Request $request, $id)
    {
        $customer = Customer::find($id)->update($request->all());
        return redirect()->route('customers.index')->with([
            'response' => 'Se ha actualizado el usuario cliente ' . $request->FirstName,
            'status' => 'warning',
            'icon' => 'alert-outline'//alert-outline
        ]);
    }

    public function show($id)
    {
        $customers = Customer::find($id);
        return view('customers.show', compact('customers'));
    }
}
