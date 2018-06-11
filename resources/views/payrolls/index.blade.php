 @extends('layouts.pagelayout')

@section('template_title')
  Create New User
@endsection

@section('template_fastload_css')
@endsection

@section('content')
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-payroll"> <a href="{{url('createpayrollperiod')}}">Add New Payroll period</a></i>
                </div>

                <div class="panel-body">
                     @include('includes.flash');
                    @if ($payrolls->isEmpty())
                        <p>There are currently no payrolls.</p>
                    @else
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>payroll Group</th>
                                    <th>payroll Name</th>
                                    <th>Status</th>
                                    <th>Last Updated</th>
                                    <th style="text-align:center" colspan="2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($payrolls as $payroll)
                                <tr>
                                   
                                    <td>
                                        <a href="{{ url('payroll/'. $payroll->id) }}">
                                            {{ $payroll->id }} - {{ $payroll->payrollid }}
                                        </a>
                                    </td>
                                    <td>
                                 {{ $payroll->payrolldesc }}
                                  
                                    </td>
                                    <td>@if($payroll->payclosed==1){{"Open"}} @else {{"Closed"}} @endif</td>
                                     <td>
                                        <a href="{{ url('showpayroll/'.$payroll->id) }}" class="btn btn-primary">Select</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('editpayroll/'.$payroll->id) }}" class="btn btn-primary">Edit</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('deletepayroll/'.$payroll->id) }}" class="btn btn-danger" onclick="return confirm('Are you sure you want to Delete this record')" >Delete</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>

                       
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection