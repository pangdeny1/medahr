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

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/addinstitution') }}">
                        {!! csrf_field() !!}


                                 

                        <div class="form-group{{ $errors->has('InstituteName') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Institute Name</label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control" name="InstituteName" value="{{ old('InstituteName') }}">

                                @if ($errors->has('InstituteName'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('InstituteName') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                         <div class="form-group{{ $errors->has('country') ? ' has-error' : '' }}">
                            <label for="title" class="col-md-4 control-label">Country</label>

                            <div class="col-md-6">
                               <select class="form-control select" name="country">

                                           <option value="">Select Country </option>
                                                       
                                                         @foreach($countries as $country)
                                                        
                                                   <option value="{{ $country->id }}">{{ $country->countryname }}</option>
                                                    
                                                          @endforeach
                                                      </select>
                                @if ($errors->has('country'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('country') }}</strong>
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