<form class="form-default" role="form" action="{{ route('addresses.update', $address_data->id) }}" method="POST">
    @csrf
    <div class="p-3">
        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('Address')}}</label>
            </div>
            <div class="col-md-10">
                <textarea class="form-control mb-3" placeholder="{{ translate('Your Address')}}" rows="2" name="address" required>{{ $address_data->address }}</textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('Country')}}</label>
            </div>
            <div class="col-md-10">
                <div class="mb-3">
                    <select class="form-control aiz-selectpicker" data-live-search="true" data-placeholder="{{ translate('Select your country')}}" name="country" id="edit_country" required>
                        @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                        <option value="{{ $country->name }}" @if($address_data->country == $country->name) selected @endif>
                            {{ $country->name }}
                        </option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        <!-- ///////////////////////////////// -->

        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('Division')}}</label>
            </div>
            <div class="col-md-10">
                <select class="form-control mb-3 aiz-selectpicker" data-live-search="true" name="division" required>
                    <option value="">Select Division</option>
                    @foreach (\App\Models\Division::all() as $key => $division)
                        <option value="{{ $division->name }}" data-divi-id={{ $division->id }} @if($address_data->division == $division->name) selected @endif>{{ $division->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('District')}}</label>
            </div>
            <div class="col-md-10">
                <select class="form-control mb-3 aiz-selectpicker" data-live-search="true" name="district" id="deli-dist" required>
                    <option value="">Select District</option>
                    @foreach (\App\Models\Division::all() as $key => $dis)
                        @foreach ($dis->district as $district )
                            <option value="{{ $district->name }}" data-dist-id={{ $district->id }} @if($address_data->district == $district->name) selected @endif>{{ $district->name }}</option>
                        @endforeach
                    @endforeach
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('Area')}}</label>
            </div>
            <div class="col-md-10">
                <select class="form-control mb-3 aiz-selectpicker" data-live-search="true" name="area" id="deli-area" required>
                    <option value="">Select Area</option>
                    @foreach (\App\Models\District::all() as $key => $are)
                        @foreach ($are->area as $area )
                            <option value="{{ $area->name }}" data-area-id={{ $area->id }} @if($address_data->area == $area->name) selected @endif>{{ $area->name }}</option>
                        @endforeach
                    @endforeach
                </select>
            </div>
        </div>

        <!-- ////////////////////////////// -->

        {{-- <div class="row">
            <div class="col-md-2">
                <label>{{ translate('City')}}</label>
            </div>
            <div class="col-md-10">
                <select class="form-control mb-3 aiz-selectpicker" data-live-search="true" name="city" required>

                </select>
            </div>
        </div> --}}
        
        @if (get_setting('google_map') == 1)
            <div class="row">
                <input id="edit_searchInput" class="controls" type="text" placeholder="Enter a location">
                <div id="edit_map"></div>
                <ul id="geoData">
                    <li style="display: none;">Full Address: <span id="location"></span></li>
                    <li style="display: none;">Postal Code: <span id="postal_code"></span></li>
                    <li style="display: none;">Country: <span id="country"></span></li>
                    <li style="display: none;">Latitude: <span id="lat"></span></li>
                    <li style="display: none;">Longitude: <span id="lon"></span></li>
                </ul>
            </div>

            <div class="row">
                <div class="col-md-2" id="">
                    <label for="exampleInputuname">Longitude</label>
                </div>
                <div class="col-md-10" id="">
                    <input type="text" class="form-control mb-3" id="edit_longitude" name="longitude" value="{{ $address_data->longitude }}" readonly="">
                </div>
            </div>
            <div class="row">
                <div class="col-md-2" id="">
                    <label for="exampleInputuname">Latitude</label>
                </div>
                <div class="col-md-10" id="">
                    <input type="text" class="form-control mb-3" id="edit_latitude" name="latitude" value="{{ $address_data->latitude }}" readonly="">
                </div>
            </div>
        @endif
        
        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('Postal code')}}</label>
            </div>
            <div class="col-md-10">
                <input type="text" class="form-control mb-3" placeholder="{{ translate('Your Postal Code')}}" value="{{ $address_data->postal_code }}" name="postal_code" value="" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>{{ translate('Phone')}}</label>
            </div>
            <div class="col-md-10">
                <input type="text" class="form-control mb-3" placeholder="{{ translate('+880')}}" value="{{ $address_data->phone }}" name="phone" value="" required>
            </div>
        </div>
        <div class="form-group text-right">
            <button type="submit" class="btn btn-sm btn-primary">{{translate('Update')}}</button>
        </div>
    </div>

</form>

@section('script')
    <script type="text/javascript">
        
        $(document).on('change', '[name=division]', function() {
            var division = $('option:selected', this).attr('data-divi-id');
            get_dist(division);
        });

        function get_dist(division) {

            var formData = {
                id : division
            };
            var type = "GET";
            var url = "{{ route('districts.get') }}";

            $.ajax({
                type: type,
                url: url,
                data: formData,
                dataType: 'json',
                success: function (data) {
                    if(data.data.length === 0){
                        var dist = "";
                        dist+=`<option value="">Not found any district</option>`;
                        $('#deli-dist').html(dist);
                        AIZ.plugins.bootstrapSelect('refresh');
                    }else{
                        var dist = "";
                        dist+=`<option value="">Select District</option>`;
                        $.each(data.data , function(index, district) { 
                            dist+=`<option value="${district.name}" data-dist-id=${district.id}>${district.name}</option>`;
                            $('#deli-dist').html(dist);
                            AIZ.plugins.bootstrapSelect('refresh');
                        });
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }

        $(document).on('change', '[name=district]', function() {
            var district = $('option:selected', this).attr('data-dist-id');
            console.log('District id ' + district);
            get_area(district);
        });

        function get_area(district) {

            var formData = {
                id : district
            };
            var type = "GET";
            var url = "{{ route('areas.get') }}";

            $.ajax({
                type: type,
                url: url,
                data: formData,
                dataType: 'json',
                success: function (data) {
                    if(data.data.length === 0){
                        var dist = "";
                        dist+=`<option value="">Not found any area</option>`;
                        $('#deli-area').html(dist);
                        AIZ.plugins.bootstrapSelect('refresh');
                    }else{
                        var dist = "";
                        dist+=`<option value="">Select Area</option>`;
                        $.each(data.data , function(index, area) { 
                            dist+=`<option value="${area.name}">${area.name}</option>`;
                            $('#deli-area').html(dist);
                            AIZ.plugins.bootstrapSelect('refresh');
                        });
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }

    </script>
@endsection