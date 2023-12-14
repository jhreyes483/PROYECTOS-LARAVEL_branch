<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Stock extends Model
{
    use SoftDeletes;
    use HasFactory;
    protected $table='Stock';
    protected $primaryKey='IdStock';
    protected $fillable=[
        'CanStock','FKIdProduct','FKIdWareHouse'
    ];
}
