<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Genero extends Model
{
    use HasFactory;
    protected $table='generos';
    protected $primaryKey='id';
    protected $fillable=[
        'Nombre_Genero'
    ];

    public function generos(){

        return $this->hasMany(Usuario::class,'id');
    }
}
