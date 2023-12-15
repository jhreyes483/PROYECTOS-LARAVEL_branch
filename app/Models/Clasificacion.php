<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Clasificacion extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $table = 'clasificaciones';

    protected $fillable = [

        'Nombre'
    ];

    public function productos(){

        return $this->hasMany(Producto::class,'id');
    }
}
