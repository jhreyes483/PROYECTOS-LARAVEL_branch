<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;

class ContactoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        DB::table('contactos')->insert([
            "nombre" => "Camila",
            "correo" => "camila987@gmail.com",
            "telefono" => "3504987652",
            "mensaje"  =>"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, error."
        ]);
    }
}
