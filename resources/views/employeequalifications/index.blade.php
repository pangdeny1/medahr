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
                    <i class="fa fa-employeequalification"> <a href="{{url('createemployeequalification')}}">Add New employee Qualification </a></i>
                </div>

                <div class="panel-body">
                     @include('includes.flash');
                    @if ($employeequalifications->isEmpty())
                        <p>There are currently no employeequalifications.</p>
                    @else
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>employeequalification Group</th>
                                    <th>employeequalification Name</th>
                                    <th>Status</th>
                                    <th>Last Updated</th>
                                    <th style="text-align:center" colspan="2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($employeequalifications as $employeequalification)
                                <tr>
                                   
                                    <td>
                                        <a href="{{ url('employeequalification/'. $employeequalification->id) }}">
                                            {{ $employeequalification->id }} - {{ $employeequalification->employeequalificationid }}
                                        </a>
                                    </td>
                                    <td>
                                 {{ $employeequalification->employeequalificationdesc }}
                                  
                                    </td>
                                    <td>{{ $employeequalification->updated_at }}</td>
                                     <td>
                                        <a href="{{ url('showemployeequalification/'.$employeequalification->id) }}" class="btn btn-primary">View</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('editemployeequalification/'.$employeequalification->id) }}" class="btn btn-primary">Edit</a>
                                    </td>
                                    <td>
                                        <a href="{{ url('deleteemployeequalification/'.$employeequalification->id) }}" class="btn btn-danger" onclick="return confirm('Are you sure you want to Delete this record')" >Delete</a>
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