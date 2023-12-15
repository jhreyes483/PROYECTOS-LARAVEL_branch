<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_producto');
            $table->string('imagen')->nullable();
            $table->bigInteger('talla_id')->unsigned();
            $table->string('color');
            $table->bigInteger('material_id')->unsigned();
            $table->bigInteger('categoria_id')->unsigned();
            $table->bigInteger('clasificacion_id')->unsigned();
            $table->string('valor');
            $table->string('cantidad');

            $table->foreign('categoria_id')->references('id')->on('categorias');
            $table->foreign('clasificacion_id')->references('id')->on('clasificaciones');
            $table->foreign('talla_id')->references('id')->on('tallas');
            $table->foreign('material_id')->references('id')->on('materiales');

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
        Schema::dropIfExists('productos');
    }
}
