<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentRequestTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
          Schema::create('paymentrequest', function (Blueprint $table) {

            $table->increments('id');
            $table->string('phone');
            $table->string('amount')->nullable();
            $table->date('requestdate');
            $table->string('payee')->nullable();
            $table->string('sme')->nullable();
            $table->string('status');
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
        Schema::dropIfExists('paymentrequest');
    }
}
