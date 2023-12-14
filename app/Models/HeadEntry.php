<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class HeadEntry extends Model
{
    use SoftDeletes;
    use HasFactory;
    protected $table='HeadEntries';
    protected $primaryKey='RmtEntry';
    protected $fillable=[
        'RmtEntry','CreationDate', 'DescriptionEntry', 'Subtotal', 'CostIVA','TotalCost', 'Status', 'FKIdProvider','FKIdUser'
    ];

    public function provider()
    {
        return $this->belongsTo('App\Models\Provider','FKIdProvider','IdProvider');
    }

    public static function maxentry(){
        $max = HeadEntry::max('RmtEntry');
        return $max + 1;
    }

    public static function storeEntry(Request $request){
        try{
            DB::beginTransaction();

            $maxrmt = HeadEntry::maxentry();
            $Head = HeadEntry::create([
                "RmtEntry" => $maxrmt,
                "CreationDate" => $request->CreationDate,
                "DescriptionEntry" => $request->DescriptionEntry,
                "Subtotal" => $request->Subtotal,
                "CostIVA" => $request->CostIVA,
                "TotalCost" => HeadEntry::TotalPrice($request["FKIdProduct"], $request["QuanEntry"]) + $request->CostIVA,
                "FKIdProvider" => $request->FKIdProvider,
                "FKIdUser" => Auth::user()->getAuthIdentifier()
            ]);


            // GUARDAMOS EL CUERPO RECORRIENDO EL DETALLE DE LA TABLA POR MEDIO DE LOS ARRAYS QUE LLEGAN POR EL REQUEST
            foreach($request["FKIdProduct"]as $key => $value){
                $Body = BodyEntry::create([
                    "NroReg" => $key+1,
                    "FKRmtEntry" => $Head->RmtEntry,
                    "CostUnit" => HeadEntry::getprice($request["FKIdProduct"][$key]),
                    "QuanEntry" => $request["QuanEntry"][$key],
                    "Subtotal" => HeadEntry::getprice($request["FKIdProduct"][$key]) * $request["QuanEntry"][$key],
                    "FKIdWareHouse" => $request["WareHouses"][$key],
                    "FKIdProduct" => $request["FKIdProduct"][$key],
                    "FKIdUser" => Auth::user()->IdUser
                ]);

                $stockact = Stock::where("FKIdProduct",$Body->FKIdProduct)
                    ->where("FKIdWareHouse", $Body->FKIdWareHouse)->first();

                if($stockact){
                   $update = Stock::where("FKIdProduct",$Body->FKIdProduct)
                       ->where("FKIdWareHouse", $Body->FKIdWareHouse)->first()->update(["CanStock" => $stockact->CanStock + $request["QuanEntry"][$key]]);
                }else{
                    //return "en el insert";
                    $stock = Stock::create([
                        "CanStock" => $request["QuanEntry"][$key],
                        "FKIdProduct" => $request["FKIdProduct"][$key],
                        "FKIdWareHouse" => $request["WareHouses"][$key]
                    ]);
                }
            }
            DB::commit();
            return redirect()->route('entries.index')->with([
                'response' => 'Se ha creado la entrada '.$Head->RmtEntry. ' correctamente',
                'status' => 'success',
                'icon' => 'check-all'//alert-outline
            ]);
        } catch (\Exception $e){
            DB::rollBack();
            return redirect()->route('entries.index')->with([
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
    public static function TotalPrice($products, $Quantities){
        $precio = 0;
        foreach ($products as $key => $value) {
            $producto = Product::find($value);
            $precio += ($producto->Price * $Quantities[$key]);
        }
        return $precio;
    }
}
