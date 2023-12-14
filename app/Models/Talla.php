<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Talla extends Model
{
    use HasFactory;
    protected $primaryKey = 'id';
    protected $table = 'tallas';
    protected $fillable = ['talla'];

    public function productos(){
        return $this->hasMany(Producto::class,'id');
    }
}