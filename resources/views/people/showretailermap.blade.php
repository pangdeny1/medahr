@extends('layouts.pagelayout')
@section('content') 
<div class="row">
                        <div class="col-md-6">                        
                            <!-- START GOOGLE MAP WITH MARKER -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">{{$pagetitle}}</h3>
                                </div>
                                <div class="panel-body panel-body-map">
                                    <div id="google_ptm_map" style="width: 100%; height: 500px;"></div>
                                </div>
                            </div>
                            <!-- END GOOGLE MAP WITH MARKER -->
                        </div>  
                         <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
        
         
                       @endsection