<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    use SoftDeletes;
    use HasFactory;
    protected $table='customers';
    protected $primaryKey='IdCustomer';
    protected $fillable=[
        'FirstNameCustomer','SecondNameCustomer', 'LastNameCustomer', 'SecondLastNameCustomer', 'Password', 'mail', 'Address', 'AddressEntry', 'NumberPhone', 'Status'
    ];
}
