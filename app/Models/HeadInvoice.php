<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;

class HeadInvoice extends Model
{
    use SoftDeletes;
    use HasFactory;
    protected $table='HeadInvoices';
    protected $primaryKey='RmtInvoice';
    protected $fillable=[
        'NumberInvoice', 'DateInvoice', 'TotalIva', 'Subtotal', 'TotalPrice', 'Status'
    ];
        //Factura
        public function customer()
        {
            return $this->belongsTo('App\Models\Customer','FKIdCustomer','IdCustomer');
        }

        public function paymenttype()
        {
            return $this->belongsTo('App\Models\PaymentType','FKIdPaymentType','IdPaymentType');
        }

        //facturadetalle

        /*public static function queryA($id = 1){
        $bi = BodyInvoice::find($id);
        $hi = HeadInvoice::find($bi->FKRmtInvoice);
        $p = Product::find($bi->FKIdProduct);
        $w = WareHouse::find($bi->FKIdWareHouse);

        return response()->json([
            'head_invoice' => $hi,
            'body_invoice' => $bi,
            'product' => $p,
            'warehouse' => $w
        ]);*/

        public static function invoiceDetail($id)
        {
            $hi = HeadInvoice::find($id);
            $bi = BodyInvoice::get();//::where('FKRmtInvoice',' = ',2)->get();
            $bi = $bi->where('FKRmtInvoice',' = ',$hi->RmtInvoice);
            $p = Product::find($bi->FKIdProduct);
            $c = Customer::find($hi->FKIdCustomer);
            $mp = PaymentType::find($hi->FKIdPaymentType);


            return response()->json([
                'head_invoice' => $hi,
                'body_invoice' => $bi,
                'customer' => $c,
                'paymment' => $mp,
                'products' => $p
            ]);

        }
    public static function maxinvoice(){
        $max = HeadInvoice::max('RmtInvoice');
        return $max + 1;
    }

    public static function storeInvoice(Request $request){
        try{
            DB::beginTransaction();

            $maxrmt = HeadInvoice::maxinvoice();
            $Head = HeadInvoice::create([
                "RmtInvoice" => $maxrmt,
                "NumberInvoice" => $request->NumberInvoice,
                "FKIdCustomer" => $request->FKIdCustomer,
                "FKIdPaymentType" => $request->FKIdPaymentType,//
                "TotalIva" => $request->TotalIva,
                "Subtotal" => $request->Subtotal,
                "TotalPrice" => HeadInvoice::TotalPrice($request["FKIdProduct"], $request["QuaInvoice"]) + $request->TotalIva,
                "FKIdUser" => Auth::user()->getAuthIdentifier()
            ]);


            // GUARDAMOS EL CUERPO RECORRIENDO EL DETALLE DE LA TABLA POR MEDIO DE LOS ARRAYS QUE LLEGAN POR EL REQUEST
            foreach($request["FKIdProduct"]as $key => $value){
                $Body = BodyInvoice::create([
                    "NroReg" => $key+1,
                    "FKRmtInvoice" => $Head->RmtInvoice,
                    "PriceUnit" => HeadInvoice::getprice($request["FKIdProduct"][$key]),
                    "QuaInvoice" => $request["QuaInvoice"][$key],
                    "Subtotal" => HeadInvoice::getprice($request["FKIdProduct"][$key]) * $request["QuaInvoice"][$key],
                    "FKIdWareHouse" => $request["WareHouses"][$key],
                    "FKIdProduct" => $request["FKIdProduct"][$key],
                    "FKIdUser" => Auth::user()->IdUser
                ]);

                $stockact = Stock::where("FKIdProduct",$Body->FKIdProduct)
                    ->where("FKIdWareHouse", $Body->FKIdWareHouse)->first();

                if($stockact){
                    $update = Stock::where("FKIdProduct",$Body->FKIdProduct)
                        ->where("FKIdWareHouse", $Body->FKIdWareHouse)->first()->update(["CanStock" => $stockact->CanStock - $request["QuaInvoice"][$key]]);
                }else{
                    //return "en el insert";
                    $stock = Stock::create([
                        "CanStock" => $request["QuaInvoice"][$key],
                        "FKIdProduct" => $request["FKIdProduct"][$key],
                        "FKIdWareHouse" => $request["WareHouses"][$key]
                    ]);
                }
            }
            DB::commit();
            return redirect()->route('invoices.index')->with([
                'response' => 'Se ha creado la factura '.$Head->NumberInvoice. ' correctamente',
                'status' => 'success',
                'icon' => 'check-all'//alert-outline
            ]);
        } catch (\Exception $e){
            DB::rollBack();
            return redirect()->route('invoices.index')->with([
                'response' => 'Error: '.$e->getMessage(),
                'status' => 'Danger',
                'icon' => 'alert-outline'//check-all
            ]);
        }
    }
    public static function getprice($product){
        $product = Product::find($product);
        if($product){
            return $product->Price;
        }else{
            return 0;
        }
    }
    public static function getCustomer($customer){
        $customer = Customer::find($customer);
        if($customer){
            return $customer->mail;
        }else{
            return " ";
        }
    }
    public static function TotalPrice($products, $Quantities){
        $precio = 0;
        foreach ($products as $key => $value) {
            $producto = Product::find($value);
            $precio += ($producto->Price * $Quantities[$key]);
        }
        return $precio;
    }

}
