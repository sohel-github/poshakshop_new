@extends('frontend.layouts.user_panel')

@section('panel_content')
    <div class="aiz-titlebar mt-2 mb-4">
      <div class="row align-items-center">
        <div class="col-md-6">
            <h1 class="h3">{{ translate('Manage Profile') }}</h1>
        </div>
      </div>
    </div>

    <!-- Basic Info-->
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{ translate('Basic Info')}}</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('customer.profile.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">{{ translate('Your Name') }}</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" placeholder="{{ translate('Your Name') }}" name="name" value="{{ Auth::user()->name }}">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-md-2 col-form-label">{{ translate('Your Phone') }}</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" placeholder="{{ translate('Your Phone')}}" name="phone" value="{{ Auth::user()->phone }}">
                    </div>
                </div>
                
                <!--<div class="form-group row">-->
                <!--    <label class="col-md-2 col-form-label">{{ translate('Your Phone') }}</label>-->
                <!--    <div class="col-md-10">-->
                <!--        @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)-->
                <!--        <div class="form-group phone-form-group mb-1">-->
                <!--            <input type="tel" id="phone-code" class="form-control" value="{{ Auth::user()->phone }}" placeholder="{{ translate('Your Phone')}}" name="phone" autocomplete="off">-->
                <!--        </div>-->

                <!--        <input type="hidden" name="country_code" value="">-->
                <!--        @endif-->
                <!--    </div>-->
                <!--</div>-->
                
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">{{ translate('Photo') }}</label>
                    <div class="col-md-10">
                        <div class="input-group" data-toggle="aizuploader" data-type="image">
                            <div class="input-group-prepend">
                                <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                            </div>
                            <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                            <input type="hidden" name="photo" value="{{ Auth::user()->avatar_original }}" class="selected-files">
                        </div>
                        <div class="file-preview box sm">
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">{{ translate('Your Password') }}</label>
                    <div class="col-md-10">
                        <input type="password" class="form-control" placeholder="{{ translate('New Password') }}" name="new_password">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">{{ translate('Confirm Password') }}</label>
                    <div class="col-md-10">
                        <input type="password" class="form-control" placeholder="{{ translate('Confirm Password') }}" name="confirm_password">
                    </div>
                </div>

                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-primary">{{translate('Update Profile')}}</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Address -->
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{ translate('Address')}}</h5>
        </div>
        <div class="card-body">
            <div class="row gutters-10">
                @foreach (Auth::user()->addresses as $key => $address)
                    <div class="col-lg-6">
                        <div class="border p-3 pr-5 rounded mb-3 position-relative">
                            <div>
                                <span class="w-50 fw-600">{{ translate('Address') }}:</span>
                                <span class="ml-2">{{ $address->address }}</span>
                            </div>
                            
                            <div>
                                <span class="w-50 fw-600">{{ translate('Country') }}:</span>
                                <span class="ml-2">{{ $address->country }}</span>
                            </div>
                            <div>
                                <span class="w-50 fw-600">{{ translate('Division') }}:</span>
                                <span class="ml-2">{{ $address->division }}</span>
                            </div>
                            <div>
                                <span class="w-50 fw-600">{{ translate('District') }}:</span>
                                <span class="ml-2">{{ $address->district }}</span>
                            </div>
                            <div>
                                <span class="w-50 fw-600">{{ translate('Area') }}:</span>
                                <span class="ml-2">{{ $address->area }}</span>
                            </div>
                            <div>
                                <span class="w-50 fw-600">{{ translate('Postal Code') }}:</span>
                                <span class="ml-2">{{ $address->postal_code }}</span>
                            </div>
                            {{-- <div>
                                <span class="w-50 fw-600">{{ translate('City') }}:</span>
                                <span class="ml-2">{{ $address->city }}</span>
                            </div> --}}
                            <div>
                                <span class="w-50 fw-600">{{ translate('Phone') }}:</span>
                                <span class="ml-2">{{ $address->phone }}</span>
                            </div>
                            @if ($address->set_default)
                                <div class="position-absolute right-0 bottom-0 pr-2 pb-3">
                                    <span class="badge badge-inline badge-primary">{{ translate('Default') }}</span>
                                </div>
                            @endif
                            <div class="dropdown position-absolute right-0 top-0">
                                <button class="btn bg-gray px-2" type="button" data-toggle="dropdown">
                                    <i class="la la-ellipsis-v"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" onclick="edit_address('{{$address->id}}')">
                                        {{ translate('Edit') }}
                                    </a>
                                    @if (!$address->set_default)
                                        <a class="dropdown-item" href="{{ route('addresses.set_default', $address->id) }}">{{ translate('Make This Default') }}</a>
                                    @endif
                                    <a class="dropdown-item" href="{{ route('addresses.destroy', $address->id) }}">{{ translate('Delete') }}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                <div class="col-lg-6 mx-auto" onclick="add_new_address()">
                    <div class="border p-3 rounded mb-3 c-pointer text-center bg-light">
                        <i class="la la-plus la-2x"></i>
                        <div class="alpha-7">{{ translate('Add New Address') }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Email Change -->
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{ translate('Change your email')}}</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('user.change.email') }}" method="POST">
                @csrf
                <div class="row">
                    <div class="col-md-2">
                        <label>{{ translate('Your Email') }}</label>
                    </div>
                    <div class="col-md-10">
                        <div class="input-group mb-3">
                          <input type="email" class="form-control" placeholder="{{ translate('Your Email')}}" name="email" value="{{ Auth::user()->email }}" />
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary new-email-verification">
                                    <span class="d-none loading">
                                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                        {{ translate('Sending Email...') }}
                                    </span>
                                    <span class="default">{{ translate('Verify') }}</span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-primary">{{translate('Update Email')}}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

@endsection

@section('modal')
    <div class="modal fade" id="new-address-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('New Address') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <form class="form-default" role="form" action="{{ route('addresses.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="p-3">
                            <div class="row">
                                <label class="col-md-2 col-form-label">{{ translate('Address') }}</label>
                                <div class="col-md-10">
                                    <textarea class="form-control  mb-3" placeholder="{{ translate('Your Address') }}" rows="1" name="address" required></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-md-2 col-form-label">{{ translate('Country') }}</label>
                                <div class="col-md-10">
                                    <div class="mb-3">
                                        <select class="form-control aiz-selectpicker" data-live-search="true" data-placeholder="{{translate('Select your country')}}" name="country" required>
                                            <option value="">Select Country</option>
                                            @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                                <option value="{{ $country->name }}">{{ $country->name }}</option>
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
                                            <option value="{{ $division->name }}" data-divi-id={{ $division->id }}>{{ $division->name }}</option>
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
                                    <input id="searchInput" class="controls" type="text" placeholder="{{translate('Enter a location')}}">
                                    <div id="map"></div>
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
                                        <input type="text" class="form-control mb-3" id="longitude" name="longitude" readonly="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2" id="">
                                        <label for="exampleInputuname">Latitude</label>
                                    </div>
                                    <div class="col-md-10" id="">
                                        <input type="text" class="form-control mb-3" id="latitude" name="latitude" readonly="">
                                    </div>
                                </div>
                            @endif
                            
                            <div class="row">
                                <label class="col-md-2 col-form-label">{{ translate('Postal code') }}</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control mb-3" placeholder="{{ translate('Your Postal Code')}}" name="postal_code" value="" required>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-md-2 col-form-label">{{ translate('Phone') }}</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control mb-3" placeholder="{{ translate('Your Phone Number')}}" name="phone" value="" required>
                                </div>
                            </div>
                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-address-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('Address Edit') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body" id="edit_modal_body">

                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
<script type="text/javascript">

    // Country code input js
    // var isPhoneShown = true,
    //     countryData = window.intlTelInputGlobals.getCountryData(),
    //     input = document.querySelector("#phone-code");

    // for (var i = 0; i < countryData.length; i++) {
    //     var country = countryData[i];
    //     if(country.iso2 == 'bd'){
    //         country.dialCode = '88';
    //     }
    // }

    // var iti = intlTelInput(input, {
    //     separateDialCode: true,
    //     utilsScript: "{{ static_asset('assets/js/intlTelutils.js') }}?1590403638580",
    //     onlyCountries: @php echo json_encode(\App\Country::where('status', 1)->pluck('code')->toArray()) @endphp,
    //     customPlaceholder: function(selectedCountryPlaceholder, selectedCountryData) {
    //         if(selectedCountryData.iso2 == 'bd'){
    //             return "01xxxxxxxxx";
    //         }
    //         return selectedCountryPlaceholder;
    //     }
    // });

    // var country = iti.getSelectedCountryData();
    // $('input[name=country_code]').val(country.dialCode);

    // input.addEventListener("countrychange", function(e) {
    //     // var currentMask = e.currentTarget.placeholder;

    //     var country = iti.getSelectedCountryData();
    //     $('input[name=country_code]').val(country.dialCode);

    // });
    
    // function toggleEmailPhone(el){
    //     if(isPhoneShown){
    //         $('.phone-form-group').addClass('d-none');
    //         $('.email-form-group').removeClass('d-none');
    //         isPhoneShown = false;
    //         $(el).html('{{ translate('Use Phone Instead') }}');
    //     }
    //     else{
    //         $('.phone-form-group').removeClass('d-none');
    //         $('.email-form-group').addClass('d-none');
    //         isPhoneShown = true;
    //         $(el).html('{{ translate('Use Email Instead') }}');
    //     }
    // }
    // Country code input js end


    function add_new_address(){
        $('#new-address-modal').modal('show');
    }

    $('.new-email-verification').on('click', function() {
        $(this).find('.loading').removeClass('d-none');
        $(this).find('.default').addClass('d-none');
        var email = $("input[name=email]").val();

        $.post('{{ route('user.new.verify') }}', {_token:'{{ csrf_token() }}', email: email}, function(data){
            data = JSON.parse(data);
            $('.default').removeClass('d-none');
            $('.loading').addClass('d-none');
            if(data.status == 2)
                AIZ.plugins.notify('warning', data.message);
            else if(data.status == 1)
                AIZ.plugins.notify('success', data.message);
            else
                AIZ.plugins.notify('danger', data.message);
        });
    });
    
    function edit_address(address) {
        var url = '{{ route("addresses.edit", ":id") }}';
        url = url.replace(':id', address);
        
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: url,
            type: 'GET',
            success: function (response) {
                $('#edit_modal_body').html(response.html);
                $('#edit-address-modal').modal('show');
                AIZ.plugins.bootstrapSelect('refresh');
                
                var country = $("#edit_country").val();
                get_city(country);

                @if (get_setting('google_map') == 1)
                    var lat     = -33.8688;
                    var long    = 151.2195;

                    if(response.data.address_data.latitude && response.data.address_data.longitude) {
                        lat     = response.data.address_data.latitude;
                        long    = response.data.address_data.longitude;
                    }

                    initialize(lat, long, 'edit_');
                @endif
                
            }
        });
    }
    
    $(document).on('change', '[name=country]', function() {
        var country = $(this).val();
        // get_city(country);
    });

    $(document).on('change', '[name=division]', function() {
            var division = $('option:selected', this).attr('data-divi-id');
            console.log('Division id ' + division);
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

    function get_city(country) {
        $('[name="city"]').html("");
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('get-city')}}",
            type: 'POST',
            data: {
                country_name: country
            },
            success: function (response) {
                var obj = JSON.parse(response);
                if(obj != '') {
                    $('[name="city"]').html(obj);
                    AIZ.plugins.bootstrapSelect('refresh');
                }
            }
        });
    }
    
</script>

    @if (get_setting('google_map') == 1)
    
        @include('frontend.partials.google_map')
        
    @endif

@endsection