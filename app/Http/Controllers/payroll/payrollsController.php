<?php

namespace App\Http\Controllers\payroll;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\Payroll;
use App\Models\Salary;
use App\Mailers\AppMailer;
use App\Models\YesOrNo;
use App\Models\Year;
use App\Http\Controllers\Controller;

class payrollsController extends Controller
{
 public function create()
    {
        
        $pagetitle="Add New Payroll Period";
        $yesornos =YesOrNo::All();
        $employees=Employee::All();
        $years=Year::All();

        return view('payrolls.create', compact('pagetitle','employees','years','yesornos'));
    }

    public function store(Request $request, AppMailer $mailer)
    {
        //store addes files
        
        $this->validate($request, [
            'PayrollID'     => 'required',
            'PayrollDesc'     => 'required',
            'StartDate'     => 'required',
            'EndDate'     => 'required',
            'FSMonth'     => 'required',
            'FSYear'     => 'required',
            'DeductSSS'     => 'required',
            'DeductHdmf'     => 'required',
            'DeductHealth'     => 'required'
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
            'payperiodid'     => 22
        ]);

        $payroll->save();

       // $mailer->sendTicketInformation(Auth::user(), $ticket);

        return redirect()->back()->with("status", $request->input('PayrollDesc')." Payroll  Added Successfully.");
    }
}
