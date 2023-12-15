<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ficha extends Model
{
    use HasFactory;

    protected $table='ficha';
    protected $primaryKey='id_ficha';
    protected $fillable =[
        'No_ficha',
        'descrip',
        'estado',
        'FK_jornada',
        'FK_prog',
    ];



    /********new relations  */
    public function instructores(){
        // relacion de muchos a muchos tabla intermedia instructor_ficha
        return $this->belongsToMany(Instructor::class, 'instructor_ficha',  'FK_instructor', 'FK_ficha');
    }
    
    public function programa(){
        // Relacion de uno a muchos inversa (muchos a uno)
        return $this->belongsTo(Programa::class, 'FK_prog','id_prog');
    }

    public function jornada(){
        // Relacion de uno a muchos inversa (muchos a uno)
        return $this->belongsTo(Jornada::class, 'FK_jornada', 'id');
    }

    public function aprendices(){
        // Relacion de uno a muchos
        return $this->hasMany(Aprendiz::class, 'FK_ficha', 'id_ficha');
    }





}
#
