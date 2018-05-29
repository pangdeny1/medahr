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

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/addemployeequalification') }}">
                        {!! csrf_field() !!}


                        <div class="form-group{{ $errors->has('employee') ? ' has-error' : '' }}">                                      
                                                <label for="title" class="col-md-4 control-label">employees</label>
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
                           
                           <div class="form-group{{ $errors->has('deductiontype') ? ' has-error' : '' }}">                                      
                                                <label for="title" class="col-md-4 control-label">deductiontype  </label>
                                                <div class="col-md-6">
                                                    <select class="form-control select" name="deductiontype">

                                                       <option value=""> Select deductiontype </option>
                                                          @foreach($deductiontypes as $deductiontype)

                                                         
                                                         <option value="{{ $deductiontype->othincid }}">{{ $deductiontype->othincdesc}}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div> 
                                                @if ($errors->has('deductiontype'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('deductiontype') }}</strong>
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
                            <label for="title" class="col-md-4 control-label">Amount</label>

                            <div class="col-md-6">
                                <input type="text" name="Amount" class="form-control" value="{{old('Amount')}}">

                                @if ($errors->has('Amount'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Amount') }}</strong>
                                    </span>
                                @endif
                                 @if ($errors->has('Amount'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Amount') }}</strong>
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

                            <div class="form-group{{ $errors->has('period') ? ' has-error' : '' }}">                                      
                                                <label for="title" class="col-md-4 control-label">period  </label>
                                                <div class="col-md-6">
                                                    <select class="form-control select" name="period">

                                                         <option value="{{ $period->id }}">{{ $period->payrolldesc}}</option>
                                                         
                                                                                                             
                                                    </select>
                                                </div> 
                                                @if ($errors->has('period'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('period') }}</strong>
                                    </span>
                                @endif
                            </div>
                           
                            <div class="form-group{{ $errors->has('DateFrom') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">From Date</label>

                            <div class="col-md-6">
                                <input type="text" name="DateFrom" class="form-control datepicker" value="{{old('DateFrom')}}">

                                @if ($errors->has('DateFrom'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('DateFrom') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
 
                            <div class="form-group{{ $errors->has('DateTo') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">To Date</label>

                            <div class="col-md-6">
                                <input type="text" name="DateTo" class="form-control datepicker" value="{{old('DateTo')}}">

                                @if ($errors->has('DateTo'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('DateTo') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('Recurrent') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Recurrent?</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="Recurrent">
                                                        @foreach($yesornos  as $ss)
                                                       
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                        
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                             @if ($errors->has('Recurrent'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Recurrent') }}</strong>
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