<?php

namespace App\Http\Controllers\employee;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\Profile;
use App\Models\User;
use App\Models\country;
use App\Models\Region;
use App\Models\District;
use App\Models\Employee;
use App\Models\job;
use App\Models\gender;
use App\Models\maritalstatus;
use App\Models\employementstatus;
use App\Models\employeestatus;
use App\Models\endofcontractreason;
use App\Models\paytype;
use App\Models;
use App\Models\Retailer;
use App\Traits\ActivationTrait;
use App\Traits\CaptchaTrait;
use App\Traits\CaptureIpTrait;
use Auth;
use Illuminate\Foundation\Auth\RegistersUsers;
use jeremykenedy\LaravelRoles\Models\Permission;
use jeremykenedy\LaravelRoles\Models\Role;
use Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;

class employeemaster extends Controller
{
	  public function __construct()
    {
        $this->middleware('auth');
    }
    

    function index()

    {
        $pagetitle='Employees Master';
        $employees=DB::table('prlemployeemaster')
        ->select('prlemployeemaster.employeeid','prlemployeemaster.firstname','lastname','prlemployeemaster.middlename',
        'jobs.jobname as jobid','employeestatutes.name as active','genders.name as gender','hiredate','hourlyrate','paytype',
        'periodrate')
        ->leftjoin('genders','prlemployeemaster.gender','genders.id')
        ->leftjoin('jobs','prlemployeemaster.jobid','jobs.id')
        ->leftjoin('employeestatutes','prlemployeemaster.active','employeestatutes.id')
        ->get();

        return view('employee.employeemaster',compact('employees','pagetitle'));
    	
    }
//function for adding employees
    function addemployee()
    {
    	$pagetitle="Add Employee";
    	return view('employee.addemployee',compact('pagetitle'));
    }


     public function store(Request $request)
    {

        $validator = Validator::make($request->all(),
            [
                'othername'            => 'required',
                'firstname'            => 'required',
                'hiredate'             => 'required',
                'gender'               =>'required',
                'jobid'                =>'required',
                'paytype'              =>'required',
                'email'                =>'required',
                'active'               =>'required',
                'email'                =>'email|required'
            ]);

      /*  if ($validator->fails()) {

            $this->throwValidationException(
                $request, $validator
            );
*/
if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();

        } else {

           // $ipAddress  = new CaptureIpTrait;
           // $profile    = new Profile;

            $employee =  Employee::create([
                'employeeid'       =>null,
                'tittle'           =>'MR',
                'employeecode'     =>"w",
                'firstname'        => $request->input('firstname'),
             'lastname'         => $request->input('lastname'),
            'middlename'        => $request->input('othername'),
            'address1'=>'',
            'address2'=>'',
            'city'=>'',
            'state'=>'',
            'zip'=>'',
            'country'=>'',
            'gender'=>'',
            'phone1'=>'',
            'phone1comment'=>$request->input('aboutme'),
            'phone2'=>'',
            'phone2comment'=>'',
            'email1'=>'',
            'email1comment'=>'',
            'email2'=>'',
            'email2comment'=>'',
            'atmnumber'=>'',
            'bankid'=>'',
            'ssnumber'=>'',
            'hdmfnumber'=>'',
            'isPension'=>1,
            'pencode'=>0,
            'isHdmf'=>0,
            'isTaxed'=>0,
            'isGratuity'=>0,
            'isHeslb'=>0,
            'phnumber'=>'',
            'taxactnumber'=>'',
            'birthdate'=>$request->input('dob'),
            'hiredate'=>'2017-01-01',
            'terminatedate'=>'2030-01-01',
            'probdate'=>'2017-01-01',
            'retireddate'=>'2030-01-01',
            'paytype'=>'10',
            'payperiodid'=>'10',
            'periodrate'=>'0.00',
            'hourlyrate'=>'0.00',
            'glactcode'=>'0',
            'marital'=>'',
            'taxstatusid'=>'',
            'employmentid'=>'1',
            'active'=>'1',
            'terminatereason'=>'',
            'suspfrom'=>'2000-01-01',
            'suspto'=>'1970-01-01',
            'companyid'=>'',
            'branchid'=>'',
            'deptid'=>'',
            'jobgroupid'=>'',
            'jobid'=>'',
            
            'costcenterid'=>'',
            'position'=>'',
            'employeepicture'=>''

                
            ]);

            //$employee->profile()->save($profile);
           // $user->attachRole($request->input('role'));
            $employee->save();

            return redirect('employeemaster')->with('success', trans('usersmanagement.createSuccess'));

        }
    }

     public function edit($employeeid)
    {


   $employee = Employee::findOrFail($employeeid);
          /*   $roles = Role::all();

        foreach ($user->roles as $user_role) {
            $currentRole = $user_role;
        }

        */
        $countries=Country::All();
        $regions=Region::All();
        $districts=District::All();
        $jobs     =job::All();
        $maritalstatus=maritalstatus::All();
        $genders      =gender::All();
        $endofcontractreasons=endofcontractreason::All();
        $employeestatuses    =employeestatus::All();
        $employementstatuses =employementstatus::All();
        $paytypes            =paytype::All();
        $selectedCountry=Country::first()->country;

        $data = [
            'employee'             => $employee,
            'employeeid'           =>$employeeid,
            'pagetitle'            =>'Edit Employee' ,
            'countries'            => $countries,
            'regions'              =>$regions,
            'districts'            =>$districts,
            'selectedCountry'      =>$selectedCountry,
            'jobs'                 =>$jobs,
            'genders'              =>$genders,
            'endofcontractreasons' =>$endofcontractreasons,
            'employeestatuses'     =>$employeestatuses,
            'employementstatuses'  =>$employementstatuses,
            'paytypes'             =>$paytypes



        ];

        return view('employee.edit-employee')->with($data);
    }

    function update(Request $request,$id)
    {
  
        
         $employee       = Employee::find($id);
        $validator = Validator::make($request->all(),
            [
                
                'firstname'            => 'required',
                'lastname'             => 'required',
                'periodrate'           =>'required',
                'jobid'                =>'required',
                'paytype'              =>'required',
                'email'                =>'email|required'



            ]);

if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();

        } else {

            $employee = Employee::find($id);
            //personal
            $employee->firstname      = $request->input('firstname');
            $employee->lastname     = $request->input('lastname');
            $employee->middlename =$request->input('othername');
            $employee->gender =$request->input('gender');
            $employee->jobid =$request->input('jobid');
            $employee->active =$request->input('active');


            //Salary

            $employee->hourlyrate =$request->input('hourlyrate');
            $employee->periodrate =$request->input('periodrate');
            $employee->paytype =$request->input('paytype');

            //Contacts
            $employee->email1 =$request->input('email');
            $employee->phone1 =$request->input('phone');
            $employee->address1 =$request->input('address');
            $employee->country =$request->input('country');
            $employee->city =$request->input('region');
            $employee->state =$request->input('district');
            $employee->zip =$request->input('zip');

            //Dates

            $employee->birthdate =$request->input('birthdate');
            $employee->hiredate =$request->input('hiredate');
            $employee->probdate =$request->input('probdate');
            $employee->terminatedate =$request->input('terminatedate');
            $employee->terminatereason=$request->input('terminatereason');

            //Experience
            
            

            $employee->save();

            // redirect
            Session::flash('message', 'Successfully updated Employee  '.$employee->firstname.' '.$employee->lastname);
            return Redirect::to('employeemaster');

        }

    }


     public function destroy($id)
    {

       $employee = Employee::findOrFail($id);
        $employee->delete();

        // redirect
        Session::flash('message', 'Successfully deleted the employee!');
        return Redirect::to('employeemaster');
    }

    public function prlpayroll()
    {

        return view ('tma_invoice.prlpayroll');
    }

}
