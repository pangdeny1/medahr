<?php

namespace App\Http\Controllers\report;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Http\Controllers\Controller;

class reportcontroller extends Controller
{
    public function test()
    {
      $employee = Employee::findOrFail(2);
    	return view('reports.test',compact('employee'));
    }
}
