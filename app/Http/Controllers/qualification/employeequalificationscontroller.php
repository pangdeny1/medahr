<?php

namespace App\Http\Controllers\qualification;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\employeequalification;
use App\Models\Employee;
use App\Models\qualification;
use App\Models\institute;
use App\Models\qualificationlevel;
use App\Mailers\AppMailer;
use App\Http\Controllers\job\JobgroupsController;

class employeequalificationscontroller extends Controller
{
	public function index()
	{
         $employeequalifications=employeequalification::All();
         $pagetitle="employeequalifications ";
        return view('employeequalifications.index',compact('employeequalifications','pagetitle'));

	}
 public function create()
    {
        $employees=Employee::All();
        $qualifications=qualification::All();
        $institutions=institute::All();
        $levels=qualificationlevel::All();
        $pagetitle="Add New employeequalification Period";
        

        return view('employeequalifications.create', compact('pagetitle','employees','levels','institutions','qualifications'));
    }

    public function store(Request $request, AppMailer $mailer)
    {
        //store addes files
        
        $this->validate($request, [
            'employeequalificationID'     => 'required|unique:prlemployeequalificationperiod',
            'employeequalificationDesc'     => 'required',
            'StartDate'     => 'required',
            'EndDate'     => 'required',
            'FSMonth'     => 'required',
            'FSYear'     => 'required',
            'DeductSSS'     => 'required',
            'DeductHdmf'     => 'required',
            'DeductHealth'     => 'required'
        ]);

        $employeequalification= new employeequalification([
            'employeequalificationid'     => $request->input('employeequalificationID'),
            'employeequalificationdesc'     => $request->input('employeequalificationDesc'),
            'startdate'     => $request->input('StartDate'),
            'enddate'     => $request->input('EndDate'),
            'fsmonth'     => $request->input('FSMonth'),
            'fsyear'     => $request->input('FSYear'),
            'deductsss'     => $request->input('DeductSSS'),
            'deducthdmf'     => $request->input('DeductHdmf'),
            'deductphilhealth'     => $request->input('DeductHealth'),
            'payperiodid'     => 22
        ]);

        $employeequalification->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", $request->input('employeequalificationDesc')." employeequalification  Added Successfully.");
    }


     public function show($employeequalification_id)
    {   
    	$pagetitle="employeequalification View";
        $employeequalification= employeequalification::where('id', $employeequalification_id)->firstOrFail();

        //$comments = $ticket->comments;

        //$category = $ticket->category;

        return view('employeequalifications.show', compact('employeequalification','pagetitle'));
    }



     public function edit($employeequalification_id)
    {   
    	$pagetitle="employeequalification Edit";
        $employeequalification= employeequalification::where('id', $employeequalification_id)->firstOrFail();
        $yesornos =YesOrNo::All();
        $employees=Employee::All();
        $years=Year::All();
        $months=Month::All();

        

        //$comments = $ticket->comments;

        //$category = $ticket->category;

        return view('employeequalifications.edit', compact('employeequalification','pagetitle','years','employees','yesornos','months'));
    }



       public function update(Request $request, AppMailer $mailer,$employeequalification_id)
    {
        $this->validate($request, [
            'employeequalificationID'     => 'required',
            'employeequalificationDesc'     => 'required',
            'StartDate'     => 'required',
            'EndDate'     => 'required',
            'FSMonth'     => 'required',
            'FSYear'     => 'required',
            'DeductSSS'     => 'required',
            'DeductHdmf'     => 'required',
            'DeductHealth'     => 'required'
        ]);
       

            $employeequalification = employeequalification::where('id', $employeequalification_id)->firstOrFail();

             $employeequalification->employeequalificationid     =$request->input('employeequalificationID');
             $employeequalification->employeequalificationdesc    =$request->input('employeequalificationDesc');
             $employeequalification->startdate    = $request->input('StartDate');
             $employeequalification->enddate   =$request->input('EndDate');
             $employeequalification->fsmonth    = $request->input('FSMonth');
             $employeequalification->fsyear   = $request->input('FSYear');
             $employeequalification->deductsss    = $request->input('DeductSSS');
             $employeequalification->deducthdmf    = $request->input('DeductHdmf');
             $employeequalification->deductphilhealth     = $request->input('DeductHealth');
             $employeequalification->payperiodid    =22;

         $employeequalification->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", "A employeequalification Title has been Updated.");
    }


     public function destroy($employeequalification_id)
        {
    $employeequalifications = employeequalification::findOrFail($employeequalification_id);

    $employeequalifications->delete();

      // return redirect()->route('tasks.index');
     return redirect()->back()->with("status", "employeequalification successfully deleted!");
           }
}
