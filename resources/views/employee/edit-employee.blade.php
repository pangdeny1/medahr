 @extends('layouts.pagelayout')
@section('content')<!-- START BREADCRUMB -->
             
                <!-- END BREADCRUMB -->
                
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                
                    <div class="row">
                        <div class="col-md-12">
@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
                   <form class="form-horizontal" action="{{url('employeeupdate/'.$employee->employeeid) }}" method='post' role='form'>
 
{!! csrf_field() !!}

                                <div class="panel panel-default tabs">                            
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="active"><a href="#tab-first" role="tab" data-toggle="tab">Personal</a></li>
                                        <li><a href="#tab-second" role="tab" data-toggle="tab">Salary</a></li>
                                        <li><a href="#tab-eleventh" role="tab" data-toggle="tab">Bank Info</a></li>
                                        <li><a href="#tab-tenth" role="tab" data-toggle="tab">Dates</a></li>
                                        <li><a href="#tab-third" role="tab" data-toggle="tab">Contacts</a></li>
                                        <li><a href="#tab-fourth" role="tab" data-toggle="tab">Education</a></li>
                                        <li><a href="#tab-fifth" role="tab" data-toggle="tab">Work experience</a></li>
                                        <li><a href="#tab-sixth" role="tab" data-toggle="tab">Dependants</a></li>
                                        <li><a href="#tab-seventh" role="tab" data-toggle="tab">Attachements</a></li>
                                        <li><a href="#tab-eight" role="tab" data-toggle="tab">Membership</a></li>
                                        <li><a href="#tab-ninth" role="tab" data-toggle="tab">Picture</a></li>
                                        

                                    
                                    </ul>
                                    <div class="panel-body tab-content">
                                        <div class="tab-pane active" id="tab-first">
                                              <p>Fill all Mandatory Fields</p>

                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">First Name</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" class="form-control" name="firstname" value="{{ $employee->firstname}}"/>                                                    
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Last Name</label>
                                                <div class="col-md-6 col-xs-12">                                          
                                                    <input type="text" name="lastname" class="form-control" value="{{ $employee->lastname}}"/>
                                                </div>
                                            </div>

                                             <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Other Name </label>
                                                <div class="col-md-6 col-xs-12">                                            
                                                    <input type="text" name="othername" class="form-control" value="{{ $employee->middlename }}"/>
                                                </div>
                                            </div>


                                            
                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Gender</label>
                                                <div class="col-md-6 col-xs-12">  
                                                    <select class="form-control select" name="gender">
                                                        
                                                      

                                                            @foreach($genders as $gender)

                                                         @if($gender->id==$employee->gender)
                                                        
                                                        <option  value='{{$employee->gender}}' selected="selected">{{$gender->name}}</option>
                                                            @endif  
                                                         <option value="{{ $gender->id }}">{{ $gender->name }}</option>
                                                          @endforeach




                                                        </option>
                                                                                                             
                                                    </select>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Branch</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="jobid">
                                                       
                                                          @foreach($branches as $branch)

                                                         @if($branch->id==$employee->branchid)
                                                        
                                                        <option  value='{{$employee->branchid}}' selected="selected">{{$branch->branchname}}</option>
                                                            @endif  
                                                         <option value="{{ $job->id }}">{{ $branch->branchname }}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div>                                          
                                            </div>


                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Departments</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="jobid">
                                                       
                                                          @foreach($departments as $department)

                                                         @if($department->id==$employee->departmentid)
                                                        
                                                        <option  value='{{$employee->departmentid}}' selected="selected">{{$department->departmentname}}</option>
                                                            @endif  
                                                         <option value="{{ $department->id }}">{{ $department->departmentname }}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div>                                          
                                            </div>


                                               <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Job Title</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="jobid">
                                                       
                                                          @foreach($jobs as $job)

                                                         @if($job->id==$employee->jobid)
                                                        
                                                        <option  value='{{$employee->jobid}}' selected="selected">{{$job->jobname}}</option>
                                                            @endif  
                                                         <option value="{{ $job->id }}">{{ $job->jobname }}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div>                                          
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Employee Status</label>
                                                <div class="col-md-2">
                                                    <select class="form-control select" name="active">
                                                        
                                                            @foreach($employeestatuses as $estatus)

                                                         @if($estatus->id==$employee->active)
                                                        
                                                        <option  value='{{$employee->active}}' selected="selected">{{$estatus->name}}</option>
                                                            @endif  
                                                         <option value="{{ $estatus->id }}">{{ $estatus->name }}</option>
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                                                                             
                                                   
                                                </div>                                            
                                            </div>

                                           
                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">About Me</label>
                                                <div class="col-md-6 col-xs-12">                                            
                                                    <textarea class="form-control" rows="5" name="aboutme">{{$employee->phone1comment}}</textarea>
                                                    <span class="help-block">Somethink about your life</span>
                                                </div>
                                            </div>                                           

                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">E-mail</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                        
                                                    <label class="check"><input type="checkbox" class="icheckbox" checked="checked"/> I want to get emails</label>
                                                    
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="tab-pane" id="tab-second">
                                          <p>Fill all Mandatory Fields</p>
                                            
                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Pay type</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="paytype">
                                                

                                                        @foreach($paytypes as $paytype)

                                                         @if($paytype->id==$employee->paytype)
                                                        
                                                        <option  value='{{$employee->paytype}}' selected="selected">{{$paytype->name}}</option>
                                                            @else
                                                         <option value="{{ $paytype->id }}">{{ $paytype->name }}</option>
                                                           @endif 
                                                          @endforeach
                                                                                                             
                                                    </select>
                                                </div>                                          
                                            </div>

                                                                                        
                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Basic Salary</label>
                                                <div class="col-md-3 col-xs-12">                                                                                                                                                        
                                                    <input type="text" class="form-control" name="periodrate" value="{{$employee->periodrate}}"/>                                                    
                                                </div>
                                            </div>

                                             <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Hourly Rate</label>
                                                <div class="col-md-3 col-xs-12">                                                                                                                                                        
                                                    <input type="text" class="form-control" name="hourlyrate" value="{{$employee->hourlyrate}}"/>                                                    
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label"></label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                        
                                                    
                                                </div>
                                            </div>
                                            
                                        </div>                                        
                                        <div class="tab-pane" id="tab-third">
                                           <p>Fill all Mandatory Fields</p>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">E-mail</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="email" class="form-control" value="{{$employee->email1}}"/>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Phone</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="phone" class="form-control" value="{{$employee->phone1}}"/>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Address</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" class="form-control" name="address" value="{{$employee->address1}}"/>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Country</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="country">


                                                       
                                                         @foreach($countries as $country)

                                                         @if($country->id==$employee->country)
                                                        
                                                        <option  value='{{$employee->country}}' selected="selected">{{$country->countryname}}</option>
                                                          @else
                                                   <option value="{{ $country->id }}">{{ $country->countryname }}</option>
                                                     @endif  
                                                          @endforeach

                                               
                                                    </select>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">City/Region</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="region">

                                                        

                                                       @foreach($regions as $region)
                                                       @if($region->id==$employee->city)
                                                        <option  value='{{$employee->city}}' selected="selected">{{$region->regionname}}</option>
                                                       @else
                                                        <option value="{{$region->id}}">{{$region->regionname}}</option>
                                                          @endif  
                                                        @endforeach
                                                        
                                                       
                                                                                                             
                                                    </select>
                                                </div>                                            
                                            </div>
                                          <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">District</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="district">
                                                        @foreach($districts as $district)
                                                        @if($district->id==$employee->state)
                                                        <option  value="{{$employee->state}}" selected="selected">{{$district->districtname}}</option>
                                                        @else
                                                        <option value="{{$district->id}}">{{$district->districtname}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Zip Code</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="zip" class="form-control" value="{{$employee->zip}}"/>
                                                </div>
                                            </div>
                                            
                                        </div>

                                        <div class="tab-pane active" id="tab-fourth">
                                         Fourth



                                          <div class="col-md-12 col-xs-12">
                                            <a href="#"  data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#modal_change_password">Change password</a>
                                        </div>


                                         <div class="modal animated fadeIn" id="modal_change_password" tabindex="-1" role="dialog" aria-labelledby="smallModalHead" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="smallModalHead">Change password</h4>
                    </div>
                    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Add New Job</div>

                <div class="panel-body">
                    @include('includes.flash');

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/new_job') }}">
                        {!! csrf_field() !!}

                        <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Job Title</label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control" name="title" value="{{ old('title') }}">

                                @if ($errors->has('title'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('jobGroup') ? ' has-error' : '' }}">
                            <label for="jobGroup" class="col-md-4 control-label">Job Group</label>

                            <div class="col-md-6">
                                <select id="category" type="jobGroup" class="form-control" name="jobGroup">
                                    <option value="">Select Job Group</option>
                                   
                               @foreach ($jobgroups as $jobgroup)
                        <option value="{{ $jobgroup->id }}">{{ $jobgroup->jobgroupname }}</option>
                                    @endforeach
                                </select>

                                @if ($errors->has('jopGroup'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('jobGroup') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                      

                        <div class="form-group{{ $errors->has('message') ? ' has-error' : '' }}">
                            <label for="message" class="col-md-4 control-label">Job Description</label>

                            <div class="col-md-6">
                                <textarea rows="10" id="message" class="form-control" name="message"></textarea>

                                @if ($errors->has('message'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('message') }}</strong>
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
                </div>
            </div>
        </div>   

                                        </div>

                                         <div class="tab-pane active" id="tab-fifth">
                                         Fifth

                                        </div>

                                         <div class="tab-pane active" id="tab-sixth">
                                        Sixth

                                        </div>

                                         <div class="tab-pane active" id="tab-seventh">
                                         
                                         Seventh

                                        </div>

                                         <div class="tab-pane active" id="tab-eight">
                                        
                                       Membership

                                          <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Social Security Scheme</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="sss">
                                                        @foreach($sss as $ss)
                                                        @if($ss->id==$employee->pencode)
                                                        <option  value="{{$employee->pencode}}" selected="selected">{{$ss->penname}}</option>
                                                        @else
                                                        <option value="{{$ss->id}}">{{$ss->penname}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>

                                       


                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Social Security Number</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="ssnumber" class="form-control" value="{{$employee->ssnumber}}"/>
                                                </div>
                                            </div>

                                             <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Health Insuarance</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="health">
                                                        @foreach($healths as $health)
                                                        @if($health->id==$employee->state)
                                                        <option  value="{{$employee->hdmfcode}}" selected="selected">{{$health->name}}</option>
                                                        @else
                                                        <option value="{{$health->id}}">{{$health->name}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>

                                      


                                              <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Health Insuarance Number</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="phnumber" class="form-control" value="{{$employee->phnumber}}"/>
                                                </div>
                                            </div>


                                             <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Servings Number</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="hdmfnumber" class="form-control" value="{{$employee->hdmfnumber}}"/>
                                                </div>
                                            </div>



                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Deduct Social Security Scheme?</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="isPension">
                                                        @foreach($yeornos as $ss)
                                                        @if($ss->id==$employee->isPension)
                                                        <option  value="{{$employee->isPension}}" selected="selected">{{$ss->name}}</option>
                                                        @else
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Deduct Tax?</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="isTaxed">
                                                        @foreach($yeornos as $ss)
                                                        @if($ss->id==$employee->isTaxed)
                                                        <option  value="{{$employee->isTaxed}}" selected="selected">{{$ss->name}}</option>
                                                        @else
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Deduct Workers Union?</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="isHdmf">
                                                        @foreach($yeornos as $ss)
                                                        @if($ss->id==$employee->isHdmf)
                                                        <option  value="{{$employee->isHdmf}}" selected="selected">{{$ss->name}}</option>
                                                        @else
                                                        <option value="{{$ss->id}}">{{$ss->name}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>

                                        </div>


                                         <div class="tab-pane active" id="tab-eleventh">
                                        
                                        Bank Info 

                                          <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Bank</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="bank">
                                                        @foreach($banks as $bank)
                                                        @if($bank->id==$employee->bankid)
                                                        <option  value="{{$employee->bankid}}" selected="selected">{{$bank->bankname}}</option>
                                                        @else
                                                        <option value="{{$bank->id}}">{{$bank->bankname}}</option>
                                                          @endif  
                                                        @endforeach
                                                                                                                                                                   
                                                    </select>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Bank Account Number</label>
                                                <div class="col-md-6 col-xs-12">                                                                                                                                                        
                                                    <input type="text" name="accountnumber" class="form-control" value="{{$employee->atmnumber}}"/>
                                                </div>
                                            </div>



                                        </div>

                                         <div class="tab-pane active" id="tab-ninth">
                                        
                                       Ninith
                                        </div>


                                            <div class="tab-pane active" id="tab-tenth">
                                   
                                                      
                                         <div class="form-group">
                                            <label class="col-md-3 control-label">Date of Birth</label>
                                            <div class="col-md-5">
                                                <input type="text" name="birthdate" class="form-control datepicker" value="{{$employee->birthdate}}">
                                            </div>
                                        </div>

                                         
                                         
                                         <div class="form-group">
                                            <label class="col-md-3 control-label">Hired Date</label>
                                            <div class="col-md-5">
                                                <input type="text" name="hiredate" class="form-control datepicker" value="{{$employee->hiredate}}">
                                            </div>
                                        </div>
                                    
                                         
                                         <div class="form-group">
                                            <label class="col-md-3 control-label">Probation End Date</label>
                                            <div class="col-md-5">
                                                <input type="text" name="probdate" class="form-control datepicker" value="{{$employee->probdate}}">
                                            </div>
                                        </div>
                                   
                                       
                                         
                                         <div class="form-group">
                                            <label class="col-md-3 control-label">End of Contract</label>
                                            <div class="col-md-5">
                                                <input type="text" name="terminatedate" class="form-control datepicker" value="{{$employee->terminatedate}}">
                                            </div>
                                        </div>
                               
                                        
                                         <div class="form-group">               
                                                <label class="col-md-3 col-xs-12 control-label">End Of Contract Reason</label>
                                                <div class="col-md-5">
                                                    <select class="form-control select" name="terminatereason">
                                                                                                            

                                                       @foreach($endofcontractreasons as $ereason)

                                                         @if($ereason->id==$employee->active)
                                                        
                                                        <option  value='{{$employee->terminatereason}}' selected="selected">{{$ereason->name}}</option>
                                                            @endif  
                                                         <option value="{{ $ereason->id }}">{{ $ereason->name }}</option>
                                                          @endforeach

                                                    </select>
                                                </div>                                            
                                            </div> 
                                   
                                        </div>
                                      
                                        </div>


                                    <div class="panel-footer">                                                                        
                                        <button class="btn btn-primary pull-right">Save Changes <span class="fa fa-floppy-o fa-right"></span></button>
                                    </div>
                                </div>                                
                            
                            </form>
                            
                        </div>
                    </div>                    
                    
                </div>
                <!-- END PAGE CONTENT WRAPPER -->   
                @endsection