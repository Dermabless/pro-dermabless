<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLocationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('location', function (Blueprint $table) {
            $table->id();
	        $table->integer('warehouse_id');
	        $table->string('shelf')->nullable();
	        $table->string('section')->nullable();
	        $table->string('row')->nullable();
	        $table->string('slot')->nullable();
	        $table->boolean('active')->default(true);
	        $table->string('key');

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
        Schema::dropIfExists('location');
    }
}
