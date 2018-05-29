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
                    <i class="fa fa-otherdeduction"> <a href="{{url('createotherdeduction')}}">Add Employee Deduction </a></i>
                </div>

                <div class="panel-body">
                     @include('includes.flash');
                    @if ($otherdeductions->isEmpty())
                        <p>There are currently no otherdeductions.</p>
                    @else
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Employee</th>
                                    <th>Qualification</th>
                                    <th>Level</th>
                                    <th>Institute</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th style="text-align:center" colspan="2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($otherdeductions as $otherdeduction)
                                <tr>
                                   
                                    <td>
                                      @foreach ($employees as $employee)
                                        @if ($employee->employeeid == $otherdeduction->employeeid)
                                            {{ $employee->firstname }} {{$employee->lastname}}
                                        @endif
                                    @endforeach
                                    </td>
                                    <td>
                                       @foreach ($qualifications as $qualification)
                                        @if ($qualification->id == $otherdeduction->qualificationid)
                                            {{ $qualification->qualificationname }}
                                        @endif
                                    @endforeach
                                    </td>
                                    <td>
                                  @foreach ($levels as $level)
                                        @if ($level->id == $otherdeduction->levelid)
                                            {{ $level->qlevelname }}
                                        @endif
                                    @endforeach
                                  
                                    </td>
                                    <td>@foreach ($institutions as $institution)
                                        @if ($institution->id == $otherdeduction->institutionid)
                                            {{ $institution->institutename }}
                                        @endif
                                    @endforeach</td>
                                    <td>{{ $otherdeduction->datefrom }}</td>
                                    <td>{{ $otherdeduction->dateto }}</td>
                                     <td>
                                        <a href="{{ url('showotherdeduction/'.$otherdeduction->id) }}" class="btn btn-primary">View</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('editotherdeduction/'.$otherdeduction->id) }}" class="btn btn-primary">Edit</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('deleteotherdeduction/'.$otherdeduction->id) }}" class="btn btn-danger" onclick="return confirm('Are you sure you want to Delete this record')" >Delete</a>
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