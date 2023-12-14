<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;



class MaterialSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('materiales')->insert([
            'material' => 'Antifluido'
        ]);

        DB::table('materiales')->insert([
            'material' => 'Lana'
        ]);

        DB::table('materiales')->insert([
            'material' => 'Algodón'
        ]);

        DB::table('materiales')->insert([
            'material' => 'Cuero'
        ]);
    }
}
