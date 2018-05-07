<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkExperience extends Model
{
	protected $table = 'work_experiences';
    protected $primaryKey='id';

  
    protected $fillable = [
          'employeeid','companyname','website','email','startdate','enddate'
           ];
   
}