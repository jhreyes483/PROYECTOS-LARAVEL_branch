<?php

namespace Database\Seeders;

use App\Models\Material;
use Illuminate\Database\Seeder;

use Database\Seeders\Tipo_DocumentoSeeder;

use Database\Seeders\RolSeeder;

use Database\Seeders\GeneroSeeder;

use Database\Seeders\MaterialSeeder;

use Database\Seeders\CategoriaSeeder;

use Database\Seeders\ClasificacionSeeder;

use Database\Seeders\UsuarioSeeder;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        $this->call(Tipo_DocumentoSeeder::class);

        $this->call(RolSeeder::class);

        $this->call(GeneroSeeder::class);

        $this->call(MaterialSeeder::class);

        $this->call(CategoriaSeeder::class);

        $this->call(ClasificacionSeeder::class);

        $this->call(UsuarioSeeder::class);

        $this->call(TallaSeeder::class);

        $this->call(ProductoSeeder::class);

        $this->call(ContactoSeeder::class);


    }
}
