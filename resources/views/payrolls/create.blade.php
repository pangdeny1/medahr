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

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/addpayrollperiod') }}">
                        {!! csrf_field() !!}


                                 

                        <div class="form-group{{ $errors->has('PayrollID') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Payroll id</label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control" name="PayrollID" value="{{ old('PayrollID') }}">

                                @if ($errors->has('PayrollID'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('PayrollID') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                         <div class="form-group{{ $errors->has('PayrollDesc') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Payroll Desc</label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control" name="PayrollDesc" value="{{ old('PayrollDesc') }}">

                                @if ($errors->has('PayrollDesc'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('PayrollDesc') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('StartDate') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Start Date </label>

                            <div class="col-md-6">
                                <input type="text" name="StartDate" class="form-control datepicker" value="{{old('StartDate')}}">

                                @if ($errors->has('StartDate'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('StartDate') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('EndDate') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Start Date </label>

                            <div class="col-md-6">
                                <input type="text" name="EndDate" class="form-control datepicker" value="{{old('EndDate')}}">

                                @if ($errors->has('EndDate'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('EndDate') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                         
                           <div class="form-group{{ $errors->has('FSMonth') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Month</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="FSMonth">
                                                        <option value=1>January</option>
                                                        <option value=2>February</option>
                                                        <option value=3>March</option>
                                                        <option value=4>April</option>
                                                        <option value=5>May</option>
                                                        <option value=6>June</option>
                                                        <option value=7>July</option>
                                                        <option value=8>August</option>
                                                        <option value=9>September</option>
                                                        <option value=10>October</option>
                                                        <option value=11>November</option>
                                                        <option value=12>December</option>                                                                                                                
                                                    </select>
                                             @if ($errors->has('FSMonth'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('FSMonth') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
  <div class="form-group{{ $errors->has('FSYear') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">FSYear</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="FSYear">
                                                        @foreach($years  as $FSYear)
                                                       
                                                        <option value="{{$FSYear->id}}">{{$FSYear->year}}</option>
                                                        
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                             @if ($errors->has('FSYear'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('FSYear') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        
                        
                       
                        <div class="form-group{{ $errors->has('DeductSSS') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Deduct Pension</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="DeductSSS">
                                                        @foreach($yesornos  as $ss)
                                                       
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                        
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                             @if ($errors->has('DeductSSS'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('DeductSSS') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        

                        
                        <div class="form-group{{ $errors->has('DeductHealth') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Deduct Health</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="DeductHealth">
                                                        @foreach($yesornos  as $ss)
                                                       
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                        
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                             @if ($errors->has('DeductHealth'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('DeductHealth') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
      
                        <div class="form-group{{ $errors->has('DeductHdmf') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Deduct HDMF</label>

                            <div class="col-md-6">
                                                    <select class="form-control select" name="DeductHdmf">
                                                        @foreach($yesornos  as $ss)
                                                       
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                        
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                             @if ($errors->has('DeductHdmf'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('DeductHdmf') }}</strong>
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