<!DOCTYPE html>
@if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
<html dir="rtl" lang="{{ str_replace('_', '-', app()->getLocale()) }}">
@else
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
@endif
<head>

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="app-url" content="{{ getBaseURL() }}">
    <meta name="file-base-url" content="{{ getFileBaseURL() }}">

    <title>@yield('meta_title', get_setting('website_name').' | '.get_setting('site_motto'))</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <meta name="description" content="@yield('meta_description', get_setting('meta_description') )" />
    <meta name="keywords" content="@yield('meta_keywords', get_setting('meta_keywords') )">

    @yield('meta')

    @if(!isset($detailedProduct) && !isset($customer_product) && !isset($shop) && !isset($page) && !isset($blog))
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ get_setting('meta_title') }}">
    <meta itemprop="description" content="{{ get_setting('meta_description') }}">
    <meta itemprop="image" content="{{ uploaded_asset(get_setting('meta_image')) }}">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="product">
    <meta name="twitter:site" content="@publisher_handle">
    <meta name="twitter:title" content="{{ get_setting('meta_title') }}">
    <meta name="twitter:description" content="{{ get_setting('meta_description') }}">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image" content="{{ uploaded_asset(get_setting('meta_image')) }}">

    <!-- Open Graph data -->
    <meta property="og:title" content="{{ get_setting('meta_title') }}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{{ route('home') }}" />
    <meta property="og:image" content="{{ uploaded_asset(get_setting('meta_image')) }}" />
    <meta property="og:description" content="{{ get_setting('meta_description') }}" />
    <meta property="og:site_name" content="{{ env('APP_NAME') }}" />
    <meta property="fb:app_id" content="{{ env('FACEBOOK_PIXEL_ID') }}">
    @endif

    <!-- Favicon -->
    <link rel="icon" href="{{ uploaded_asset(get_setting('site_icon')) }}">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ static_asset('assets/css/vendors.css') }}">
    @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
    <link rel="stylesheet" href="{{ static_asset('assets/css/bootstrap-rtl.min.css') }}">
    @endif
    <link rel="stylesheet" href="{{ static_asset('assets/css/aiz-core.css') }}">
    <link rel="stylesheet" href="{{ asset('public/assets/css/custom-style.css') }}">


    <script>
        var AIZ = AIZ || {};
        AIZ.local = {
            nothing_selected: '{{ translate('Nothing selected') }}',
            nothing_found: '{{ translate('Nothing found') }}',
            choose_file: '{{ translate('Choose file') }}',
            file_selected: '{{ translate('File selected') }}',
            files_selected: '{{ translate('Files selected') }}',
            add_more_files: '{{ translate('Add more files') }}',
            adding_more_files: '{{ translate('Adding more files') }}',
            drop_files_here_paste_or: '{{ translate('Drop files here, paste or') }}',
            browse: '{{ translate('Browse') }}',
            upload_complete: '{{ translate('Upload complete') }}',
            upload_paused: '{{ translate('Upload paused') }}',
            resume_upload: '{{ translate('Resume upload') }}',
            pause_upload: '{{ translate('Pause upload') }}',
            retry_upload: '{{ translate('Retry upload') }}',
            cancel_upload: '{{ translate('Cancel upload') }}',
            uploading: '{{ translate('Uploading') }}',
            processing: '{{ translate('Processing') }}',
            complete: '{{ translate('Complete') }}',
            file: '{{ translate('File') }}',
            files: '{{ translate('Files') }}',
        }
    </script>

    <style>
        body{
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
        }
        :root{
            --primary: {{ get_setting('base_color', '#e62d04') }};
            --hov-primary: {{ get_setting('base_hov_color', '#c52907') }};
            --soft-primary: {{ hex2rgba(get_setting('base_color','#e62d04'),.15) }};
        }

        #map{
            width: 100%;
            height: 250px;
        }
        #edit_map{
            width: 100%;
            height: 250px;
        }

        .pac-container { z-index: 100000; }
    </style>
    @yield('styles')
@if (get_setting('google_analytics') == 1)
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ env('TRACKING_ID') }}"></script>

    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{{ env('TRACKING_ID') }}');
    </script>
@endif

@if (get_setting('facebook_pixel') == 1)
    <!-- Facebook Pixel Code -->
    <script>
        !function(f,b,e,v,n,t,s)
        {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '{{ env('FACEBOOK_PIXEL_ID') }}');
        fbq('track', 'PageView');
    </script>
    <noscript>
        <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id={{ env('FACEBOOK_PIXEL_ID') }}&ev=PageView&noscript=1"/>
    </noscript>
    <!-- End Facebook Pixel Code -->
@endif

@php
    echo get_setting('header_script');
@endphp

</head>
<body>
    <!-- aiz-main-wrapper -->
    <div class="aiz-main-wrapper d-flex flex-column">

        <!-- Header -->
        @include('frontend.inc.nav')

        @yield('content')

        @include('frontend.inc.footer')

    </div>

    @if (get_setting('show_cookies_agreement') == 'on')
        <div class="aiz-cookie-alert shadow-xl">
            <div class="p-3 bg-dark rounded">
                <div class="text-white mb-3">
                    @php
                        echo get_setting('cookies_agreement_text');
                    @endphp
                </div>
                <button class="btn btn-primary aiz-cookie-accept">
                    {{ translate('Ok. I Understood') }}
                </button>
            </div>
        </div>
    @endif

    @if (get_setting('show_website_popup') == 'on')
        <div class="modal website-popup removable-session d-none" data-key="website-popup" data-value="removed">
            <div class="absolute-full bg-black opacity-60"></div>
            <div class="modal-dialog modal-dialog-centered modal-dialog-zoom modal-md">
                <div class="modal-content position-relative border-0 rounded-0">
                    <div class="aiz-editor-data">
                        {!! get_setting('website_popup_content') !!}
                    </div>
                    @if (get_setting('show_subscribe_form') == 'on')
                        <div class="pb-5 pt-4 px-5">
                            <form class="" method="POST" action="{{ route('subscribers.store') }}">
                                @csrf
                                <div class="form-group mb-0">
                                    <input type="email" class="form-control" placeholder="{{ translate('Your Email Address') }}" name="email" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block mt-3">
                                    {{ translate('Subscribe Now') }}
                                </button>
                            </form>
                        </div>
                    @endif
                    <button class="absolute-top-right bg-white shadow-lg btn btn-circle btn-icon mr-n3 mt-n3 set-session" data-key="website-popup" data-value="removed" data-toggle="remove-parent" data-parent=".website-popup">
                        <i class="la la-close fs-20"></i>
                    </button>
                </div>
            </div>
        </div>
    @endif

    @include('frontend.partials.modal')

    <!-- Modal -->
    <div class="modal fade" id="sizeGuide" tabindex="-1" role="dialog" aria-labelledby="sizeGuideModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title " id="exampleModalLabel">Size Guide</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div id="sizeContent"></div>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="addToCart">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom product-modal" id="modal-size" role="document">
            <div class="modal-content position-relative">
                <div class="c-preloader text-center p-3">
                    <i class="las la-spinner la-spin la-3x"></i>
                </div>
                <button type="button" class="close absolute-top-right btn-icon close z-1" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="la-2x">&times;</span>
                </button>
                <div id="addToCart-modal-body">

                </div>
            </div>
        </div>
    </div>

    @yield('modal')

    <!-- SCRIPTS -->
    <script src="{{ static_asset('assets/js/vendors.js') }}"></script>
    <script src="{{ static_asset('assets/js/aiz-core.js') }}"></script>



    @if (get_setting('facebook_chat') == 1)
        <script type="text/javascript">
            window.fbAsyncInit = function() {
                FB.init({
                  xfbml            : true,
                  version          : 'v3.3'
                });
              };

              (function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <div id="fb-root"></div>
        <!-- Your customer chat code -->
        <div class="fb-customerchat"
          attribution=setup_tool
          page_id="{{ env('FACEBOOK_PAGE_ID') }}">
        </div>
    @endif

    <script>
        @foreach (session('flash_notification', collect())->toArray() as $message)
            AIZ.plugins.notify('{{ $message['level'] }}', '{{ $message['message'] }}');
        @endforeach
    </script>

    <script>

        $(document).ready(function() {

            $('.grid-wrapper > div:nth-child(3)').addClass('grid-wrapper tall');
            $('.grid-wrapper > div:nth-child(4)').addClass('grid-wrapper wide');
            $('.grid-wrapper > div:nth-child(6)').addClass('grid-wrapper tall');
            $('.grid-wrapper > div:nth-child(7)').addClass('grid-wrapper big');
            $('.grid-wrapper > div:nth-child(9)').addClass('grid-wrapper tall');
            

            $('.category-nav-element').each(function(i, el) {
                $(el).on('mouseover', function(){
                    if(!$(el).find('.sub-cat-menu').hasClass('loaded')){
                        $.post('{{ route('category.elements') }}', {_token: AIZ.data.csrf, id:$(el).data('id')}, function(data){
                            $(el).find('.sub-cat-menu').addClass('loaded').html(data);
                        });
                    }
                });
            });
            if ($('#lang-change').length > 0) {
                $('#lang-change .dropdown-menu a').each(function() {
                    $(this).on('click', function(e){
                        e.preventDefault();
                        var $this = $(this);
                        var locale = $this.data('flag');
                        $.post('{{ route('language.change') }}',{_token: AIZ.data.csrf, locale:locale}, function(data){
                            location.reload();
                        });

                    });
                });
            }

            if ($('#currency-change').length > 0) {
                $('#currency-change .dropdown-menu a').each(function() {
                    $(this).on('click', function(e){
                        e.preventDefault();
                        var $this = $(this);
                        var currency_code = $this.data('currency');
                        $.post('{{ route('currency.change') }}',{_token: AIZ.data.csrf, currency_code:currency_code}, function(data){
                            location.reload();
                        });

                    });
                });
            }
        });

        $('#search').on('keyup', function(){
            search();
        });

        $('#search').on('focus', function(){
            search();
        });

        function search(){
            var searchKey = $('#search').val();
            if(searchKey.length > 0){
                $('body').addClass("typed-search-box-shown");

                $('.typed-search-box').removeClass('d-none');
                $('.search-preloader').removeClass('d-none');
                $.post('{{ route('search.ajax') }}', { _token: AIZ.data.csrf, search:searchKey}, function(data){
                    if(data == '0'){
                        // $('.typed-search-box').addClass('d-none');
                        $('#search-content').html(null);
                        $('.typed-search-box .search-nothing').removeClass('d-none').html('Sorry, nothing found for <strong>"'+searchKey+'"</strong>');
                        $('.search-preloader').addClass('d-none');

                    }
                    else{
                        $('.typed-search-box .search-nothing').addClass('d-none').html(null);
                        $('#search-content').html(data);
                        $('.search-preloader').addClass('d-none');
                    }
                });
            }
            else {
                $('.typed-search-box').addClass('d-none');
                $('body').removeClass("typed-search-box-shown");
            }
        }

        function updateNavCart(view,count){
            $('.cart-count').html(count);
            $('#cart_items').html(view);
        }

        function removeFromCart(key){
            $.post('{{ route('cart.removeFromCart') }}', {
                _token  : AIZ.data.csrf,
                id      :  key
            }, function(data){
                updateNavCart(data.nav_cart_view,data.cart_count);
                $('#cart-summary').html(data.cart_view);
                AIZ.plugins.notify('success', "{{ translate('Item has been removed from cart') }}");
                $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html())-1);
            });
        }

        function addToCompare(id){
            $.post('{{ route('compare.addToCompare') }}', {_token: AIZ.data.csrf, id:id}, function(data){
                $('#compare').html(data);
                AIZ.plugins.notify('success', "{{ translate('Item has been added to compare list') }}");
                $('#compare_items_sidenav').html(parseInt($('#compare_items_sidenav').html())+1);
            });
        }

        function addToWishList(id){
            @if (Auth::check() && (Auth::user()->user_type == 'customer' || Auth::user()->user_type == 'seller'))
                $.post('{{ route('wishlists.store') }}', {_token: AIZ.data.csrf, id:id}, function(data){
                    if(data != 0){
                        $('#wishlist').html(data);
                        AIZ.plugins.notify('success', "{{ translate('Item has been added to wishlist') }}");
                    }
                    else{
                        AIZ.plugins.notify('warning', "{{ translate('Please login first') }}");
                    }
                });
            @else
                AIZ.plugins.notify('warning', "{{ translate('Please login first') }}");
            @endif
        }

        function showAddToCartModal(id){
            if(!$('#modal-size').hasClass('modal-lg')){
                $('#modal-size').addClass('modal-lg');
            }
            $('#addToCart-modal-body').html(null);
            $('#addToCart').modal();
            $('.c-preloader').show();
            $.post('{{ route('cart.showCartModal') }}', {_token: AIZ.data.csrf, id:id}, function(data){
                $('.c-preloader').hide();
                $('#addToCart-modal-body').html(data);
                AIZ.plugins.slickCarousel();
                AIZ.plugins.zoom();
                AIZ.extra.plusMinus();
                getVariantPrice();
            });
        }

        // direct addToCart
        function directAddToCartModal(id){
            if(!$('#modal-size').hasClass('modal-lg')){
                $('#modal-size').addClass('modal-lg');
            }
            $('#addToCart-modal-body').html(null);
            $('#addToCart').modal();
            $('.c-preloader').show();
            $.post('{{ route('cart.addToCart') }}', {_token: AIZ.data.csrf, id:id, quantity:1}, function(data){
                $('#addToCart-modal-body').html(null);
                $('.c-preloader').hide();
                $('#modal-size').removeClass('modal-lg');
                $('#addToCart-modal-body').html(data.modal_view);
                AIZ.plugins.notify('success', "{{ translate('Item has been added to cart') }}");
                AIZ.extra.plusMinus();
                updateNavCart(data.nav_cart_view,data.cart_count);
            });
        }

        $('#option-choice-form input').on('change', function(){
            getVariantPrice();
        });

        function getVariantPrice(){
            if($('#option-choice-form input[name=quantity]').val() > 0 && checkAddToCartValidity()){
                $.ajax({
                   type:"POST",
                   url: '{{ route('products.variant_price') }}',
                   data: $('#option-choice-form').serializeArray(),
                   success: function(data){

                        $('.product-gallery-thumb .carousel-box').each(function (i) {
                            if($(this).data('variation') && data.variation == $(this).data('variation')){
                                $('.product-gallery-thumb').slick('slickGoTo', i);
                            }
                        })

                       $('#option-choice-form #chosen_price_div').removeClass('d-none');
                       $('#option-choice-form #chosen_price_div #chosen_price').html(data.price);
                       $('#available-quantity').html(data.quantity);
                       $('.input-number').prop('max', data.max_limit);
                       if(parseInt(data.in_stock) == 0 && data.digital  == 0){
                           $('.buy-now').addClass('d-none');
                           $('.add-to-cart').addClass('d-none');
                           $('.out-of-stock').removeClass('d-none');
                       }
                       else{
                           $('.buy-now').removeClass('d-none');
                           $('.add-to-cart').removeClass('d-none');
                           $('.out-of-stock').addClass('d-none');
                       }
                   }
               });
            }
        }

        function checkAddToCartValidity(){
            var names = {};
            $('#option-choice-form input:radio').each(function() { // find unique names
                  names[$(this).attr('name')] = true;
            });
            var count = 0;
            $.each(names, function() { // then count them
                  count++;
            });

            if($('#option-choice-form input:radio:checked').length == count){
                return true;
            }

            return false;
        }

        function addToCart(){
            if(checkAddToCartValidity()) {
                $('#addToCart').modal();
                $('.c-preloader').show();
                $.ajax({
                    type:"POST",
                    url: '{{ route('cart.addToCart') }}',
                    data: $('#option-choice-form').serializeArray(),
                    success: function(data){

                       $('#addToCart-modal-body').html(null);
                       $('.c-preloader').hide();
                       $('#modal-size').removeClass('modal-lg');
                       $('#addToCart-modal-body').html(data.modal_view);
                       AIZ.extra.plusMinus();
                       updateNavCart(data.nav_cart_view,data.cart_count);
                    }
                });
            }
            else{
                AIZ.plugins.notify('warning', "{{ translate('Please choose all the options') }}");
            }
        }

        function buyNow(){
            if(checkAddToCartValidity()) {
                $('#addToCart-modal-body').html(null);
                $('#addToCart').modal();
                $('.c-preloader').show();
                $.ajax({
                   type:"POST",
                   url: '{{ route('cart.addToCart') }}',
                   data: $('#option-choice-form').serializeArray(),
                   success: function(data){
                       if(data.status == 1){

                            $('#addToCart-modal-body').html(data.modal_view);
                            updateNavCart(data.nav_cart_view,data.cart_count);

                            window.location.replace("{{ route('cart') }}");
                       }
                       else{
                            $('#addToCart-modal-body').html(null);
                            $('.c-preloader').hide();
                            $('#modal-size').removeClass('modal-lg');
                            $('#addToCart-modal-body').html(data.modal_view);
                       }
                   }
               });
            }
            else{
                AIZ.plugins.notify('warning', "{{ translate('Please choose all the options') }}");
            }
        }

        function show_purchase_history_details(order_id)
        {
            $('#order-details-modal-body').html(null);

            if(!$('#modal-size').hasClass('modal-lg')){
                $('#modal-size').addClass('modal-lg');
            }

            $.post('{{ route('purchase_history.details') }}', { _token : AIZ.data.csrf, order_id : order_id}, function(data){
                $('#order-details-modal-body').html(data);
                $('#order_details').modal();
                $('.c-preloader').hide();
            });
        }


        /* nav js 991 */

        !(function(n, i, e, a) {
          ;(n.navigation = function(t, s) {
            var o = {
                responsive: !0,
                mobileBreakpoint: 1024,
                showDuration: 200,
                hideDuration: 200,
                showDelayDuration: 0,
                hideDelayDuration: 0,
                submenuTrigger: "hover",
                effect: "fadeIn",
                submenuIndicator: !0,
                submenuIndicatorTrigger: !1,
                hideSubWhenGoOut: !0,
                visibleSubmenusOnMobile: !1,
                fixed: !1,
                overlay: !0,
                overlayColor: "rgba(0, 0, 0, 0.5)",
                hidden: !1,
                hiddenOnMobile: !1,
                offCanvasSide: "left",
                offCanvasCloseButton: !0,
                animationOnShow: "",
                animationOnHide: "",
                onInit: function() {},
                onLandscape: function() {},
                onPortrait: function() {},
                onShowOffCanvas: function() {},
                onHideOffCanvas: function() {}
              },
              r = this,
              u = Number.MAX_VALUE,
              d = 1,
              l = "click.nav touchstart.nav",
              f = "mouseenter focusin",
              c = "mouseleave focusout"
            r.settings = {}
            var t = (n(t), t)
            n(t).find(".nav-search").length > 0 &&
              n(t)
                .find(".nav-search")
                .find("form")
                .prepend(
                  "<span class='nav-search-close-button' tabindex='0'>&#10005;</span>"
                ),
              (r.init = function() {
                ;(r.settings = n.extend({}, o, s)),
                  r.settings.offCanvasCloseButton &&
                    n(t)
                      .find(".nav-menus-wrapper")
                      .prepend(
                        "<span class='nav-menus-wrapper-close-button'>&#10005;</span>"
                      ),
                  "right" == r.settings.offCanvasSide &&
                    n(t)
                      .find(".nav-menus-wrapper")
                      .addClass("nav-menus-wrapper-right"),
                  r.settings.hidden &&
                    (n(t).addClass("navigation-hidden"),
                    (r.settings.mobileBreakpoint = 99999)),
                  v(),
                  r.settings.fixed && n(t).addClass("navigation-fixed"),
                  n(t)
                    .find(".nav-toggle")
                    .on("click touchstart", function(n) {
                      n.stopPropagation(),
                        n.preventDefault(),
                        r.showOffcanvas(),
                        s !== a && r.callback("onShowOffCanvas")
                    }),
                  n(t)
                    .find(".nav-menus-wrapper-close-button")
                    .on("click touchstart", function() {
                      r.hideOffcanvas(), s !== a && r.callback("onHideOffCanvas")
                    }),
                  n(t)
                    .find(".nav-search-button, .nav-search-close-button")
                    .on("click touchstart keydown", function(i) {
                      i.stopPropagation(), i.preventDefault()
                      var e = i.keyCode || i.which
                      "click" === i.type ||
                      "touchstart" === i.type ||
                      ("keydown" === i.type && 13 == e)
                        ? r.toggleSearch()
                        : 9 == e && n(i.target).blur()
                    }),
                  n(t).find(".megamenu-tabs").length > 0 && y(),
                  n(i).resize(function() {
                    r.initNavigationMode(C()), O(), r.settings.hiddenOnMobile && m()
                  }),
                  r.initNavigationMode(C()),
                  r.settings.hiddenOnMobile && m(),
                  s !== a && r.callback("onInit")
              })
            var h = function() {
                n(t)
                  .find(".nav-submenu")
                  .hide(0),
                  n(t)
                    .find("li")
                    .removeClass("focus")
              },
              v = function() {
                n(t)
                  .find("li")
                  .each(function() {
                    n(this).children(".nav-dropdown,.megamenu-panel").length > 0 &&
                      (n(this)
                        .children(".nav-dropdown,.megamenu-panel")
                        .addClass("nav-submenu"),
                      r.settings.submenuIndicator &&
                        n(this)
                          .children("a")
                          .append(
                            "<span class='submenu-indicator'><span class='submenu-indicator-chevron'></span></span>" // <span class='submenu-indicator'><span class='submenu-indicator-chevron'></span></span>
                          ))
                  })
              },
              m = function() {
                n(t).hasClass("navigation-portrait")
                  ? n(t).addClass("navigation-hidden")
                  : n(t).removeClass("navigation-hidden")
              }
            ;(r.showSubmenu = function(i, e) {
              C() > r.settings.mobileBreakpoint &&
                n(t)
                  .find(".nav-search")
                  .find("form")
                  .fadeOut(),
                "fade" == e
                  ? n(i)
                      .children(".nav-submenu")
                      .stop(!0, !0)
                      .delay(r.settings.showDelayDuration)
                      .fadeIn(r.settings.showDuration)
                      .removeClass(r.settings.animationOnHide)
                      .addClass(r.settings.animationOnShow)
                  : n(i)
                      .children(".nav-submenu")
                      .stop(!0, !0)
                      .delay(r.settings.showDelayDuration)
                      .slideDown(r.settings.showDuration)
                      .removeClass(r.settings.animationOnHide)
                      .addClass(r.settings.animationOnShow),
                n(i).addClass("focus")
            }),
              (r.hideSubmenu = function(i, e) {
                "fade" == e
                  ? n(i)
                      .find(".nav-submenu")
                      .stop(!0, !0)
                      .delay(r.settings.hideDelayDuration)
                      .fadeOut(r.settings.hideDuration)
                      .removeClass(r.settings.animationOnShow)
                      .addClass(r.settings.animationOnHide)
                  : n(i)
                      .find(".nav-submenu")
                      .stop(!0, !0)
                      .delay(r.settings.hideDelayDuration)
                      .slideUp(r.settings.hideDuration)
                      .removeClass(r.settings.animationOnShow)
                      .addClass(r.settings.animationOnHide),
                  n(i)
                    .removeClass("focus")
                    .find(".focus")
                    .removeClass("focus")
              })
            var p = function() {
                n("body").addClass("no-scroll"),
                  r.settings.overlay &&
                    (n(t).append("<div class='nav-overlay-panel'></div>"),
                    n(t)
                      .find(".nav-overlay-panel")
                      .css("background-color", r.settings.overlayColor)
                      .fadeIn(300)
                      .on("click touchstart", function(n) {
                        r.hideOffcanvas()
                      }))
              },
              g = function() {
                n("body").removeClass("no-scroll"),
                  r.settings.overlay &&
                    n(t)
                      .find(".nav-overlay-panel")
                      .fadeOut(400, function() {
                        n(this).remove()
                      })
              }
            ;(r.showOffcanvas = function() {
              p(),
                "left" == r.settings.offCanvasSide
                  ? n(t)
                      .find(".nav-menus-wrapper")
                      .css("transition-property", "left")
                      .addClass("nav-menus-wrapper-open")
                  : n(t)
                      .find(".nav-menus-wrapper")
                      .css("transition-property", "right")
                      .addClass("nav-menus-wrapper-open")
            }),
              (r.hideOffcanvas = function() {
                n(t)
                  .find(".nav-menus-wrapper")
                  .removeClass("nav-menus-wrapper-open")
                  .on(
                    "webkitTransitionEnd moztransitionend transitionend oTransitionEnd",
                    function() {
                      n(t)
                        .find(".nav-menus-wrapper")
                        .css("transition-property", "none")
                        .off()
                    }
                  ),
                  g()
              }),
              (r.toggleOffcanvas = function() {
                C() <= r.settings.mobileBreakpoint &&
                  (n(t)
                    .find(".nav-menus-wrapper")
                    .hasClass("nav-menus-wrapper-open")
                    ? (r.hideOffcanvas(), s !== a && r.callback("onHideOffCanvas"))
                    : (r.showOffcanvas(), s !== a && r.callback("onShowOffCanvas")))
              }),
              (r.toggleSearch = function() {
                "none" ==
                n(t)
                  .find(".nav-search")
                  .find("form")
                  .css("display")
                  ? (n(t)
                      .find(".nav-search")
                      .find("form")
                      .fadeIn(200),
                    n(t)
                      .find(".nav-search")
                      .find("input")
                      .focus())
                  : (n(t)
                      .find(".nav-search")
                      .find("form")
                      .fadeOut(200),
                    n(t)
                      .find(".nav-search")
                      .find("input")
                      .blur())
              }),
              (r.initNavigationMode = function(i) {
                r.settings.responsive
                  ? (i <= r.settings.mobileBreakpoint &&
                      u > r.settings.mobileBreakpoint &&
                      (n(t)
                        .addClass("navigation-portrait")
                        .removeClass("navigation-landscape"),
                      S(),
                      s !== a && r.callback("onPortrait")),
                    i > r.settings.mobileBreakpoint &&
                      d <= r.settings.mobileBreakpoint &&
                      (n(t)
                        .addClass("navigation-landscape")
                        .removeClass("navigation-portrait"),
                      k(),
                      g(),
                      r.hideOffcanvas(),
                      s !== a && r.callback("onLandscape")),
                    (u = i),
                    (d = i))
                  : (n(t).addClass("navigation-landscape"),
                    k(),
                    s !== a && r.callback("onLandscape"))
              })
            var b = function() {
                n("html").on("click.body touchstart.body", function(i) {
                  0 === n(i.target).closest(".navigation").length &&
                    (n(t)
                      .find(".nav-submenu")
                      .fadeOut(),
                    n(t)
                      .find(".focus")
                      .removeClass("focus"),
                    n(t)
                      .find(".nav-search")
                      .find("form")
                      .fadeOut())
                })
              },
              C = function() {
                return (
                  i.innerWidth || e.documentElement.clientWidth || e.body.clientWidth
                )
              },
              w = function() {
                n(t)
                  .find(".nav-menu")
                  .find("li, a")
                  .off(l)
                  .off(f)
                  .off(c)
              },
              O = function() {
                if (C() > r.settings.mobileBreakpoint) {
                  var i = n(t).outerWidth(!0)
                  n(t)
                    .find(".nav-menu")
                    .children("li")
                    .children(".nav-submenu")
                    .each(function() {
                      n(this)
                        .parent()
                        .position().left +
                        n(this).outerWidth() >
                      i
                        ? n(this).css("right", 0)
                        : n(this).css("right", "auto")
                    })
                }
              },
              y = function() {
                function i(i) {
                  var e = n(i)
                      .children(".megamenu-tabs-nav")
                      .children("li"),
                    a = n(i).children(".megamenu-tabs-pane")
                  n(e).on("click.tabs touchstart.tabs", function(i) {
                    i.stopPropagation(),
                      i.preventDefault(),
                      n(e).removeClass("active"),
                      n(this).addClass("active"),
                      n(a)
                        .hide(0)
                        .removeClass("active"),
                      n(a[n(this).index()])
                        .show(0)
                        .addClass("active")
                  })
                }
                if (n(t).find(".megamenu-tabs").length > 0)
                  for (var e = n(t).find(".megamenu-tabs"), a = 0; a < e.length; a++)
                    i(e[a])
              },
              k = function() {
                w(),
                  h(),
                  navigator.userAgent.match(/Mobi/i) ||
                  navigator.maxTouchPoints > 0 ||
                  "click" == r.settings.submenuTrigger
                    ? n(t)
                        .find(".nav-menu, .nav-dropdown")
                        .children("li")
                        .children("a")
                        .on(l, function(e) {
                          if (
                            (r.hideSubmenu(
                              n(this)
                                .parent("li")
                                .siblings("li"),
                              r.settings.effect
                            ),
                            n(this)
                              .closest(".nav-menu")
                              .siblings(".nav-menu")
                              .find(".nav-submenu")
                              .fadeOut(r.settings.hideDuration),
                            n(this).siblings(".nav-submenu").length > 0)
                          ) {
                            if (
                              (e.stopPropagation(),
                              e.preventDefault(),
                              "none" ==
                                n(this)
                                  .siblings(".nav-submenu")
                                  .css("display"))
                            )
                              return (
                                r.showSubmenu(
                                  n(this).parent("li"),
                                  r.settings.effect
                                ),
                                O(),
                                !1
                              )
                            if (
                              (r.hideSubmenu(n(this).parent("li"), r.settings.effect),
                              "_blank" === n(this).attr("target") ||
                                "blank" === n(this).attr("target"))
                            )
                              i.open(n(this).attr("href"))
                            else {
                              if (
                                "#" === n(this).attr("href") ||
                                "" === n(this).attr("href") ||
                                "javascript:void(0)" === n(this).attr("href")
                              )
                                return !1
                              i.location.href = n(this).attr("href")
                            }
                          }
                        })
                    : n(t)
                        .find(".nav-menu")
                        .find("li")
                        .on(f, function() {
                          r.showSubmenu(this, r.settings.effect), O()
                        })
                        .on(c, function() {
                          r.hideSubmenu(this, r.settings.effect)
                        }),
                  r.settings.hideSubWhenGoOut && b()
              },
              S = function() {
                w(),
                  h(),
                  r.settings.visibleSubmenusOnMobile
                    ? n(t)
                        .find(".nav-submenu")
                        .show(0)
                    : (n(t)
                        .find(".submenu-indicator")
                        .removeClass("submenu-indicator-up"),
                      r.settings.submenuIndicator &&
                      r.settings.submenuIndicatorTrigger
                        ? n(t)
                            .find(".submenu-indicator")
                            .on(l, function(i) {
                              return (
                                i.stopPropagation(),
                                i.preventDefault(),
                                r.hideSubmenu(
                                  n(this)
                                    .parent("a")
                                    .parent("li")
                                    .siblings("li"),
                                  "slide"
                                ),
                                r.hideSubmenu(
                                  n(this)
                                    .closest(".nav-menu")
                                    .siblings(".nav-menu")
                                    .children("li"),
                                  "slide"
                                ),
                                "none" ==
                                n(this)
                                  .parent("a")
                                  .siblings(".nav-submenu")
                                  .css("display")
                                  ? (n(this).addClass("submenu-indicator-up"),
                                    n(this)
                                      .parent("a")
                                      .parent("li")
                                      .siblings("li")
                                      .find(".submenu-indicator")
                                      .removeClass("submenu-indicator-up"),
                                    n(this)
                                      .closest(".nav-menu")
                                      .siblings(".nav-menu")
                                      .find(".submenu-indicator")
                                      .removeClass("submenu-indicator-up"),
                                    r.showSubmenu(
                                      n(this)
                                        .parent("a")
                                        .parent("li"),
                                      "slide"
                                    ),
                                    !1)
                                  : (n(this)
                                      .parent("a")
                                      .parent("li")
                                      .find(".submenu-indicator")
                                      .removeClass("submenu-indicator-up"),
                                    void r.hideSubmenu(
                                      n(this)
                                        .parent("a")
                                        .parent("li"),
                                      "slide"
                                    ))
                              )
                            })
                        : n(t)
                            .find(".nav-menu, .nav-dropdown")
                            .children("li")
                            .children("a")
                            .on(l, function(e) {
                              if (
                                (e.stopPropagation(),
                                e.preventDefault(),
                                r.hideSubmenu(
                                  n(this)
                                    .parent("li")
                                    .siblings("li"),
                                  r.settings.effect
                                ),
                                r.hideSubmenu(
                                  n(this)
                                    .closest(".nav-menu")
                                    .siblings(".nav-menu")
                                    .children("li"),
                                  "slide"
                                ),
                                "none" ==
                                  n(this)
                                    .siblings(".nav-submenu")
                                    .css("display"))
                              )
                                return (
                                  n(this)
                                    .children(".submenu-indicator")
                                    .addClass("submenu-indicator-up"),
                                  n(this)
                                    .parent("li")
                                    .siblings("li")
                                    .find(".submenu-indicator")
                                    .removeClass("submenu-indicator-up"),
                                  n(this)
                                    .closest(".nav-menu")
                                    .siblings(".nav-menu")
                                    .find(".submenu-indicator")
                                    .removeClass("submenu-indicator-up"),
                                  r.showSubmenu(n(this).parent("li"), "slide"),
                                  !1
                                )
                              if (
                                (n(this)
                                  .parent("li")
                                  .find(".submenu-indicator")
                                  .removeClass("submenu-indicator-up"),
                                r.hideSubmenu(n(this).parent("li"), "slide"),
                                "_blank" === n(this).attr("target") ||
                                  "blank" === n(this).attr("target"))
                              )
                                i.open(n(this).attr("href"))
                              else {
                                if (
                                  "#" === n(this).attr("href") ||
                                  "" === n(this).attr("href") ||
                                  "javascript:void(0)" === n(this).attr("href")
                                )
                                  return !1
                                i.location.href = n(this).attr("href")
                              }
                            }))
              }
            ;(r.callback = function(n) {
              s[n] !== a && s[n].call(t)
            }),
              r.init()
          }),
            (n.fn.navigation = function(i) {
              return this.each(function() {
                if (a === n(this).data("navigation")) {
                  var e = new n.navigation(this, i)
                  n(this).data("navigation", e)
                }
              })
            })
        })(jQuery, window, document);
        
        (function($) {
          "use strict"

          var $window = $(window)

          if ($.fn.navigation) {
            $("#navigation1").navigation()
            $("#always-hidden-nav").navigation({
              hidden: true
            })
          }

          $window.on("load", function() {
            $("#preloader").fadeOut("slow", function() {
              $(this).remove()
            })
          })
        })(jQuery)

        /* nav js */


    </script>

    @yield('script')

    @php
        echo get_setting('footer_script');
    @endphp

</body>
</html>
