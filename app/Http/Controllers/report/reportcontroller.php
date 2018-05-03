<?php

namespace App\Http\Controllers\report;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\company;
use App\Http\Controllers\Controller;

class reportcontroller extends Controller
{
    public function test()
    {
      $employee = Employee::findOrFail(2);
      $company = company::findOrFail(1);
    	return view('reports.test',compact('employee','company'));
    }
}
