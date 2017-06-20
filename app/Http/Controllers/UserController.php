<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class UserController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $user = Auth::user();
         $users = DB::table('users')->count('id');
         $totalretailers = DB::table('prlemployeemaster')->count('employeeid');
         $activeretailers = DB::table('prlemployeemaster')->where('active',1)->count('employeeid');
         $inactiveretailers = DB::table('prlemployeemaster')->where('active',0)->count('employeeid');
         $newretailers = DB::table('prlemployeemaster')->count('employeeid');
         $voucherredemption=DB::table('voucherredemption')->count('id');
         $voucherissuance=DB::table('voucherissuance')->count('id');

        if ($user->isAdmin()) {
        //  $users = DB::table('users')->where('id',4)->get();
         
            return view('pages.admin.newadminhome',compact('users','voucherredemption','voucherissuance','totalretailers','activeretailers','inactiveretailers','newretailers'));

        }

        return view('pages.admin.newadminhome');

    }

}