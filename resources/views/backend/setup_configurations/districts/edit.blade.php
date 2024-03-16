@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <h5 class="mb-0 h6">{{translate('District')}} | <a href="{{ route('districts.index') }}">Create District</a></h5>
</div>

<div class="row">
  <div class="col-lg-8 mx-auto">
      <div class="card">
          <div class="card-body p-0">
              
              <form class="p-4" action="{{ route('districts.update', $district->id) }}" method="POST">
                  <input name="_method" type="hidden" value="PATCH">
                  @csrf
                  <div class="form-group mb-3">
                      <label for="name">{{translate('Name')}}</label>
                      <input type="text" placeholder="{{translate('Name')}}" value="{{ $district->name }}" name="name" class="form-control" required>
                  </div>

                  <div class="form-group">
                      <label for="country">{{translate('Division')}}</label>
                      <select class="select2 form-control aiz-selectpicker" name="division_id" data-toggle="select2" data-placeholder="Choose ..." data-live-search="true">
                          @foreach ($divisions as $division)
                              <option value="{{ $district->id }}" @if($division->id == $district->division_id) selected @endif>{{ $division->name }}</option>
                          @endforeach
                      </select>
                  </div>

                  <div class="form-group mb-3 text-right">
                      <button type="submit" class="btn btn-primary">{{translate('Update')}}</button>
                  </div>
              </form>
          </div>
      </div>
  </div>
</div>

@endsection