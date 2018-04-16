@extends('layouts.pagelayout')
@section('content')
 <!-- START BREADCRUMB -->
            
                
                       
                
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                 
                    <div class="row">
                        <div class="col-md-12">
                            
                            <!-- START DATATABLE EXPORT -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><a href="addemployee"> Add new employee </a></h3>
                                    <div class="btn-group pull-right">
                                        <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i> Export Data</button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'false'});"><img src='img/icons/json.png' width="24"/> JSON</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"><img src='img/icons/json.png' width="24"/> JSON (ignoreColumn)</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'true'});"><img src='img/icons/json.png' width="24"/> JSON (with Escape)</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'xml',escape:'false'});"><img src='img/icons/xml.png' width="24"/> XML</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'sql'});"><img src='img/icons/sql.png' width="24"/> SQL</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'csv',escape:'false'});"><img src='img/icons/csv.png' width="24"/> CSV</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'txt',escape:'false'});"><img src='img/icons/txt.png' width="24"/> TXT</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'excel',escape:'false'});"><img src='img/icons/xls.png' width="24"/> XLS</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'doc',escape:'false'});"><img src='img/icons/word.png' width="24"/> Word</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'powerpoint',escape:'false'});"><img src='img/icons/ppt.png' width="24"/> PowerPoint</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'png',escape:'false'});"><img src='img/icons/png.png' width="24"/> PNG</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'pdf',escape:'false'});"><img src='img/icons/pdf.png' width="24"/> PDF</a></li>
                                        </ul>
                                    </div>                                    
                                    
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        @if (Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
                                        <table id="customers2" class="table datatable">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Position</th>
                                                    <th>Status</th>
                                                    <th>Gender</th>
                                                    <th>Start date</th>
                                                    <th>Salary</th>
                                                    <th >Edit</th>
                                                     <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($employees as $employee)
                                                <tr>
                                                    <td>{{$employee->firstname}} {{$employee->middlename}} {{$employee->lastname}}</td>
                                                    <td>{{$employee->jobid}}</td>
                                                    <td>{{$employee->active}}</td>
                                                    <td>{{$employee->gender}}</td>
                                                    <td>{{$employee->hiredate}}</td>
                                                    <td>
                                                   @if($employee->paytype==2)
                                                        {{$employee->hourlyrate}}
                                                       

                                                       @else
                                                    {{$employee->periodrate}}
                                                    
                                                    @endif
                                                </td>
                                                    <th ><a href="{{ URL::to('editemployee/' . $employee->employeeid . '/edit') }}">Edit</a></th>
                                                    <th><a href="{{ URL::to('employeedelete/' . $employee->employeeid) }} " onclick="return confirm('Are you sure you want to delete this Employee?')"; >Delete</a></th>
                                                   <!--  <th><a class="btn btn-sm btn-info btn-block" href="{{ URL::to('editemployee/' . $employee->employeeid . '/edit') }}"
                                                      data-toggle="tooltip" title="Edit">Edit</a> </th> -->
                                                </tr>
                                               
                                               @endforeach
                                               
                                            </tbody>
                                        </table>                                    
                                    </div>
                                </div>
                            </div>
                            <!-- END DATATABLE EXPORT -->                            
                            
            
        @endsection