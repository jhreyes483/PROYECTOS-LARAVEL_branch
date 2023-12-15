<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Usuario;

use App\Models\Producto;

class Carrito extends Model
{
    use HasFactory;

    protected $fillable = [
        'usuario_id','producto_id','cantidades'];

    public function usuario(){

        return $this->belongsTo(Usuario::class,'usuario_id');
    }

    public function producto(){
        return $this->belongsTo(Producto::class,'producto_id');
    }

    
}
