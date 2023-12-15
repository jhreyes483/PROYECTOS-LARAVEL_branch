<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;



class CategoriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categorias')->insert([
            'Nombre' => 'Pantalón'
        ]);

        DB::table('categorias')->insert([
            'Nombre' => 'Camisas'
        ]);

        DB::table('categorias')->insert([
            'Nombre' => 'Camisetas'
        ]);

        DB::table('categorias')->insert([
            'Nombre' => 'Corbatas'
        ]);

        DB::table('categorias')->insert([
            'Nombre' => 'Unisex'
        ]);
        DB::table('categorias')->insert([
            'Nombre' => 'Chaquetas'
        ]);
    }
}
