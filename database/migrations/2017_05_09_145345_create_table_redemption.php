<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableRedemption extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        Schema::create('voucherredemption', function (Blueprint $table) {

            $table->increments('id');
            $table->string('voucherid')->unique();
            $table->string('issuancedate')->nullable();
            $table->string('issuerphone')->nullable();
            $table->string('redemptiondate')->nullable();
            $table->string('redeemerphone');
            $table->string('retailerid');
            $table->string('retailername');
            $table->string('shopname');
            $table->string('region');
            $table->string('district');
            $table->string('oilbarcode');
            $table->string('size');
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
        Schema::dropIfExists('voucherredemption');
    }
}
