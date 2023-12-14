<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Tipo_Documento extends Model
{
    use HasFactory;


    protected $primaryKey = 'id';

    protected $table = 'tipo_documentos';

    protected $fillable = [

        'Nombre_Tipo_Documento','Siglas'
    ];

    public function usuarios(){

        return $this->hasMany(Usuario::class,'id');
    }
}
