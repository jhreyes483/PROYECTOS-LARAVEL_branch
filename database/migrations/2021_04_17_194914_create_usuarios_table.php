<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('tipo_documento_id')->unsigned();
            $table->string('numero_documento');
            $table->string('nombres');
            $table->string('apellidos');
            $table->bigInteger('genero_id')->unsigned();
            $table->date('fecha_nacimiento');
            $table->string('email');
            $table->string('password');
            $table->string('direccion');
            $table->bigInteger('telefono');
            $table->bigInteger('rol_id')->unsigned();
            $table->foreign('tipo_documento_id')->references('id')->on('tipo_documentos');
            $table->foreign('genero_id')->references('id')->on('generos');
            $table->foreign('rol_id')->references('id')->on('rol');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}
