@extends('layouts.pagelayout')
@section('content') <!-- START DATATABLE EXPORT -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">{{$pagetitle}}</h3>
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
                                        <table id="customers2" class="table datatable">
                                            <thead>
                                                <tr>
                                                    <th>retailerid</th>
                                                    <th>Status</th>
                                                    <th>Shop</th>
                                                    <th>Phone</th>
                                                    <th>Region</th>
                                                    <th>District</th>
                                                    <th>Ward</th>
                                                    <th>Village</th>
                                                    <th>latitude</th>
                                                    <th>Longitude</th>
                                                    <th>Start Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	@foreach($retailers as $retailer)
                                                <tr>
                                                    <td>{{$retailer->retailerid}}</td>
                                                    <td>{{$retailer->status}}</td>
                                                    <td>{{$retailer->retailshop}}</td>
                                                    <td>{{$retailer->phone}}</td>
                                                    <td>{{$retailer->region}}</td>
                                                    <td>{{$retailer->district}}</td>
                                                    <td>{{$retailer->ward}}</td>
                                                    <td>{{$retailer->village}}</td>
                                                    <td>{{$retailer->latitude}}</td>
                                                    <td>{{$retailer->longitude}}</td>
                                                    <td>{{$retailer->startdate}}</td>
                                                </tr>
                                                @endforeach
                                              
                                            </tbody>
                                        </table>                                    
                                    </div>
                                </div>
                            </div>
                            <!-- END DATATABLE EXPORT -->  
                            @endsection