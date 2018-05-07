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
                    <i class="fa fa-workexperience"> <a href="{{url('createworkexperience')}}">Add New workexperience </a></i>
                </div>

                <div class="panel-body">
                     @include('includes.flash');
                    @if ($workexperiences->isEmpty())
                        <p>There are currently no workexperiences.</p>
                    @else
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>workexperience</th>
                                    <th>Employee</th>
                                    <th>Relationship</th>
                                    <th>Is Next of Kin</th>
                                    <th> Date of Birth </th>
                                    <th style="text-align:center" colspan="2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($workexperiences as $workexperience)
                                <tr>
                                   
                                   
                                    <td>
                                  {{ $workexperience->id}}
                                   
                                    </td>
                                   
                                    <td>{{ $workexperience->fullname }}</td>
                                    <td>
                                     @foreach ($employees as $employee)
                                        @if ($employee->employeeid == $workexperience->employeeid)
                                            {{ $employee->firstname }} {{$employee->lastname}}
                                        @endif
                                    @endforeach</td>
                                    <td>

                                </td>
                                    <td>@if($workexperience->nextofkeen==1)
                                                           {{'Yes'}}
                                                  @else
                                                         {{'No'}} 
                                                  @endif
                                    </td>
                                    <td>
                                        {{ $workexperience->dob }}
                                    </td>
                                     <td>
                                        <a href="{{ url('showworkexperience/'.$workexperience->id) }}" class="btn btn-primary">View</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('editworkexperience/'.$workexperience->id) }}" class="btn btn-primary">Edit</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('deleteworkexperience/'.$workexperience->id) }}" class="btn btn-danger" onclick="return confirm('Are you sure you want to Delete this record')" >Delete</a>
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