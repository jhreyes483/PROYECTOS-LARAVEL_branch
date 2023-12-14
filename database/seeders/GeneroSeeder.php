<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;

class GeneroSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('generos')->insert([
            'Nombre_Genero' => 'Masculino'
        ]);

        DB::table('generos')->insert([
            'Nombre_Genero' => 'Femenino'
        ]);
    }
}
