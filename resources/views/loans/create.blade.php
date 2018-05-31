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
                <div class="panel-heading">{{$pagetitle}}</div>

                <div class="panel-body">
                    @include('includes.flash');

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/addloan') }}">
                        {!! csrf_field() !!}
                       
                       <div class="form-group{{ $errors->has('LoanDesc') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Loan Description</label>

                            <div class="col-md-6">
                                <input type="text" name="LoanDesc" class="form-control" value="{{old('LoanDesc')}}">
             
                                @if ($errors->has('LoanDesc'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('LoanDesc') }}</strong>
                                    </span>
                                @endif
                                
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('employee') ? ' has-error' : '' }}">                                      
                                                <label for="title" class="col-md-4 control-label">Employee</label>
                                                <div class="col-md-6">
                                                    <select class="form-control select" name="employee">

                                                       <option value=""> Select Employee </option>
                                                          @foreach($employees as $employee)

                                                         
                                                         <option value="{{ $employee->employeeid }}">{{ $employee->firstname }} {{ $employee->lastname }}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div> 
                                                @if ($errors->has('employee'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('employee') }}</strong>
                                    </span>
                                @endif
                            </div>  
                           
                           <div class="form-group{{ $errors->has('loantype') ? ' has-error' : '' }}">                                      
                                                <label for="title" class="col-md-4 control-label">loantype  </label>
                                                <div class="col-md-6">
                                                    <select class="form-control select" name="loantype">

                                                       <option value=""> Select loantype </option>
                                                          @foreach($loantypes as $loantype)

                                                         
                                                         <option value="{{ $loantype->loantableid }}">{{ $loantype->loantabledesc}}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div> 
                                                @if ($errors->has('loantype'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('loantype') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group{{ $errors->has('Term') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Term</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="Term">
                                                       <option value="">Select</option>
                                                       <option value="Amount">Amount</option>
                                                      <option value="Percent">Percent</option>
                                                    </select>
                                             @if ($errors->has('Term'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Term') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('Amount') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Loan Amount</label>

                            <div class="col-md-6">
                                <input type="text" name="Amount" class="form-control" value="{{old('Amount')}}">
             
                                @if ($errors->has('Amount'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Amount') }}</strong>
                                    </span>
                                @endif
                                
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('Amortization') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Amortization(deduction Amount)</label>

                            <div class="col-md-6">
                                <input type="text" name="Amortization" class="form-control" value="{{old('Amortization')}}">
             
                                @if ($errors->has('Amortization'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Amortization') }}</strong>
                                    </span>
                                @endif
                                
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('Transaction') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Transaction</label>

                            <div class="col-md-6">
                                
                                <select class="form-control select" name="Transaction">
                                                      
                  <option value=''> Select Transaction </option>

                  <option value='Basic'> Basic</option>

                  <option value='Gross'> Gross </option>
                                                                                        
             </select> 
                                             @if ($errors->has('Transaction'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Transaction') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('Percentage') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Percentage</label>

                            <div class="col-md-6">
                                <input type="text" name="Percentage" class="form-control" value="{{old('Percentage')}}">

                                @if ($errors->has('Percentage'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Percentage') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                            <div class="form-group{{ $errors->has('Period') ? ' has-error' : '' }}">                                      
                                                <label for="title" class="col-md-4 control-label">Period  </label>
                                                <div class="col-md-6">
                                                    <select class="form-control select" name="Period">
                                                       
                                                         <option value="{{$period->id}}">{{$period->payrolldesc}}</option>
                                                         
                                                                                                             
                                                    </select>
                                                </div> 
                                                @if ($errors->has('Period'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Period') }}</strong>
                                    </span>
                                @endif
                            </div>
                           
                            <div class="form-group{{ $errors->has('LoanDate') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Loan Date</label>

                            <div class="col-md-6">
                                <input type="text" name="LoanDate" class="form-control datepicker" value="{{old('LoanDate')}}">

                                @if ($errors->has('LoanDate'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('LoanDate') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
 
                            <div class="form-group{{ $errors->has('StartDeduction') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Start Deduction</label>

                            <div class="col-md-6">
                                <input type="text" name="StartDeduction" class="form-control datepicker" value="{{old('StartDeduction')}}">

                                @if ($errors->has('StartDeduction'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('StartDeduction') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                        <div class="form-group{{ $errors->has('Active') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Active?</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="Status">
                                                        @foreach($yesornos  as $ss)
                                                       
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                        
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                             @if ($errors->has('Active'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Active') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-btn fa-ticket"></i> Save
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            @endsection