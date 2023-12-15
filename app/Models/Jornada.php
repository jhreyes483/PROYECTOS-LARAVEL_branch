<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jornada extends Model
{
    use HasFactory;

    protected $table = 'jornada';
    protected $primaryKey = 'id';
    protected $fillable = [
        'nom_jornada',
    ];

    public function fichas()
    {
        return $this->hasMany(Ficha::class, 'FK_jornada', 'id');
    }

    public function aprendices()
    {
        return $this->hasMany(Aprendiz::class, 'FK_ficha', 'id_ficha');
    }

    public function instructores()
    {
        return $this->hasMany(InstructorFicha::class, 'FK_ficha', 'id_ficha');
    }
}
