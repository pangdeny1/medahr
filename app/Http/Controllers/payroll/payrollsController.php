<?php

namespace App\Http\Controllers\payroll;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\Payroll;
use App\Models\Salary;
use App\Mailers\AppMailer;
use App\Models\YesOrNo;
use App\Models\Year;
use App\Models\Month;
use App\Models\Payperiod;
use App\Http\Controllers\Controller;

class payrollsController extends Controller
{
	public function index()
	{
         $payrolls=Payroll::All();
         $pagetitle="Payrolls ";
        return view('payrolls.index',compact('payrolls','pagetitle'));

	}
 public function create()
    {
        
        $pagetitle="Add New Payroll Period";
        $yesornos =YesOrNo::All();
        $employees=Employee::All();
        $years=Year::All();
        $months=Month::All();
        $payperiods     =Payperiod::All();

        return view('payrolls.create', compact('pagetitle','payperiods','employees','years','yesornos','months'));
    }

    public function store(Request $request, AppMailer $mailer)
    {
        //store addes files
        
        $this->validate($request, [
            'PayrollID'     => 'required|unique:prlpayrollperiod',
            'PayrollDesc'     => 'required',
            'StartDate'     => 'required',
            'EndDate'     => 'required',
            'FSMonth'     => 'required',
            'FSYear'     => 'required',
            'DeductSSS'     => 'required',
            'DeductHdmf'     => 'required',
            'DeductHealth'     => 'required',
            'payperiod'       =>'required'
        ]);

        $payroll= new Payroll([
            'payrollid'     => $request->input('PayrollID'),
            'payrolldesc'     => $request->input('PayrollDesc'),
            'startdate'     => $request->input('StartDate'),
            'enddate'     => $request->input('EndDate'),
            'fsmonth'     => $request->input('FSMonth'),
            'fsyear'     => $request->input('FSYear'),
            'deductsss'     => $request->input('DeductSSS'),
            'deducthdmf'     => $request->input('DeductHdmf'),
            'deductphilhealth'     => $request->input('DeductHealth'),
            'payperiodid'     => $request->input('payperiod')
        ]);

        $payroll->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", $request->input('PayrollDesc')." Payroll  Added Successfully.");
    }


     public function show($payroll_id)
    {   
    	$pagetitle="Payroll Records Maintenance";
        $payroll= payroll::where('id', $payroll_id)->firstOrFail();
        $employees= Employee::where('active', 1)->where('payperiodid',$payroll->payperiodid)->get();
        $payperiods     =Payperiod::All();
         //$employees= Employee::All();

        return view('payrolls.show', compact('payroll','pagetitle','employees','payperiods'));
    }

    public function generate($payroll_id)
    {
        $payroll= payroll::where('id', $payroll_id)->firstOrFail();
        $pagetitle="Generating payroll Data";
        $payperiods     =Payperiod::All();
        return view('payrolls.generate',compact('pagetitle','payroll','payperiods'));
    }



     public function edit($payroll_id)
    {   
    	$pagetitle="payroll Edit";
        $payroll= payroll::where('id', $payroll_id)->firstOrFail();
        $yesornos =YesOrNo::All();
        $employees=Employee::All();
        $years=Year::All();
        $months=Month::All();
        $payperiods     =Payperiod::All();

        

        //$comments = $ticket->comments;

        //$category = $ticket->category;

        return view('payrolls.edit', compact('payroll','payperiods','pagetitle','years','employees','yesornos','months'));
    }



       public function update(Request $request, AppMailer $mailer,$payroll_id)
    {
        $this->validate($request, [
            'PayrollID'     => 'required',
            'PayrollDesc'     => 'required',
            'StartDate'     => 'required',
            'EndDate'     => 'required',
            'FSMonth'     => 'required',
            'FSYear'     => 'required',
            'DeductSSS'     => 'required',
            'DeductHdmf'     => 'required',
            'DeductHealth'     => 'required',
            'payperiod'        =>'required'
        ]);
       

            $payroll = payroll::where('id', $payroll_id)->firstOrFail();

             $payroll->payrollid     =$request->input('PayrollID');
             $payroll->payrolldesc    =$request->input('PayrollDesc');
             $payroll->startdate    = $request->input('StartDate');
             $payroll->enddate   =$request->input('EndDate');
             $payroll->fsmonth    = $request->input('FSMonth');
             $payroll->fsyear   = $request->input('FSYear');
             $payroll->deductsss    = $request->input('DeductSSS');
             $payroll->deducthdmf    = $request->input('DeductHdmf');
             $payroll->deductphilhealth     = $request->input('DeductHealth');
             $payroll->payperiodid    =$request->input('payperiod');

         $payroll->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", "A payroll Title has been Updated.");
    }


     public function destroy($payroll_id)
        {
    $payrolls = payroll::findOrFail($payroll_id);

    $payrolls->delete();

      // return redirect()->route('tasks.index');
     return redirect()->back()->with("status", "payroll successfully deleted!");
           }
}
