<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;

class RolSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('rol')->insert([
        'Nombre_Rol' => 'Usuario'
        ]);

        DB::table('rol')->insert([
            'Nombre_Rol' => 'Administrador'
            ]);
    }
}
