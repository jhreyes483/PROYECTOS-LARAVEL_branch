<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;


class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()

    {
        
        DB::table('usuarios')->insert([
        'tipo_documento_id' => '1',
        'numero_documento' => '10101010',
        'nombres' => 'Juan Sebastian',
        'apellidos' => 'Ruiz Herrera',
        'genero_id' => '1',
        'fecha_nacimiento' => '1998-05-15',
        'email' => 'jsruiz7411@misena.edu.co',
        'password' => '123',
        'direccion' => 'Calle Usme',
        'telefono' => '3115133173',
        'rol_id' => '2'
        ]);

        DB::table('usuarios')->insert([
            'tipo_documento_id' => '1',
            'numero_documento' => '50505050',
            'nombres' => 'Andres Felipe',
            'apellidos' => 'Ospina Castro',
            'genero_id' => '1',
            'fecha_nacimiento' => '2000-07-14',
            'email' => 'afospina93@misena.edu.co',
            'password' => '123',
            'direccion' => 'Carrera 80',
            'telefono' => '3124845032',
            'rol_id' => '2'
            ]);

            DB::table('usuarios')->insert([
                'tipo_documento_id' => '1',
                'numero_documento' => '30303030',
                'nombres' => 'Marco Aurelio',
                'apellidos' => 'Espinosa Castro',
                'genero_id' => '1',
                'fecha_nacimiento' => '1998-05-15',
                'email' => 'maespinosa56@misena.edu.co',
                'password' => '123',
                'direccion' => 'Avenida Calabera',
                'telefono' => '3174483117',
                'rol_id' => '2'
                ]);

                DB::table('usuarios')->insert([
                    'tipo_documento_id' => '1',
                    'numero_documento' => '97052407005',
                    'nombres' => 'Juan Sebastian',
                    'apellidos' => 'Ruiz Herrera',
                    'genero_id' => '1',
                    'fecha_nacimiento' => '1997-05-24',
                    'email' => 'sebasruiz97@gmail.com',
                    'password' => '123',
                    'direccion' => 'Carrera 14 G Bis #74 B 36 Sur',
                    'telefono' => '3115133173',
                    'rol_id' => '1'
                    ]);
    }
}
