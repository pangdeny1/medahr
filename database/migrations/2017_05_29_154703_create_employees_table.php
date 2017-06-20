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
            $table->string('middlename');
            $table->string('address1');
            $table->string('address2');
            $table->string('city');
            $table->string('state');
            $table->string('zip');
            $table->string('country');
            $table->string('gender');
            $table->string('phone1');
            $table->string('phone1comment');
            $table->string('phone2');
            $table->string('phone2comment');
            $table->string('email1');
            $table->string('email1comment');
            $table->string('email2');
            $table->string('email2comment');
            $table->string('atmnumber');
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
            $table->integer('paytype');
            $table->integer('payperiodid');
            $table->decimal('periodrate',12,2);
            $table->decimal('hourlyrate',12,2);
            $table->integer('glactcode');
            $table->string('marital');
            $table->string('taxstatusid');
            $table->integer('employmentid');
            $table->integer('active');
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
