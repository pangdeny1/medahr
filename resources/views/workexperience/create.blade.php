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

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/addworkexperience') }}">
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



                         <div class="form-group{{ $errors->has('CompanyName') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Company</label>

                            <div class="col-md-6">
                                <input type="text" name="CompanyName" class="form-control" value="{{old('CompanyName')}}">

                                @if ($errors->has('CompanyName'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('CompanyName') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                         <div class="form-group{{ $errors->has('JobTitle') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Job Title</label>

                            <div class="col-md-6">
                                <input type="text" name="JobTitle" class="form-control" value="{{old('JobTitle')}}">

                                @if ($errors->has('JobTitle'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('JobTitle') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        
                            
                             
                            <div class="form-group{{ $errors->has('StartDate') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Start Date</label>

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
                            <label for="title" class="col-md-4 control-label">End Date</label>

                            <div class="col-md-6">
                                <input type="text" name="EndDate" class="form-control datepicker" value="{{old('EndDate')}}">

                                @if ($errors->has('EndDate'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('EndDate') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                         <div class="form-group{{ $errors->has('Email') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Email</label>

                            <div class="col-md-6">
                                <input type="text" name="Email" class="form-control" value="{{old('Email')}}">

                                @if ($errors->has('Email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('Website') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Website</label>

                            <div class="col-md-6">
                                <input type="text" name="Website" class="form-control" value="{{old('Website')}}">

                                @if ($errors->has('Website'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('Website') }}</strong>
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