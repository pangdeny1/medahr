<?php

namespace App\Http\Controllers\otherdeduction;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\otherdeduction;
use App\Models\otherdedtable;
use App\Models\otherdedtrans;
use App\Models\Employee;
use App\Models\Payroll;
use App\Models\YesOrNo;
use App\Mailers\AppMailer;

class otherdeductionscontroller extends Controller
{
    public function index()
	{
        
        $pagetitle="Otherdeductions ";
        $otherdeductions=otherdeduction::All();
        return view('otherdeductions.index',compact('pagetitle','otherdeductions'));

	}
 public function create()
    {
        $employees=Employee::All();
        
        $pagetitle="Add Otherdeduction";
        $employees=Employee::All();
        $period=Payroll::where('payclosed',1)->firstOrFail();
        $deductiontypes=otherdedtable::All();
        $yesornos=YesOrNo::All();

        return view('otherdeductions.create', compact('pagetitle','yesornos','employees','deductiontypes','period'));
    }

    public function store(Request $request, AppMailer $mailer)
    {
        //store addes files
        
        $this->validate($request, [
           
            'employee'     => 'required',
            'DateFrom'     => 'required',
            'DateTo'     => 'required',
            'Term'     => 'required',
            'deductiontype'     => 'required',
            'Percentage'     => 'required',
            'Amount'     => 'required',
            'Period'     =>'required' 
        ]);

        $otherdeduction= new otherdeduction([
            
            'employeeid'     => $request->input('employee'),
            'payrollid'     => $request->input('Period'),
            'othdate'     => $request->input('DateFrom'),
            'stopdate'     => $request->input('DateTo'),
            'othincamount'     => $request->input('Amount'),
            'subamount'     => $request->input('SubAmount'),
            'othincid'     => $request->input('deductiontype'),
            'quantity'     => $request->input('quantity'),
            'amount_term'     => $request->input('Term'),
            'percent'     => $request->input('Percentage'),
            'recurrent'     => $request->input('Recurent'),
            'status'        => $request->input('Status')
            
              ]);

        $otherdeduction->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);
         $otherdeductions=otherdeduction::All();
         $pagetitle="otherdeductions ";
         //return view('otherdeductions.index',compact('otherdeductions','pagetitle'))->with("status", $request->input('otherdeductionDesc')." otherdeduction  Added Successfully.");
        return redirect()->back()->with("status", $request->input('otherdeductionDesc')." otherdeduction  Added Successfully.");
    }


     public function show($otherdeduction_id)
    {   
    	$pagetitle="otherdeduction View";
        $otherdeduction= otherdeduction::where('id', $otherdeduction_id)->firstOrFail();

        //$comments = $ticket->comments;

        //$category = $ticket->category;

        return view('otherdeductions.show', compact('otherdeduction','pagetitle'));
    }



     public function edit($otherdeduction_id)
    {   
    	$pagetitle="otherdeduction Edit";
        $otherdeduction= otherdeduction::where('id', $otherdeduction_id)->firstOrFail();
        $employees=Employee::All();
        $qualifications=qualification::All();
        $institutions=institute::All();
        $levels=qualificationlevel::All();
        
        //$comments = $ticket->comments;

        //$category = $ticket->category;

        return view('otherdeductions.edit', compact('pagetitle','employees','levels','institutions','qualifications','otherdeduction'));
   }



       public function update(Request $request, AppMailer $mailer,$otherdeduction_id)
    {
        $this->validate($request, [
            'employee'     => 'required',
            'DateFrom'     => 'required',
            'DateTo'     => 'required',
            'level'     => 'required',
            'institution'     => 'required',
            'qualification'     => 'required'
        ]);
       

            $otherdeduction = otherdeduction::where('id', $otherdeduction_id)->firstOrFail();

             $otherdeduction->qualificationid     = $request->input('qualification');
             $otherdeduction->employeeid     = $request->input('employee');
             $otherdeduction->datefrom    = $request->input('DateFrom');
             $otherdeduction->dateto    = $request->input('DateTo');
             $otherdeduction->levelid    = $request->input('level');
             $otherdeduction->institutionid     = $request->input('institution');
        
             $otherdeduction->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

         $otherdeductions=otherdeduction::All();
         $pagetitle="otherdeductions ";
         
          return view('otherdeductions.index', compact('otherdeductions','pagetitle'))->with("status", "otherdeduction  Updated Successfully");

       // return redirect()->back()->with("status", "A otherdeduction Title has been Updated.");
    }


     public function destroy($otherdeduction_id)
        {
    $otherdeductions = otherdeduction::findOrFail($otherdeduction_id);

    $otherdeductions->delete();

      // return redirect()->route('tasks.index');
     return redirect()->back()->with("status", "otherdeduction successfully deleted!");
           }
}
