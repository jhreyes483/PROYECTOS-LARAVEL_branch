<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;

class Tipo_DocumentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_documentos')->insert([
            'Nombre_Tipo_Documento' => 'Cédula de Ciudadanía',
            'Siglas' => 'CC'
        ]);

        DB::table('tipo_documentos')->insert([
            'Nombre_Tipo_Documento' => 'Tarjeta de Ciudadanía',
            'Siglas' => 'TI'
        ]);

        DB::table('tipo_documentos')->insert([
            'Nombre_Tipo_Documento' => 'Registro Cívil',
            'Siglas' => 'RC'
        ]);

        DB::table('tipo_documentos')->insert([
            'Nombre_Tipo_Documento' => 'Pasaporte de Permanencia',
            'Siglas' => 'PP'
        ]);


        DB::table('tipo_documentos')->insert([
            'Nombre_Tipo_Documento' => 'Cédula de Extranjería',
            'Siglas' => 'CE'
        ]);
    }
}
