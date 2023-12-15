<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Talla;

class Producto extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $table = 'productos';

    protected $fillable = [

        'nombre_producto', 'imagen', 'talla_id', 'color', 'material_id', 'categoria_id', 'clasificacion_id',
        'valor', 'cantidad','created_at','updated_at'];

    public function Clasificacion()
    {
        return $this->belongsTo(Clasificacion::class, 'clasificacion_id');
    }

    public function Categoria()
    {

        return $this->belongsTo(Categoria::class, 'categoria_id');
    }

    public function Talla(){

        return $this->belongsTo(Talla::class,'talla_id');
    }

    public function Material(){

        return $this->belongsTo(Material::class,'material_id');
    }

    public function carrito(){
        return $this->hasMany(Carrito::class,'id');
    }
}
