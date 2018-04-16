<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('prlemployeemaster', function (Blueprint $table) {

            $table->increments('employeeid');
            $table->string('employeecode');
            $table->string('title');
            $table->string('lastname');
            $table->string('firstname');
            $table->string('middlename')->nullable();
            $table->string('address1')->nullable();
            $table->string('address2')->nullable();
            $table->string('city')->nullable();
            $table->string('state')->nullable();
            $table->string('zip')->nullable();
            $table->string('country')->nullable();
            $table->string('gender')->nullable();
            $table->string('phone1')->nullable();
            $table->string('phone1comment')->nullable();
            $table->string('phone2')->nullable();
            $table->string('phone2comment')->nullable();
            $table->string('email1')->nullable();
            $table->string('email1comment')->nullable();
            $table->string('email2')->nullable();
            $table->string('email2comment')->nullable();
            $table->string('atmnumber')->nullable();
            $table->string('bankid');
            $table->string('ssnumber');
            $table->string('hdmfnumber');
            $table->integer('isPension');
            $table->string('pencode');
            $table->integer('isHdmf');
            $table->integer('isTaxed');
            $table->integer('isGratuity');
            $table->integer('isHeslb');
            $table->string('phnumber');
            $table->string('taxactnumber');
            $table->date('birthdate');
            $table->date('hiredate');
            $table->date('terminatedate');
            $table->date('probdate');
            $table->date('retireddate');
            $table->integer('paytype')->nullable();
            $table->integer('payperiodid');
            $table->decimal('periodrate',12,2);
            $table->decimal('hourlyrate',12,2);
            $table->integer('glactcode');
            $table->string('marital');
            $table->string('taxstatusid');
            $table->integer('employmentid');
            $table->integer('active')->nullable();
            $table->string('terminatereason');
            $table->date('suspfrom');
            $table->date('suspto');
            $table->string('companyid');
            $table->string('branchid');
            $table->string('deptid');
            $table->string('jobgroupid');
            $table->string('jobid');
            $table->string('costcenterid');
            $table->string('position');
            $table->string('employeepicture');



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
        Schema::dropIfExists('prlemployeemaster');
    }
}
