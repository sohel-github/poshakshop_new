@extends('frontend.layouts.app')

@section('content')

    @php
        $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1 ))->get());
        $featured_categories = \App\Category::where('featured', 1)->get();
    @endphp

    {{-- <div class="@if($num_todays_deal > 0) col-lg-12 @else col-lg-12 @endif"></div> --}}

    <div id="new_home_slider">
        @if (get_setting('home_slider_images') != null)
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="aiz-carousel dots-inside-bottom mobile-img-auto-height" data-arrows="true" data-dots="false" data-autoplay="true">
                            @php $slider_images = json_decode(get_setting('home_slider_images'), true);  @endphp
                            @foreach ($slider_images as $key => $value)
                                <div class="carousel-box" id="home_slider">
                                    <a href="{{ json_decode(get_setting('home_slider_links'), true)[$key] }}">
                                        <img
                                            class="d-block mw-100 img-fit shadow-sm overflow-hidden"
                                            src="{{ uploaded_asset($slider_images[$key]) }}"
                                            alt="{{ env('APP_NAME')}}"
                                            @if(count($featured_categories) == 0)
                                            height="550"
                                            @else
                                            height=""
                                            @endif
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                        >
                                        {{-- <div id="home_slider_content">
                                            <h1 class="h1 fw-300 mb-2">{{ json_decode(get_setting('home_slider_title'), true)[$key] }}</h1>
                                            <h3 class="h4 fw-200 mb-0" style="color:#f0ff24;">{{ json_decode(get_setting('home_slider_desc'), true)[$key] }}</h3>
                                        </div> --}}
                                    </a>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        @endif
    </div>


    @php
        $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1 ))->get());
        $featured_categories = \App\Category::where('featured', 1)->get();
    @endphp

    {{-- <div class="container">
        <div class="row">
            <div class="@if($num_todays_deal > 0) col-lg-12 @else col-lg-12 @endif">
                @if (count($featured_categories) > 0)
                    <ul class="list-unstyled mb-0 row gutters-5">
                        @foreach ($featured_categories as $key => $category)
                            <li class="minw-0 col-4 col-md mt-3">
                                <a href="{{ route('products.category', $category->slug) }}" class="d-block rounded bg-white p-2 text-reset shadow-sm">
                                    <div style="overflow: hidden;">
                                    <img
                                        src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                        data-src="{{ uploaded_asset($category->banner) }}"
                                        alt="{{ $category->getTranslation('name') }}"
                                        class="lazyload img-fit"
                                        height="78"
                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                    >
                                    <div class="text-truncate fs-12 fw-600 mt-2 opacity-70">{{ $category->getTranslation('name') }}</div>
                                    </div>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
    </div>

    <br/> --}}


    {{-- Flash Deal --}}
    @php
        $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
    @endphp
    {{-- @if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)
    <section class="mb-4">
        <div class="container">
            <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">

                <div class="d-flex flex-wrap mb-3 align-items-baseline border-bottom">
                    <h3 class="h5 fw-700 mb-0">
                        <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block">{{ translate('Flash Sale') }}</span>
                    </h3>
                    <div class="aiz-count-down ml-auto ml-lg-3 align-items-center" data-date="{{ date('Y/m/d H:i:s', $flash_deal->end_date) }}"></div>
                    <a href="{{ route('flash-deal-details', $flash_deal->slug) }}" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto">{{ translate('View More') }}</a>
                </div>

                <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true'>
                    @foreach ($flash_deal->flash_deal_products as $key => $flash_deal_product)
                        @php
                            $product = \App\Product::find($flash_deal_product->product_id);
                        @endphp
                        @if ($product != null && $product->published != 0)
                            <div class="carousel-box">
                                @include('frontend.partials.product_box_1',['product' => $product])
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    @endif --}}

    {{-- Banner Section 1 --}}
    @if (get_setting('home_banner1_images') != null)
    <div class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                @php $banner_2_imags = json_decode(get_setting('home_banner1_images')); @endphp
                @foreach ($banner_2_imags as $key => $value)
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="{{ json_decode(get_setting('home_banner1_links'), true)[$key] }}" class="d-block text-reset">
                                <img src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_2_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload w-100">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    @endif


    {{-- Featured Section --}}
    <div id="section_featured">

    </div>


    {{-- Banner Section 2 --}}
    @if (get_setting('home_banner2_images') != null)
    <div class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                @php $banner_2_imags = json_decode(get_setting('home_banner2_images')); @endphp
                @foreach ($banner_2_imags as $key => $value)
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="{{ json_decode(get_setting('home_banner2_links'), true)[$key] }}" class="d-block text-reset">
                                <img src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_2_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload w-100">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    @endif

    {{-- Category wise Products --}}
    <div id="section_home_categories">

    </div>

    {{-- Best Selling  --}}
    <div id="section_best_selling">

    </div>

    {{-- Banner Section 3 --}}
    @if (get_setting('home_banner3_images') != null)
    <div class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                @php $banner_2_imags = json_decode(get_setting('home_banner3_images')); @endphp
                @foreach ($banner_2_imags as $key => $value)
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="{{ json_decode(get_setting('home_banner3_links'), true)[$key] }}" class="d-block text-reset">
                                <img src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_2_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload w-100">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    @endif


    {{-- <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="featured_category">
                    <div class="featured_category_header">
                        <h3 class="fs-22 fw-600 text-center">Featured Category</h3>
                        <p class="fs-15 fw-500 text-center">Get Your Desired Product from Featured Category!</p>
                    </div>
                    <div class="featured_category_list">
                        @if (count($featured_categories) > 0)
                            @foreach ($featured_categories as $key => $category)
                                <a href="{{ route('products.category', $category->slug) }}">
                                    <div class="featured_category_list_content">
                                            <img
                                                src="{{ static_asset('assets/img/spin.png') }}"
                                                data-src="{{ uploaded_asset($category->icon) }}"
                                                alt="{{ $category->getTranslation('name') }}"
                                                class="lazyload"
                                                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/spin.png') }}';"
                                            />
                                            <br/>
                                            <p class="fs-13 fw-600" style="padding-top: 10px;">{{ $category->getTranslation('name') }}</p>
                                    </div>
                                </a>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div> --}}

    {{-- <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="featured_product">
                    <div class="featured_product_header">
                        <h3 class="fs-22 fw-600 text-center">Featured Products</h3>
                        <p class="fs-15 fw-500 text-center">Check & Get Your Desired Product!</p>
                    </div>
                    <div class="featured_product_list">
                        @foreach (filter_products(\App\Product::where('published', 1)->where('featured', '1'))->limit(15)->get() as $key => $product)
                            <a href="{{ route('product', $product->slug) }}">
                                <img
                                    class="lazyload mx-auto h-140px h-md-210px"
                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                    alt="{{  $product->getTranslation('name')  }}"
                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                />
                                <p class="fs-14 fw-600 opacity-90" style="margin-top:10px;height: 80px;">{{ $product->getTranslation('name') }}</p>
                                <div class="rating rating-sm mt-1">
                                    {{ renderStarRating($product->rating) }}
                                </div>
                                @if(home_base_price($product) != home_discounted_base_price($product))
                                    <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product) }}</del>
                                @endif
                                <span class="fw-700 text-primary">{{ home_discounted_base_price($product) }}</span>
                            </a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br/> --}}

@endsection

@section('script')
    <script>
        $(document).ready(function(){

            $('#section_featured').html('<div class="siteprogress"></div>');
            // $('#section_featured').html('<div style="display:flex;justify-content:center;align-items:center;margin:20px 0px;"><img src="{{ static_asset('assets/img/dload.gif') }}" /></div>');
            $.post('{{ route('home.section.featured') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_featured').html(data);
                AIZ.plugins.slickCarousel();
            });

            $('#section_best_selling').html('<div class="siteprogress"></div>');
            // $('#section_best_selling').html('<div style="display:flex;justify-content:center;align-items:center;margin:20px 0px;"><img src="{{ static_asset('assets/img/dload.gif') }}" /></div>');
            $.post('{{ route('home.section.best_selling') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_selling').html(data);
                AIZ.plugins.slickCarousel();
            });

            // $('#section_home_categories').html('<div style="display:flex;justify-content:center;align-items:center;margin:20px 0px;"><img src="{{ static_asset('assets/img/dload.gif') }}" /></div>');

            $('#section_home_categories').html('<div class="siteprogress"></div>');

            $.post('{{ route('home.section.home_categories') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_home_categories').html(data);
                AIZ.plugins.slickCarousel();
            });

            @if (get_setting('vendor_system_activation') == 1)
            $.post('{{ route('home.section.best_sellers') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_sellers').html(data);
                AIZ.plugins.slickCarousel();
            });
            @endif

            
        });
    </script>
@endsection