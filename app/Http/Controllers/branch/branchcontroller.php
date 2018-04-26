<?php

namespace App\Http\Controllers\branch;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mailers\AppMailer;
use App\Models\Branch;

class branchcontroller extends Controller
{
    public function index()
    {

    }

     public function create()
    {
        
        $pagetitle="Add Branch";

        return view('branch.create', compact('pagetitle'));
    }

    public function store(Request $request, AppMailer $mailer)
    {
        //store addes files
        
        $this->validate($request, [
            'branchname'     => 'required'
        ]);

        $branch = new Branch([
            'branchname'     => $request->input('branchname')
        ]);

        $branch->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", "A Branch with Title has been created.");
    }
}
