<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EmployeeTableRenamingTitle extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    
    public function up()
    {
        Schema::table('prlemployeemaster', function($t) {
                        $t->renameColumn('title', 'tittle');
                });
    }


    public function down()
    {
        Schema::table('prlemployeemaster', function($t) {
                        $t->renameColumn('tittle', 'title');
                });
    }
}

