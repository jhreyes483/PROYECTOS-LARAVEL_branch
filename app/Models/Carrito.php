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

        return $this->belongsTo(Usuario::class,'usuario_id'); // Relacion de uno a muchos inversa (muchos a uno)
    }

    public function producto(){
        return $this->belongsTo(Producto::class,'producto_id'); // Relacion de uno a muchos inversa (muchos a uno)
    }

    
}
