<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class employee extends Controller
{
    //
    function index()

    {
    	return view('employee.employee');
    }
}
