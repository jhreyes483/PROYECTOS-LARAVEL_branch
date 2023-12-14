<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;



class Usuario extends Authenticatable
{

    use HasFactory,Notifiable;

    protected $primaryKey = 'id';
    protected $table = 'usuarios';
    protected $fillable = [

'tipo_documento_id','numero_documento','nombres','apellidos','genero_id','fecha_nacimiento','email',
'password','direccion','telefono','rol_id'];

public function tipo_documento(){
    return $this->belongsTo(Tipo_Documento::class,'tipo_documento_id');
}
public function genero(){
    return $this->belongsTo(Genero::class,'genero_id');
}
public function rol(){
    return $this->belongsTo(rol::class,'rol_id');
}

public function carritos(){
    return $this->hasMany(Carrito::class,'id');
}



}
