<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;



class ClasificacionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('clasificaciones')->insert([
            'Nombre' => 'Hombres'
        ]);

        DB::table('clasificaciones')->insert([
            'Nombre' => 'Mujeres'
        ]);
        DB::table('clasificaciones')->insert([
            'Nombre' => 'Niños'
        ]);
        DB::table('clasificaciones')->insert([
            'Nombre' => 'Unisex'
        ]);
    }
}
