<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRetailersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('retailers', function (Blueprint $table) {

            $table->increments('id');
            $table->string('retailerid')->unique();
            $table->string('status')->nullable();
            $table->string('retailshop')->nullable();
            $table->string('phone')->unique()->nullable();
            $table->string('region');
            $table->string('district');
            $table->string('ward');
            $table->string('village');
            $table->string('latitude');
            $table->string('longitude');
            $table->date('startdate');
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('retailers');
    }
}
