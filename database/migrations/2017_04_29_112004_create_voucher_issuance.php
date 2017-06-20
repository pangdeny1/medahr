<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVoucherIssuance extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('voucherissuance', function (Blueprint $table) {

            $table->increments('id');
            $table->string('voucherid')->unique();
            $table->string('issuancedate')->nullable();
            $table->string('issuerphone')->unique()->nullable();
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
       Schema::dropIfExists('voucherissuance'); 
    }
}
