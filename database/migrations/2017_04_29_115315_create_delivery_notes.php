<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDeliveryNotes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('deliverynotes', function (Blueprint $table) {

            $table->increments('id');
            $table->string('phone');
            $table->string('retailerid');
            $table->string('onelitre')->nullable();
            $table->string('fivelitre')->nullable();
            $table->string('tenlitre')->nullable();
            $table->string('twentylitre')->nullable();
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
        Schema::dropIfExists('deliverynotes'); 
    }
}
