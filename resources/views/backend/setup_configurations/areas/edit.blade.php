@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <h5 class="mb-0 h6">{{translate('Edit Area')}} | <a href="{{ route('areas.index') }}">Create Area</a></h5>
</div>

<div class="row">
  <div class="col-lg-8 mx-auto">
      <div class="card">
          <div class="card-body p-0">

            {{-- {{ dd($areas) }} --}}
              
              <form class="p-4" action="{{ route('areas.update', $areas->id) }}" method="POST">
                  <input name="_method" type="hidden" value="PATCH">
                  @csrf
                  <div class="form-group mb-3">
                      <label for="name">{{translate('Name')}}</label>
                      <input type="text" placeholder="{{translate('Name')}}" value="{{ $areas->name }}" name="name" class="form-control" required>
                  </div>

                  <div class="form-group">
                      <label for="country">{{translate('District')}}</label>
                      <select class="select2 form-control aiz-selectpicker" name="district_id" data-toggle="select2" data-placeholder="Choose ..." data-live-search="true">
                          @foreach ($districts as $district)
                          {{-- {{ dd($district) }} --}}
                              <option value="{{ $district->id }}" @if($district->id == $areas->district_id) selected @endif>{{ $district->name }}</option>
                          @endforeach
                      </select>
                  </div>

                  <div class="form-group mb-3">
                      <label for="cost">{{translate('Cost')}}</label>
                      <input type="text" placeholder="{{translate('Cost')}}" value="{{ $areas->cost }}" name="cost" class="form-control" required>
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