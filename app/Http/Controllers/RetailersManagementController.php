<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\Profile;
use App\Models\User;
use App\Models;
use App\Models\Retailer;
use App\Traits\ActivationTrait;
use App\Traits\CaptchaTrait;
use App\Traits\CaptureIpTrait;
use Auth;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use jeremykenedy\LaravelRoles\Models\Permission;
use jeremykenedy\LaravelRoles\Models\Role;
use Validator;
use Illuminate\Support\Facades\DB;

class RetailersManagementController extends Controller
{
    
     public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $pagetitle='Retailers';
        $retailers=DB::table('retailers')->get();


        return view('people.showretailers',compact('retailers','pagetitle'));

    }

    public function redemptions()
    {
        $pagetitle="Redemptions";
        $redemptions=DB::table('voucherredemption')->take(100)->get();


        return view('people.showredemptions',compact('redemptions','pagetitle'));

    }

     public function issuances()
    {
        $pagetitle='issuances';
        $issuances=DB::table('voucherissuance')->get();


        return view('people.showissuances',compact('issuances','pagetitle'));

    }

 public function deliverynotes()
    {
        $pagetitle='Delivery Note';
        $deliverynotes=DB::table('deliverynotes')->get();


        return view('people.showdeliverynotes',compact('deliverynotes','pagetitle'));

    }


public function retailermap()
    {
        $retailers=DB::table('retailers')->get();

$pagetitle='Retailer Map';
        return view('people.showretailermap',compact('retailers','pagetitle'));

    }
 public function paymentrequest()
 {
$paymentrequests=DB::table('paymentrequest')->get();

       $pagetitle="Payment Request";
        return view('people.showpaymentrequest',compact('paymentrequests','pagetitle'));

 }   



}
