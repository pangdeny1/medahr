<?php

namespace App\Http\Controllers\department;

use Illuminate\Http\Request;
use App\Models\Department;
use App\Mailers\AppMailer;
use App\Http\Controllers\Controller;

class DepartmentsController extends Controller
{

	public function index()
    {

    }

     public function create()
    {
        
        $pagetitle="Add Department";

        return view('departments.create', compact('pagetitle'));
    }

    public function store(Request $request, AppMailer $mailer)
    {
        //store addes files
        
        $this->validate($request, [
            'departmentname'     => 'required',
            'departmentlocation'     => 'required'
        ]);

        $department = new department([
            'departmentname'     => $request->input('departmentname'),
            'departmentlocation'     => $request->input('departmentlocation')

        ]);

        $department->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", "A Department with Title has been created.");
    }
}
