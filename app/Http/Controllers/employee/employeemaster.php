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
use App\Models\Jobgroup;
use App\Models\gender;
use App\Models\Payperiod;
use App\Models\prlemployementstatuses;
use App\Models\bank;
use App\Models\Branch;
use App\Models\Company;
use App\Models\CostCenter;
use App\Models\HDMF;
use App\Models\HealthInsuarance;
use App\Models\SocialSecurityScheme;
use App\Models\TaxTable;
use App\Models\Department;
use App\Models\YesOrNo;
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
        $countries=Country::All();
        $regions=Region::All();
        $districts=District::All();
        $jobgroups = Jobgroup::all();
        $jobs     =job::All();
        $payperiods     =Payperiod::All();
        //$prlemployementstatuses    =prlemployementstatuses::All();
        $maritalstatutes =maritalstatus::All();
        $genders      =gender::All();
        $endofcontractreasons=endofcontractreason::All();
        $employeestatuses    =employeestatus::All();
        $prlemployeestatuses =prlemployementstatuses::All();
        $paytypes            =paytype::All();
        $banks               =Bank::All();
        $sss                  =SocialSecurityScheme::All();
        $branches               =Branch::All();
        $departments           =Department::All();
        $healths               =HealthInsuarance::All();
        $hdmf                  =HDMF::All();
        $companies                =Company::All();
        $yesornos                =YesOrNo::All();
    	return view('employee.addemployee2',compact('pagetitle','jobs','jobgroups','paytypes','maritalstatutes','genders','countries','branches','departments','endofcontractreasons'
            ,'prlemployeestatuses','employeestatuses','banks','healths','hdmf','companies','yesornos','regions','districts','sss','prlemployementstatuses','payperiods'));
    }


     public function store(Request $request)
    {

        $validator = Validator::make($request->all(),
            [
                'lastname'            => 'required',
                'firstname'            => 'required',
                'birthdate'             => 'required',
                'jobid'             => 'required',
                'hiredate'             => 'required',
                'gender'               =>'required',
                'jobid'                =>'required',
                'paytype'              =>'required',
                'gender'                =>'required',
                'active'               =>'required',
                'email'                =>'email|required',
                'employementstatus'    =>'required',
                'company'              =>'required'
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

            $employee = new Employee([
            'employeeid'       =>null,
            'tittle'           =>'MR',
            'employeecode'     =>"w",
            'firstname'        => $request->input('firstname'),
            'lastname'         => $request->input('lastname'),
            'middlename'        => $request->input('othername'),
            'address1'=>$request->input('address'),
            'address2'=>'',
            'city'=>$request->input('city'),
            'state'=>$request->input('state'),
            'zip'=>$request->input('zip'),
            'country'=>$request->input('country'),
            'gender'=>$request->input('gender'),
            'phone1'=>$request->input('phone'),
            'phone1comment'=>$request->input('aboutme'),
            'phone2'=>'',
            'phone2comment'=>'',
            'email1'=>$request->input('email'),
            'email1comment'=>'',
            'email2'=>'',
            'email2comment'=>'',
            'atmnumber'=>$request->input('atmnumber'),
            'bankid'=>$request->input('bank'),
            'ssnumber'=>$request->input('aboutme'),
            'hdmfnumber'=>$request->input('hdmfnumber'),
            'isPension'=>$request->input('isPension'),
            'pencode'=>$request->input('sss'),
            'isHdmf'=>$request->input('isHdmf'),
            'isTaxed'=>$request->input('isTaxed'),
            'isGratuity'=>0,
            'isHeslb'=>0,
            'phnumber'=>$request->input('phnumber'),
            'taxactnumber'=>'',
            'birthdate'=>$request->input('birthdate'),
            'hiredate'=>$request->input('hiredate'),
            'terminatedate'=>$request->input('terminatedate'),
            'probdate'=>$request->input('probdate'),
            'retireddate'=>$request->input('retireddate'),
            'paytype'=>$request->input('paytype'),
            'payperiodid'=>'10',
            'periodrate'=>$request->input('periodrate'),
            'hourlyrate'=>$request->input('hourlyrate'),
            'glactcode'=>'0',
            'marital'=>$request->input('marital'),
            'taxstatusid'=>'',
            'employmentid'=>$request->input('employementstatus'),
            'active'=>$request->input('active'),
            'terminatereason'=>$request->input('terminatereason'),
            'suspfrom'=>'1900-01-01',
            'suspto'=>'1900-01-01',
            'companyid'=>$request->input('company'),
            'branchid'=>$request->input('branch'),
            'deptid'=>$request->input('department'),
            'jobgroupid'=>$request->input('jobgroup'),
            'jobid'=>$request->input('jobid'),
            
            'costcenterid'=>$request->input('CostCenter'),
            'position'=>'',
            'employeepicture'=>$request->input('temployeepicture'),

                
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
        $jobgroups = Jobgroup::all();;
        $jobs     =job::All();
        $payperiods     =Payperiod::All();
        $prlemployementstatuses    =prlemployementstatuses::All();
        $maritalstatutes =maritalstatus::All();
        $genders      =gender::All();
        $endofcontractreasons=endofcontractreason::All();
        $employeestatuses    =employeestatus::All();
        $employementstatuses =employementstatus::All();
        $paytypes            =paytype::All();
        $banks               =Bank::All();
        $sss                  =SocialSecurityScheme::All();
        $branch               =Branch::All();
        $department           =Department::All();
        $health                =HealthInsuarance::All();
        $hdmf                  =HDMF::All();
        $company                =Company::All();
        $yesornos                =YesOrNo::All();

        //$selectedCountry=Country::first()->country;

        $data = [
            'employee'             =>$employee,
            'employeeid'           =>$employeeid,
            'pagetitle'            =>'Edit Employee',
            'countries'            => $countries,
            'regions'              =>$regions,
            'districts'            =>$districts,
            'jobs'                 =>$jobs,
            'genders'              =>$genders,
            'endofcontractreasons' =>$endofcontractreasons,
            'employeestatuses'     =>$employeestatuses,
            'employementstatuses'  =>$employementstatuses,
            'paytypes'             =>$paytypes,
            'banks'                =>$banks,
            'sss'                  =>$sss,
            'branches'             =>$branch,
            'departments'          =>$department,
            'healths'              =>$health,
            'hdmfs'                =>$hdmf,
            'companies'            =>$company,
            'yeornos'              =>$yesornos,
            'jobgroups'            =>$jobgroups,
            'maritalstatutes '     =>$maritalstatutes,
            'companies'            =>$company,
            'payperiods'           =>$payperiods,
            'prlemployementstatuses'=>$prlemployementstatuses

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
            $employee->deptid =$request->input('deptid');
            $employee->branchid =$request->input('branchid');
            $employee->companyid =$request->input('companyid');
            $employee->jobid =$request->input('jobid');
            $employee->costcenterid =$request->input('costcenterid');
            $employee->active =$request->input('active');
            $employee->phone1comment =$request->input('aboutme');


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

            //bank

            //$employee->bankid =$request->input('bank');
            $employee->bankid =$request->input('bank');
            $employee->atmnumber =$request->input('accountnumber');


             //membership
            $employee->hdmfcode =$request->input('hdmfcode');
            $employee->hdmfnumber =$request->input('hdmfnumber');
            $employee->pencode =$request->input('sss');
            $employee->ssnumber =$request->input('ssnumber');
            $employee->healthcode =$request->input('healthcode');
            $employee->phnumber =$request->input('phnumber');
            $employee->isPension =$request->input('isPension');
            $employee->isHdmf =$request->input('isHdmf');
            $employee->isTaxed =$request->input('isTaxed');


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
